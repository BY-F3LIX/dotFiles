#!/bin/bash

number='^[0-9]+$'
function focus_if_window {
    if [[ $1 =~ $number ]] ; then
        xdotool windowactivate --sync $1
        exit 0
    fi
}

# Fetch window ids from current desktop
options=""
for (( j=0; j<10; j++ )); do
#workspace=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2)
#echo $workspace

#for j in $workspace
#    do
window_ids+=($(xdotool search --desktop $j "." &))
done
size=${#window_ids[@]}
if [[ $size -eq 0 ]]; then
    #exit 0
    continue
fi

# Build window list options
#options=""
for (( i=0; i<$size; i++ )); do
    
    id=${window_ids[$i]}
    name=$(xdotool getwindowname $id)

    class=$(xprop -id $id | grep WM_CLASS | awk -F " " '{print $4}')
    class="${class%\"}"
    class="${class#\"}"

    # Cap class name to 16 characters 
    class=$(echo "$class" | cut -c 1-16)
    class="$(printf '%-16s' $class)"

    options+="$class \t$name\n"
    #echo $class
    #options+="\n"
done

options=${options%\\n}

# Focus selected window
#echo "options:"
#echo -e "$options"
result=$(echo -e "$options" | rofi -dmenu -i -format i -p "find: ")
if [ "$result" == "" ]; then
    exit 0
fi
focus_if_window "${window_ids[$result]}"
