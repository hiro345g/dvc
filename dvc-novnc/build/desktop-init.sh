#!/bin/bash
# /usr/local/share/desktop-init.sh

user_name="node"
group_name="node"
LOG=/tmp/container-init.log

export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-"autolaunch:"}"
export DISPLAY="${DISPLAY:-:1}"
export VNC_RESOLUTION="${VNC_RESOLUTION:-1440x768x16}" 
export LANG="${LANG:-"en_US.UTF-8"}"
export LANGUAGE="${LANGUAGE:-"en_US.UTF-8"}"

if [ -n "${VNC_PASSWORD+x}" ] && [ ! "${VNC_PASSWORD}" = "noPassword" ]; then
    if [ "$(id -u)" -ne 0 ]; then
        sudo sh -c "echo ${VNC_PASSWORD} | vncpasswd -f > /usr/local/etc/vscode-dev-containers/vnc-passwd"
    else
        sh -c "echo ${VNC_PASSWORD} | vncpasswd -f > /usr/local/etc/vscode-dev-containers/vnc-passwd"
    fi
fi

# Execute the command it not already running
# shellcheck disable=SC2086
startInBackgroundIfNotRunning()
{
    log "Starting $1."
    echo -e "\n** $(date) **" | sudoIf tee -a /tmp/$1.log > /dev/null
    if ! pgrep -x $1 > /dev/null; then
        keepRunningInBackground "$@"
        while ! pgrep -x $1 > /dev/null; do
            sleep 1
        done
        log "$1 started."
    else
        echo "$1 is already running." | sudoIf tee -a /tmp/$1.log > /dev/null
        log "$1 is already running."
    fi
}

# Keep command running in background
keepRunningInBackground()
{
    # shellcheck disable=SC2086
    ($2 bash -c "while :; do echo [\$(date)] Process started.; $3; echo [\$(date)] Process exited!; sleep 5; done 2>&1" | sudoIf tee -a /tmp/$1.log > /dev/null & echo "$!" | sudoIf tee /tmp/$1.pid > /dev/null)
}

# Use sudo to run as root when required
sudoIf()
{
    if [ "$(id -u)" -ne 0 ]; then
        sudo "$@"
    else
        "$@"
    fi
}

# Use sudo to run as non-root user if not already running
sudoUserIf()
{
    if [ "$(id -u)" -eq 0 ] && [ "${user_name}" != "root" ]; then
        sudo -u ${user_name} "$@"
    else
        "$@"
    fi
}

# Log messages
log()
{
    # shellcheck disable=SC2145
    echo -e "[$(date)] $@" | sudoIf tee -a $LOG > /dev/null
}

log "** SCRIPT START **"

# Start dbus.
log 'Running "/etc/init.d/dbus start".'
if [ -f "/var/run/dbus/pid" ] && ! pgrep -x dbus-daemon  > /dev/null; then
    sudoIf rm -f /var/run/dbus/pid
fi
sudoIf /etc/init.d/dbus start 2>&1 | sudoIf tee -a /tmp/dbus-daemon-system.log > /dev/null
while ! pgrep -x dbus-daemon > /dev/null; do
    sleep 1
done

# Startup tigervnc server and fluxbox
sudoIf rm -rf /tmp/.X11-unix /tmp/.X*-lock
mkdir -p /tmp/.X11-unix
sudoIf chmod 1777 /tmp/.X11-unix
sudoIf chown root:${group_name} /tmp/.X11-unix
if [ "$(echo "${VNC_RESOLUTION}" | tr -cd 'x' | wc -c)" = "1" ]; then VNC_RESOLUTION=${VNC_RESOLUTION}x16; fi
screen_geometry="${VNC_RESOLUTION%*x*}"
screen_depth="${VNC_RESOLUTION##*x}"

# Check if VNC_PASSWORD is set and use the appropriate command
common_options="tigervncserver ${DISPLAY} -geometry ${screen_geometry} -depth ${screen_depth} -rfbport 5901 -dpi ${VNC_DPI:-96} -localhost -desktop fluxbox -fg"

if [ -n "${VNC_PASSWORD+x}" ] && [ ! "${VNC_PASSWORD}" = "noPassword" ]; then
    if [ -e "/usr/local/etc/vscode-dev-containers/vnc-passwd" ]; then
        startInBackgroundIfNotRunning "Xtigervnc" sudoUserIf "${common_options} -passwd /usr/local/etc/vscode-dev-containers/vnc-passwd"
    else
        startInBackgroundIfNotRunning "Xtigervnc" sudoUserIf "${common_options} -SecurityTypes None"
    fi
else
    startInBackgroundIfNotRunning "Xtigervnc" sudoUserIf "${common_options} -SecurityTypes None"
fi

# Spin up noVNC if installed and not running.
# shellcheck disable=SC2009,SC2022,SC2062
if [ -d "/usr/local/novnc" ] && [ "$(ps -ef | grep /usr/local/novnc/noVNC*/utils/launch.sh | grep -v grep)" = "" ]; then
    keepRunningInBackground "noVNC" sudoIf "/usr/local/novnc/noVNC*/utils/launch.sh --listen 6080 --vnc localhost:5901"
    log "noVNC started."
else
    log "noVNC is already running or not installed."
fi

# Run whatever was passed in
if [ -n "" ]; then
    # shellcheck disable=SC2145
    log "Executing \"$@\"."
    exec ""
else
    log "No command provided to execute."
fi
log "** SCRIPT EXIT **"
