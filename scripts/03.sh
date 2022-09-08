#!/bin//bash
# Three's a charm. Write a script of your own choice

# This script gives will change all the occurences of specific file extension and
# change them to whatever extension you give it. I use it to change files to .test files

clear_this_line(){
        printf '\r'
        cols="$(tput cols)"
        for i in $(seq "$cols"); do
                printf ' '
        done
        printf '\r'
}

erase_lines(){
        # Default line count to 1.
        test -z "$1" && lines="1" || lines="$1"

        # This is what we use to move the cursor to previous lines.
        UP='\033[1A'

        # Exit if erase count is zero.
        [ "$lines" = 0 ] && return

        # Erase.
        if [ "$lines" = 1 ]; then
                clear_this_line
        else
                lines=$((lines-1))
                clear_this_line
                for i in $(seq "$lines"); do
                        printf "$UP"
                        clear_this_line
                done
        fi
}

draw_logo()
{
	echo '     ███        ▄████████    ▄████████     ███      ▄█     ▄████████ ▄██   ▄'
	echo ' ▀█████████▄   ███    ███   ███    ███ ▀█████████▄ ███    ███    ███ ███   ██▄'
	echo '    ▀███▀▀██   ███    █▀    ███    █▀     ▀███▀▀██ ███▌   ███    █▀  ███▄▄▄███'
	echo '     ███   ▀  ▄███▄▄▄       ███            ███   ▀ ███▌  ▄███▄▄▄     ▀▀▀▀▀▀███'
	echo '     ███     ▀▀███▀▀▀     ▀███████████     ███     ███▌ ▀▀███▀▀▀     ▄██   ███'
	echo '     ███       ███    █▄           ███     ███     ███    ███        ███   ███'
	echo '     ███       ███    ███    ▄█    ███     ███     ███    ███        ███   ███'
	echo '    ▄████▀     ██████████  ▄████████▀     ▄████▀   █▀     ███         ▀█████▀'
}

osascript -e "set Volume 5"

echo '------------------------'
echo 'ARE YOU READY TO TESTIFY'
echo '------------------------'
echo

for i in {1..5}
do
	sleep 0.3
	draw_logo
	sleep 0.3
	erase_lines 9
done

draw_logo
say welcome to testify
afplay ~/Downloads/Naruto\ -\ The\ Rising\ Fighting\ Spirit.wav &
audio=$(ps aux | grep afplay | awk '{print $2}')

while :
do
	echo
	echo '--------'
	echo 'USAGE'
	echo '--------'
	echo
	echo "Write 'ext' to change extensions, write 'stop' to stop this madness"
	echo
	read input
	if [ $input == 'stop' ]
	then
		kill -9 $!
		wait $! 2>/dev/null
		say testified
		exit
	fi
	if [ $input == 'ext' ]
	then
		echo -n "What file-extension do you want to change: "
		read FILE_NAME
		echo -n "Please choose what extension you want to give the files: "
		read EX_NAME
		echo "The extension will be now .$EX_NAME"
		for f in $(ls *.$FILE_NAME)
		do
				mv $f ${f%.$FILE_NAME}.$EX_NAME
				# ${string%substring} finds the shortest substring and deletes it
		done
		echo
		echo "Heres the new files:"
		ls *.$EX_NAME
	fi
done
