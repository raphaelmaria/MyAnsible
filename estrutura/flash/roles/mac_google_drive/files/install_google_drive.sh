# Script to download, Silent Install and then clean up once installed Google Drive
# Writen by twitter.com/richhickson
# www.RichardHickson.com

#Make temp folder for downloads.
mkdir "/tmp/filestream/";
cd "/tmp/filestream/";

#Download filestream.
curl -L -o /tmp/filestream/GoogleDriveFileStream.dmg "https://dl.google.com/drive-file-stream/GoogleDriveFileStream.dmg";

#Mount, Install, and unmount GoogleDriveFileStream.dmg
hdiutil mount GoogleDriveFileStream.dmg; 

sudo installer -pkg "/Volumes/Install Google Drive/GoogleDrive.pkg" -target "/Volumes/Macintosh HD"; 

hdiutil unmount "/Volumes/Install Google Drive/"

#Tidy up
sudo rm -rf /tmp/filestream/