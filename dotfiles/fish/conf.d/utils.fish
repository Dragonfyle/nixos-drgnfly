# @fish-lsp-disable

function wlat
    tail -n 30 -f (ls -rs modified | head -n 1)
end

#run live loggin of a file in arg1 with grep in arg2. uses last modified file in current dif if arg1 not provided.
function llog
    set -l file ''
    set -l grep ''

    if test (count $argv) -lt 2
        if test (count $arvg) -lt 1
            set file (ls -rs modified | head -n 1)
            tail -n 30 -f $file
        end
        set grep $argv[1]
    else
        set file $argv[1]
        set grep $argv[2]
    end

    if test -z $file
        set file (ls -rs modified | head -n 1)
    end

    tail -n 30 -f $file | grep $grkep
end

if command -q bluetoothctl
    alias headsetconnect 'bluetoothctl connect EC:66:D1:BC:C5:AA'
    alias headsetdisconnect 'bluetoothctl disconnect EC:66:D1:BC:C5:AA'
end

if command -q brightnessctl
    alias b 'sudo brightnessctl set'
end
