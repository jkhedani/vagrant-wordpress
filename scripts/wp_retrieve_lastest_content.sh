#!/bin/bash
# Retrieving Latest Content
# This script allows us to package all the latest content from a Wordpress
# server into the remote servers root directory.
#
# @author Justin Hedani
# @req    SSH keys enabling no-prompt SSH access between servers
# @note   This script may take a while depending on the size of the database,
#         uploads and plugin folders as well as the speed of your server.

# Global Variables

CONTENTDIR=site_latest

REMOTEUSER=littonbags
REMOTESERVER=littonbags.com
PRODUCTIONDBSERVER=localhost
PRODUCTIONDBNAME=wp_littonbags_production
PRODUCTIONDBUSER=littonbagsdata

PATHTOUPLOADS=/home/littonbags/public_html/wp-content/uploads
PATHTOPLUGINS=/home/littonbags/public_html/wp-content/plugins

# Authenticate database access
read -p "Authenticate database access by inputting your password:" password
PRODUCTIONDBPASS=$password

# Escape certain characters from user input (script will error out if brackets
# are not escaped in the string)
# http://stackoverflow.com/questions/407523/escape-a-string-for-a-sed-replace-pattern
PRODUCTIONDBPASS=$(echo $PRODUCTIONDBPASS | sed -e 's/[\/&]/\\&/g')

# Log into remote server and place all the latest content in a neat folder at
# the root of the remote server
echo 'Packaging latest content on the server...'
# OPTION A: Use this command for servers where the mysql server is local to the remote
ssh $REMOTEUSER@$REMOTESERVER "mkdir $CONTENTDIR && cd $CONTENTDIR && mysqldump --add-drop-table -u $PRODUCTIONDBUSER -p$PRODUCTIONDBPASS $PRODUCTIONDBNAME > latest.sql && cp -r $PATHTOUPLOADS . && cp -r $PATHTOPLUGINS . && exit"
# OPTION B: Use this command for when mysql server is at a different location from remote
# ssh $REMOTEUSER@$REMOTESERVER "mysqldump --add-drop-table -h internal-db.s171909.gridserver.com -u db171909 -p823+_Qc7\)j db171909_wp_basichawaiian > wp_bascihawaiian.sql && cp -r domains/basichawaiian.com/html/wp-content/uploads . && cp -r domains/basichawaiian.com/html/wp-content/plugins . && exit"


# Bring down all the content to the downloads folder
echo 'Bringing down yo content...'
scp -r $REMOTEUSER@$REMOTESERVER:~/$CONTENTDIR/ ~/Downloads/

# echo 'Now downloading database...'
# scp -r -i ~/.ssh/id_rsa_basichawaiian basichawaiian.com@s171909.gridserver.com:~/wp_bascihawaiian.mysql.latest ~/Desktop/latest_content
#
# echo 'Now downloading uploads...'
# scp -r -i ~/.ssh/id_rsa_basichawaiian basichawaiian.com@s171909.gridserver.com:~/uploads ~/Desktop/latest_content
#
# echo 'Now downloading plugins...'
# scp -r -i ~/.ssh/id_rsa_basichawaiian basichawaiian.com@s171909.gridserver.com:~/plugins ~/Desktop/latest_content
#
echo 'Done!'

# Database Retrieval
# Dump the latest version of the database into
#ssh -i ~/.ssh/id_rsa_basichawaiian basichawaiian.com@s171909.gridserver.com
#  'mysqldump --add-drop-table -h internal-db.s171909.gridserver.com -u db171909 -p823+_Qc7\)j db171909_wp_basichawaiian > wp_bascihawaiian.mysql.latest'

# Uploads Retrieval (Copy)
# Get a copy of the latest uploads directory
#cp -r domains/basichawaiian.com/html/wp-content/uploads .

# Plugins Retrieval (Copy)
# Get a copy of the latest plugins directory
#cp -r domains/basichawaiian.com/html/wp-content/plugins .
