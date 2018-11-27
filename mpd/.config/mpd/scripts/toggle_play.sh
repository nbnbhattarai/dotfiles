#!/usr/bin/bash

if [ -x /usr/bin/notify-send ]
then
	status=`mpc status | egrep playing`

	# check if playing
	if [ -n "$status" ]
	then
		notify-send -t 5 -i /usr/share/icons/gnome/scalable/actions/media-playback-pause-symbolic.svg "MPD: Paused" "`mpc status | head -1`";
		mpc pause >> status.txt
	else
		# is it paused
		if [ -n "`mpc status | egrep paused`" ]
		then
			notify-send -t 5 -i /usr/share/icons/gnome/scalable/actions/media-playback-start-symbolic.svg "MPD: Playing" "`mpc status | head -1`"
			mpc play >> status.txt
		else 
			notify-send -t 5 -i /usr/share/icons/gnome/scalable/actions/media-playback-stop-symbolic.svg "MPD: Stopped!"
		fi
	fi
else
	echo "notify-send not installed"
	exit -1
fi

exit 0