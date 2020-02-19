check="$(dropbox status)"
echo $check

~/.program/Nextcloud* &
if [ "$check" = "Dropbox isn't running!" ]; then
    notify-send --urgency=low -t 4000 "Dropbox starting"
    echo "Dropbox starting..."
    dropbox start 2> temp123456789
    rm temp123456789
else
    notify-send --urgency=low -t 3000 "Dropbox running!"
    echo "Dropbox running!"
fi

firsttime=$SECONDS
while [ "$(dropbox status)" != "Up to date" ] && [ "$(dropbox status)" != "Dropbox isn't running!" ]; do
    sleep 2
done

secondtime=$( expr $SECONDS - $firsttime)
dropbox stop
echo "Up to date"
echo "took $secondtime seconds"
#notify-send --urgency=low -t 5000 "Dropbox is up to date! " "it took $secondtime seconds"
notify-send --urgency=low -t 5000 "Dropbox is up to date! " "it took $(($secondtime / 60)) minutes and $(($secondtime % 60)) seconds"
sleep 15
echo "kill nextcloud"
while [[ $(pidof Nextcloud-2.5.2-x86_64.AppImage) != "" ]]; do
    for a in $(pidof Nextcloud-2.5.2-x86_64.AppImage); do kill $a; done
    sleep 1
done
sleep 5
while [[ $(pidof Nextcloud-2.5.2-x86_64.AppImage) != "" ]]; do
    for a in $(pidof Nextcloud-2.5.2-x86_64.AppImage); do kill $a; done
    sleep 1
done
