#!/bin/bash

set -e

echo "🧭 Fedora Repository Manager (Enhanced)"
echo "----------------------------------------"

repo_dir="/etc/yum.repos.d"
repo_files=($(ls "$repo_dir"/*.repo 2>/dev/null))

if [ ${#repo_files[@]} -eq 0 ]; then
  echo "❌ No repository files found in $repo_dir"
  exit 1
fi

echo "📦 Found ${#repo_files[@]} repositories:"
echo

# Loop through .repo files
for repo_file in "${repo_files[@]}"; do
  echo "▶️  File: $(basename "$repo_file")"
  echo "--------------------------------"
  grep -E '^\[|^name=|^baseurl=|^enabled=|^gpgcheck=' "$repo_file" | sed 's/^/   /'
  echo

  while true; do
    echo "Options:"
    echo "  [k]eep      - leave the repo as-is"
    echo "  [d]isable   - disable the repo (enabled=0)"
    echo "  [r]emove    - delete the .repo file entirely"
    echo "  [s]kip      - skip without changes"
    read -rp "What do you want to do with this repo? [k/d/r/s]: " action

    case "$action" in
      k|K )
        echo "✅ Keeping $(basename "$repo_file")"
        break
        ;;
      d|D )
        echo "🔕 Disabling repo..."
        sudo sed -i 's/^enabled=.*/enabled=0/' "$repo_file"
        echo "✅ Disabled $(basename "$repo_file")"
        break
        ;;
      r|R )
        echo "🗑️  Removing $(basename "$repo_file")"
        sudo rm -f "$repo_file"
        break
        ;;
      s|S )
        echo "⏭️  Skipping..."
        break
        ;;
      * )
        echo "❗ Please enter one of: k (keep), d (disable), r (remove), s (skip)."
        ;;
    esac
  done

  echo
done

echo "🎉 Repository management complete."

