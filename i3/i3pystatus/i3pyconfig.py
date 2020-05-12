"""
File: $HOME/.config/i3pystatus/i3pyconfig.py
Author: Colps
Github: https://github.com/colpshift
Description: i3pystatus configuration
Last Modified: June 14, 2019
"""
#
# https://i3pystatus.readthedocs.io/en/latest/i3pystatus.html#i3
# https://fontawesome.com/cheatsheet?from=io
# https://www.colorhexa.com/e60053
#
# color     green   color ='#00ff00',
# default   gray    color ='#c2c2c2',
# warning   orange  color ='#ffa500',
# critical  red     color ='#ff0000',

import configparser
from i3pystatus import Status
from i3pystatus.mail import imap
from i3pystatus.network import Network
from i3pystatus.online import Online
from i3pystatus.updates import pacman
from i3pystatus.weather import weathercom
import i3pystatus.online

STATUS = Status(logfile='$HOME/.config/i3/i3pystatus/i3pystatus.log')

## Parser
CONFIG = configparser.ConfigParser()
CONFIG.read("/etc/.config_gmail.txt")
GMAILPASS = CONFIG.get("configuration", "password")

# show clock
STATUS.register(
    "clock",
    color="#6bb6ff",
    format=" %a %g/%m/%d %H:%M |",
    on_leftclick="thunderbird",
)

# Show weather
#STATUS.register(
#    "weather",
#    format="[{icon}] {current_temp}{temp_unit}",
#    interval=900,
#    colorize=True,
#    hints={"markup": "pango"},
#    backend=weathercom.Weathercom(
#        location_code="BRXX0241:1:BR",
#        units="metric",
#    ),
#)

# check email
if internet():
    STATUS.register(
        "mail",
        backends=[
            imap.IMAP(
                account="Gmail",
                host="imap.gmail.com",
                username="marcos.colpani@gmail.com",
                password=GMAILPASS,
            )
        ],
        color="#c2c2c2",
        color_unread="#ffa500",
        format_plural=(" {current_unread}/{unread}"),
        format=" {current_unread}/{unread}",
        on_leftclick="/bin/thunderbird",
        hide_if_null=True,
    )

# Show/change volume using PA
STATUS.register("pulseaudio",
                format=" {volume}%",
                format_muted=" {volume_bar} Mute")

## show backlight %
STATUS.register(
    "backlight",
    base_path="/sys/class/backlight/intel_backlight/",
    format=" {percentage}%",
)

# show battery status
STATUS.register(
    "battery",
    format="[{status}]{remaining}",
    interval=5,
    alert=True,
    alert_percentage=15,
    color="#ffa500",
    charging_color="#00ff00",
    critical_color="#ff0000",
    full_color="#c2c2c2",
    status={
        "CHR": " ",
        "DPL": " ",
        "DIS": " ",
        "FULL": " 100%"
    },
)

# internet status
STATUS.register(
    Online,
    color="#00ff00",
    color_offline="#ff0000",
    format_online="  ",
    format_offline="  ",
    interval=10,
)

# show network interface and speed
STATUS.register(
    Network,
    hints={"markup": "pango"},
    dynamic_color=True,
    # detect_active=True,
    # next_if_down=True,
    # format_active_up="{wlp3s0} {enp2s0}",
    # format_up=" {interface} {network_graph_recv}{bytes_recv}KB/s",
    format_up=" {interface:}  {bytes_recv}KB  {bytes_sent}KB",
    format_down=" {interface}: DOWN",
    interface="enp2s0",
)

# show available memory
STATUS.register(
    "mem",
    color="#c2c2c2",
    warn_color="ffa500",
    alert_color="#ff0000",
    format=" {used_mem} {avail_mem}G",
    warn_percentage=70,
    alert_percentage=90,
    divisor=1024**3,
    on_leftclick="/home/colps/.scripts/urxvts.sh -e htop",
)

# show cpu temp
STATUS.register(
    "temp",
    format=" {temp} °C",
    hints={"markup": "pango"},
    #lm_sensors_enabled=True,
    #dynamic_color=True,
)

# show cpu usage
STATUS.register(
    "load",
    critical_color="#ff0000",
    format=" {avg5} {tasks}",
    on_leftclick="/home/colps/.scripts/urxvts.sh -e htop",
)

# show updates
STATUS.register(
    "updates",
    notification_icon="software-update-available",
    color="#ffa500",
    format=" {count}",
    color_no_updates="#c2c2c2",
    format_no_updates="  ",
    backends=[pacman.Pacman(),],
    )

# show system information
STATUS.register("uname",
                format=" {release}",
                on_leftclick="/home/colps/.scripts/urxvts.sh uname -a")

# show uptime information
STATUS.register(
    "uptime",
    color="#00ff00",
    alert=True,
    color_alert="#ffa500",
    format=" {days}d {hours}h {mins}m",
)

# Show keyboard locks
STATUS.register(
    "keyboard_locks",
    format="{caps} {num}",
    color="#ff0000",
    caps_on="Caps On",
    num_on="Num On",
    caps_off="",
    num_off="",
)

STATUS.run()
