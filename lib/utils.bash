#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/openfga/cli"
TOOL_NAME="fga-cli"
TOOL_TEST="fga --version"
TOOL_CMD="$(echo "$TOOL_TEST" | cut -d' ' -f1)"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url os arch
	version="$1"
	filename="$2"

	# Source: https://stackoverflow.com/a/18434831
	case "$OSTYPE" in
	darwin*)
		os="darwin"
		arch="$(uname -m)"
		;;
	linux*)
		os="linux"
		arch="$(uname -m)"
		;;
	msys*) os="windows" ;;
	cygwin*) os="windows" ;;
	*) fail "unknown/unsupported OS: $OSTYPE" ;;
	esac

	arch="$(arch)"
	case $arch in
	i386) arch="386" ;;
	i686) arch="386" ;;
	x86_64) arch="amd64" ;;
	arm) [ "$(uname -m)" = "aarch64" ] && arch="arm64" || arch="arm" ;;
	esac

	url="$GH_REPO/releases/download/v${version}/${TOOL_CMD}_${version}_${os}_${arch}.tar.gz"

	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download ${url}"

	# TODO: Validate SBOM
	# e.g. `sbom-tool validate -b <drop path> -o <output path> -mi SPDX:2.2`
	# We need to check if sbom-tool is installed first, and only run validation then
	# sbom_url = "${url}.sbom.json"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		test -x "$install_path/${TOOL_CMD}" || fail "Expected $install_path/${TOOL_CMD} to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
