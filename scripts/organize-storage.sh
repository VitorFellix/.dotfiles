#!/bin/bash

# organize_files.sh - Organize files into a structured directory layout
# Usage: ./organize_files.sh [--dry-run] [--source /path/to/source] [--dest /path/to/destination]

# Default settings
DRY_RUN=false
SOURCE_DIR=$(pwd)
DEST_DIR="/mnt/Storage"

# Process command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --source)
      SOURCE_DIR="$2"
      shift 2
      ;;
    --dest)
      DEST_DIR="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: ./organize_files.sh [--dry-run] [--source /path/to/source] [--dest /path/to/destination]"
      exit 1
      ;;
  esac
done

# Function to create directory if it doesn't exist
create_dir() {
  local dir=$1
  if [ "$DRY_RUN" = true ]; then
    echo "Would create directory: $dir"
  else
    mkdir -p "$dir"
    echo "Created directory: $dir"
  fi
}

# Function to synchronize files using rsync
sync_files() {
  local src=$1
  local dest=$2
  
  # Check if source exists
  if [ ! -e "$src" ]; then
    echo "Source does not exist: $src"
    return
  fi
  
  if [ "$DRY_RUN" = true ]; then
    echo "Would sync: $src → $dest"
    rsync -av --dry-run "$src" "$dest"
  else
    echo "Syncing: $src → $dest"
    rsync -av "$src" "$dest"
  fi
}

# Function to sync a directory and its contents
sync_dir() {
  local src=$1
  local dest=$2
  
  # Check if source exists
  if [ ! -d "$src" ]; then
    echo "Source directory does not exist: $src"
    return
  fi
  
  create_dir "$dest"
  
  if [ "$DRY_RUN" = true ]; then
    echo "Would sync directory: $src/* → $dest/"
    rsync -av --dry-run "$src/" "$dest/"
  else
    echo "Syncing directory: $src/* → $dest/"
    rsync -av "$src/" "$dest/"
  fi
}

echo "=========================================================="
echo "File Organization Script"
echo "=========================================================="
echo "Source directory: $SOURCE_DIR"
echo "Destination directory: $DEST_DIR"
if [ "$DRY_RUN" = true ]; then
  echo "Mode: DRY RUN (no files will be copied)"
else
  echo "Mode: LIVE RUN (files will be copied)"
fi
echo "=========================================================="

# Create main directory structure
create_dir "$DEST_DIR/dev/web"
create_dir "$DEST_DIR/dev/godot"
create_dir "$DEST_DIR/dev/workstation"
create_dir "$DEST_DIR/docs/books"
create_dir "$DEST_DIR/docs/personal"
create_dir "$DEST_DIR/docs/manuals"
create_dir "$DEST_DIR/docs/passwords"
create_dir "$DEST_DIR/media/images/references"
create_dir "$DEST_DIR/media/images/artwork"
create_dir "$DEST_DIR/media/images/wallpapers"
create_dir "$DEST_DIR/media/videos"
create_dir "$DEST_DIR/tools/installers"
create_dir "$DEST_DIR/tools/fonts"
create_dir "$DEST_DIR/tools/configs"
create_dir "$DEST_DIR/projects/3d-printing"
create_dir "$DEST_DIR/projects/obsidian"
create_dir "$DEST_DIR/archives/backups"

echo "=========================================================="
echo "Starting file migration..."
echo "=========================================================="

# DEV directory organization
sync_dir "$SOURCE_DIR/website" "$DEST_DIR/dev/web"
sync_dir "$SOURCE_DIR/Game Development/Godot" "$DEST_DIR/dev/godot"
sync_dir "$SOURCE_DIR/workstation" "$DEST_DIR/dev/workstation"

# DOCS directory organization
# Books
sync_dir "$SOURCE_DIR/books" "$DEST_DIR/docs/books"
sync_dir "$SOURCE_DIR/Documents/books" "$DEST_DIR/docs/books"

# Personal documents
sync_dir "$SOURCE_DIR/digitalizados" "$DEST_DIR/docs/personal"
sync_dir "$SOURCE_DIR/Documents/digitalizados" "$DEST_DIR/docs/personal"

# Manuals - technical documentation from various sources
# If there are specific manuals, they would go here

# Passwords
sync_dir "$SOURCE_DIR/senhas" "$DEST_DIR/docs/passwords"
sync_dir "$SOURCE_DIR/Documents/senhas" "$DEST_DIR/docs/passwords"

# MEDIA directory organization
# Images - references, artwork, etc.
sync_dir "$SOURCE_DIR/Pictures/references" "$DEST_DIR/media/images/references"
sync_dir "$SOURCE_DIR/Pictures/sketchs" "$DEST_DIR/media/images/artwork"
sync_dir "$SOURCE_DIR/Pictures/paintings" "$DEST_DIR/media/images/artwork"
sync_dir "$SOURCE_DIR/Pictures/paitings" "$DEST_DIR/media/images/artwork" # Note: This seems to be a typo in the original structure

# TOOLS directory organization
# Installers - all setup and installer files
sync_files "$SOURCE_DIR/Bambu_Studio_win_public-v02.00.03.54-20250424182834.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/Firefox Installer.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/SpotifySetup.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/SteamSetup.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/Thunderbird Setup 137.0.1.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/WhatsApp Installer.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/EpicInstaller-18.5.0.msi" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/IRPF2025Win64v1.2.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/K-Lite_Codec_Pack_1885_Standard.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/DiagnosticoBB.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/DuckDuckGo.appinstaller" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/NVIDIA_app_v11.0.3.218.exe" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/transmission-4.1.0-beta.2+rac5c9e082d-x64.msi" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/comfyui.tar.xz" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/Documents/comfyui.tar.xz" "$DEST_DIR/tools/installers/"
sync_files "$SOURCE_DIR/btrfs-1.9.zip" "$DEST_DIR/tools/installers/"

# Fonts
sync_dir "$SOURCE_DIR/fonts" "$DEST_DIR/tools/fonts"
sync_dir "$SOURCE_DIR/Documents/fonts" "$DEST_DIR/tools/fonts"

# Configs - configuration backups
# Any specific config files would be synced here

# PROJECTS directory organization
# 3D Printing
sync_dir "$SOURCE_DIR/3D Print" "$DEST_DIR/projects/3d-printing"

# Obsidian vaults
sync_dir "$SOURCE_DIR/Obsidian Vault" "$DEST_DIR/projects/obsidian"

# ARCHIVES directory organization
# Backups
sync_files "$SOURCE_DIR/Personal Vault Backup.tar.gz" "$DEST_DIR/archives/backups/"
sync_files "$SOURCE_DIR/Documents/Personal Vault Backup.tar.gz" "$DEST_DIR/archives/backups/"
sync_files "$SOURCE_DIR/user-backup-1.tar.xz" "$DEST_DIR/archives/backups/"
sync_files "$SOURCE_DIR/Documents/user-backup-1.tar.xz" "$DEST_DIR/archives/backups/"

# PS1 directory (game ROMs)
create_dir "$DEST_DIR/media/games/ps1"
sync_dir "$SOURCE_DIR/ps1" "$DEST_DIR/media/games/ps1"
sync_dir "$SOURCE_DIR/Documents/ps1" "$DEST_DIR/media/games/ps1"

echo "=========================================================="
echo "Organization complete!"
echo "=========================================================="
if [ "$DRY_RUN" = true ]; then
  echo "This was a dry run. No files were actually copied."
  echo "Run without --dry-run to perform the actual organization."
else
  echo "Files have been organized at: $DEST_DIR"
  echo "Original files remain in their source locations."
fi
echo "=========================================================="
