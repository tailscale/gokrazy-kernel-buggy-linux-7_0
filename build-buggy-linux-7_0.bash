#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")" && pwd)"
kernel_url="https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.tar.xz"
tarball="${repo_dir}/$(basename "${kernel_url}")"
srcdir="${repo_dir}/linux-7.0"

if [[ ! -f "${tarball}" ]]; then
  curl -fL "${kernel_url}" -o "${tarball}"
fi

if [[ ! -d "${srcdir}" ]]; then
  tar -C "${repo_dir}" -xf "${tarball}"
fi

cp "${repo_dir}/config.addendum.txt" "${srcdir}/.config.addendum.txt"

cd "${srcdir}"
make defconfig
cat .config.addendum.txt >> .config
make olddefconfig
make bzImage "-j$(nproc)"
cp arch/x86/boot/bzImage "${repo_dir}/vmlinuz"
echo "wrote ${repo_dir}/vmlinuz"
