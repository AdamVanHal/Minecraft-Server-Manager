#!/bin/bash
#Connects to minecraft server with screen and gets current user count. If empty for long enough it closes the server.
#name of server to find with screen
SERVERNAME="FTB"
#location of log files
LOGS="/FTBUR/logs/latest.log"
#how long to idle in seconds before closing server
IDLETIME=30*60
#how frequently to check for users in seconds
CHECKFREQUENCY=5*60
SERVERSTATUS="running"

function playercount(){
#send list command to server usind the -X stuff command from screen. Important to select the 0 window since screen may not have been connected to yet.
screen -S $SERVERNAME -p 0 -X stuff 'list\n'
#get results of command by reading the last line of the server log and trimming to only the 6th field with our result
echo $(tail -n 1 $LOGS | cut -f 6 -d ' ')
}

