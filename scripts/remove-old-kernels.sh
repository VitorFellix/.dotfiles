#!/usr/bin/env bash

old_kernels=($(dnf repoquery --installonly --latest-limit=-1 -q))
if [ "${#old_kernels[@]}" -eq 0 ]; then
    echo "no old kernels found"
    exit 0
fi

if ! dnf remove "${old_kernels[@]}"; then
    echo "failed to remove old kernels"
    exit 1
fi

echo "removed old kernels"
exit 0
