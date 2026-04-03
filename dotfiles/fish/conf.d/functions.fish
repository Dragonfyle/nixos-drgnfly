function resrc
    source ~/.config/fish/config.fish
end

if command -q docker
    function d
        docker $argv
    end
end

function c
    conf $argv
end

if command -q eza
    function ll
        eza -l $argv
    end

    function ls
        eza $argv
    end

    function ltr
        eza -T --git-ignore $argv
    end
end

function ..
    cd ..
end

function ...
    cd ../..
end

function .3
    cd ../../..
end

function .4
    cd ../../../../
end

function .5
    cd ../../../../../
end

function h
    history $argv
end

function now
    date +"%T"
end

if command -q npm
    function nrd
        npm run dev $argv
    end
end

if command -q nvim
    function vim
        nvim $argv
    end
end

if command -q wl-copy
    function yy
        wl-copy $argv
    end
end

if command -q wl-paste
    function p
        wl-paste $argv
    end
end

if command -q bluetoothctl
    function bton
        bluetoothctl power on $argv
    end

    function btoff
        bluetoothctl power off $argv
    end
end

if command -q xdg-open
    function o
        xdg-open $argv >/dev/null 2>&1 &
    end
end

if command -q run0
    function 0
        run0 $argv
    end
end

function newest
    ls -rs changed | head -n1
end

function mktouch
    mkdir -p (dirname $argv)
    touch $argv
end

if command -q vboxmanage
    function vb
        vboxmanage $argv
    end
end

if command -q fzf
    function ccwt
        set -l selected (git worktree list --porcelain 2>/dev/null\
            | awk '/worktree /{print $2}' | fzf)

        if test -n "$selected"
            cd "$selected"
            claude
        end
    end
end

function mcd
    mkdir $argv
    cd $argv[1]
end
