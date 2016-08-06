## RANDOM SCRIPTS
murar() {
    for f in *
    do	
	unrar e $f/*.rar $1/$f &&	
    done
    }

photosort() {
    for f in *.jpg
    do
	mkdir $(identify -verbose $f | grep exif:DateTime: | cut -c20-29)
	mv $f $(identify -verbose $f | grep exif:DateTime: | cut -c20-29)
    done
}

remv() {
    mkdir ../tmp
    cp -ra $1 ../tmp/
    rm -r $1
    mv ../tmp/$1 .
    rmdir ../tmp
}

splitflac() {
    if [ -f "$1" ]; then
	i=0
	for cuefile in *.cue; do
	    i=$(($i + 1))
	done
	if [ $i -eq 1 ]; then
	    # precies 1 cuesheet gevonden
	    if grep -q "INDEX 01 00:00:00" *.cue ; then
		nice shntool split -t "%n %t" -f *.cue "$1"
	    else
		echo "The first track has a pre-gap. Shntool will cut that off and put it in a seperate file."
		echo "You don't want that. Please modify the cuesheet from:"
		grep -m1 "INDEX 00" *.cue
		grep -m1 "INDEX 01" *.cue
		echo "to:"
		echo "    INDEX 01 00:00:00"
		exit 1
	    fi
	elif [ $i -eq 0 ]; then
	    echo "No cuesheet found in the current directory."
	    exit 1
	elif [ $i -gt 1 ]; then
	    echo "$i cuesheets found in the current directory. Please remove the superfluous cuesheets."
	    exit 1
	fi
    else
	echo "Split image file (flac, ape, wav, etc.) according to cue-file."
	echo "Output files are in FLAC."
	echo "Usage: `basename $0` <image-file>"
	exit 1
    fi

    echo
    album=`grep -m 1 TITLE *.cue | cut -d\" -f2`
    artist=`grep -m 1 PERFORMER *.cue | cut -d\" -f2`

    for file in [0-9]*.wav; do
	echo "Encoding $file"

	if [[ ${file:0:1} == 0 ]] ; then
	    tracknr=${file:1:1}
	else
	    tracknr=${file:0:2}
	fi
	title=`echo ${file:2} | sed -e "s/.wav$//"`

	nice flac -s -T "artist=$artist" -T "album=$album" -T "title=$title" \
	     -T "tracknumber=$tracknr" "$file" && rm "$file"
    done
}

sql() {
    echo "$1\n\n" >> Dropbox/LiU/TDDD12/labs/lab1
    mysql -u root -p tddd12 -e $1 -t >> Dropbox/LiU/TDDD12/labs/lab1
    echo '\n' >> Dropbox/LiU/TDDD12/labs/lab1
}


temp(){
    test -e /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input
    if [ $? -eq 0 ]
    then
	sed -i '/hwmon[0-9]/{s//hwmon0/;h};${x;/./{x;q0};x;q1}' /home/splatrat/.config/i3status.conf
	print "\x1b[32;1mhwmon0 set\x1b[0m"
    else
	test -e /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input
	if [ $? -eq 0 ]
	then
	    sed -i '/hwmon[0-9]/{s//hwmon1/;h};${x;/./{x;q0};x;q1}' /home/splatrat/.config/i3status.conf
	    print "\x1b[32;1mhwmon1 set\x1b[0m"
	else
	    sed -i '/hwmon[0-9]/{s//hwmon2/;h};${x;/./{x;q0};x;q1}' /home/splatrat/.config/i3status.conf
	    print "\x1b[32;1mhwmon2 set\x1b[0m"
	fi
    fi
}
pint(){
    cd ~/Dropbox/LiU/TDIU16/pintos/src/userprog &&
	pintos -p ../examples/$1 -a $1 -k --fs-disk=2 \
	       -- -f -q run $1 $2
}

pgdb(){
    cd ~/Dropbox/LiU/TDIU16/pintos/src/userprog &&
	debugpintos --fs-disk=2 -p ../examples/$1 -a $1 \
		    -- -f run $1 $2
}
dbgp(){
    cd ~/Dropbox/LiU/TDIU16/pintos/src/userprog &&
	pintos-gdb build/kernel.o
}


mssh(){
    print "\x1b[33;1mMounting remote filesystems ...\x1b[31;1m"
    sshfs -o follow_symlinks splatrat@oscpe262.ddns.net:/home/splatrat /home/splatrat/Betelgeuse -C -p 4163
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m~/Betelgeuse mounted successfully!\x1b[0m"
    else
	print "\x1b[31;1mMounting ~/Betelgeuse failed!\x1b[0m"
    fi
    sshfs -o follow_symlinks splatrat@oscpe262.ddns.net:/ZFS /ZFS -C -p 4163
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m/ZFS mounted successfully!\x1b[0m"
    else
	print "\x1b[31;1mMounting /ZFS failed!\x1b[0m"
    fi
    sshfs -o follow_symlinks splatrat@oscpe262.ddns.net:/ZFS/Music /home/splatrat/Music -C -p 4163
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m~/Music mounted successfully!\x1b[0m"
    else
	print "\x1b[31;1mMounting ~/Music failed!\x1b[0m"
    fi
    sshfs -o follow_symlinks splatrat@oscpe262.ddns.net:/ZFS/Videos /home/splatrat/Videos -C -p 4163
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m~/Videos mounted successfully!\x1b[0m"
    else
	print "\x1b[31;1mMounting ~/Videos failed!\x1b[0m"
    fi
}
ussh(){
    print "\x1b[33;1mUnmounting remote filesystems ...\x1b[31;1m"
    fusermount -u /home/splatrat/Betelgeuse
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m~/Betelgeuse unmounted successfully!\x1b[31;1m"
    fi
    fusermount -u /ZFS
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m/ZFS unmounted successfully!\x1b[31;1m"
    fi
    fusermount -u ~/Music
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m~/Music unmounted successfully!\x1b[31;1m"
    fi
    fusermount -u ~/Videos
    if [ $? -eq 0 ]
    then
	print "\x1b[32;1m~/Videos unmounted successfully!\x1b[31;1m"
    fi
}

xoff(){
    xset dpms 0 0 0
    xset -dpms
    xset s 0 0
    xset s noblank
    xset s noexpose
    xset s off
}


