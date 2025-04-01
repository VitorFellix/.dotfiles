!#/bin/bash
cd /tmp/
echo 'downloading discord...'
# TODO: fix the download
wget "https://discord.com/api/download?platform=linux&format=tar.gz"
echo 'untar discord...'
tar -xzf discord*
echo 'moving discord to ~/Applications...'
mv Discord ~/Applications
echo 'creating link from ~/Applications to .local/bin/discord...'
ln -s ~/Applications/Discord/Discord ~/.local/bin/discord 
echo 'done installing discord...'
