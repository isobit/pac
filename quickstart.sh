#!/bin/bash

function log_info {
    echo "$(tput setaf 4)==> $1$(tput sgr0)" >&2
}
function log_warn {
    echo "$(tput setaf 3)WARNING: $1$(tput sgr0)" >&2
}
function log_error {
    echo "$(tput setaf 1)ERROR: $1$(tput sgr0)" >&2
}

# Try to detect if we are root
if [ "$(whoami)" != "root" ]; then
    use_sudo=true
fi
function do_sudo {
    if [ "$use_sudo" = true ]; then
        sudo $@
    else
        $@
    fi
}

# Match any [options]
while :
do
    case "$1" in
        -n | --noconfirm)
            noconfirm=true
            shift
            ;;
        --) # End of all options
            shift
            break
            ;;
        -*)
            log_error "Unknown option: $1"
            break
            ;;
        *)  # No more options
            break
            ;;
    esac
done

log_info "Cloning pac repo to /tmp/pac"
git clone https://github.com/joshglendenning/pac.git /tmp/pac

log_info "Installing pac to /usr/bin/"
do_sudo install /tmp/pac/bin/pac /usr/bin/pac

if [ "$noconfirm" = true ]; then
    install_yaourt=true
else
    read -p "Use yaourt (y/n)?" -n 1 choice; echo
    case "$choice" in 
        y|Y) 
            install_yaourt=true
            ;;
        n|N ) 
            install_yaourt=false
            ;;
        *) 
            log_error "invalid choice"
            exit 1
            ;;
    esac
fi
if [ "$install_yaourt" = true ]; then
    log_info "Creating default ~/.yaourtrc"
    echo "BUILD_NOCONFIRM=1\nEDITFILES=0" > ~/.yaourtrc
    log_info "Installing yaourt"
    do_sudo pac update --noconfirm
    do_sudo pac install yaourt --noconfirm
fi
echo "Done!"
