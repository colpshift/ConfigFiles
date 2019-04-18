#
"""
File: i3_pystatus-config.py / i3pyconfig.py
Author: Colps
Github: https://github.com/colpshift
Description: i3 pystatus configuration file
Last Modified: 11/02/2019 02:14
"""
# https://i3pystatus.readthedocs.io/en/latest/i3pystatus.html#i3
# https://fontawesome.com/cheatsheet?from=io
# https://www.colorhexa.com/e60053
#
# color     green   color ='#00ff00',
# default   gray    color ='#c2c2c2',
# warning   orange  color ='#ffa500',
# critical  red     color ='#ff0000',

from configparser import ConfigParser
from i3pystatus import Status
from i3pystatus.network import Network
from i3pystatus.online import Online
from i3pystatus.core.util import internet
from i3pystatus.mail import imap

# Parser
CONFIG = ConfigParser()
CONFIG.read("/etc/.config_gmail.txt")
GMAILPASS = CONFIG.get("configuration", "password")

STATUS = Status()

# show clock
STATUS.register(
    "clock",
    color='#6bb6ff',
    format=" %d/%m/%y  %k:%M",
    on_leftclick = "chromium https://calendar.google.com/calendar/r",
)

# check email
if internet():
    STATUS.register(
        "mail",
        backends=[imap.IMAP(
            account="Gmail",
            host="imap.gmail.com",
            username="marcos.colpani@gmail.com",
            password=GMAILPASS)],
        color='#c2c2c2',
        color_unread='#ffa500',
        format_plural=(" {current_unread}/{unread}"),
        format=" {current_unread}/{unread}",
        on_leftclick="chromium https://mail.google.com/mail/u/0/#inbox",
        hide_if_null=False,
    )

# show/change volume using PA
STATUS.register(
    "pulseaudio",
    format=" {volume}%",
    format_muted=" Mute",
)

# show backlight %
STATUS.register(
    "backlight",
    base_path="/sys/class/backlight/intel_backlight/",
    format=" {percentage}%",
)

# show battery status
STATUS.register(
    'battery',
    format="[{status} ]{remaining}",
    interval=5,
    alert=True,
    alert_percentage=15,
    color='#ffa500',
    charging_color='#00ff00',
    critical_color='#ff0000',
    full_color='#c2c2c2',
    status={
        "CHR":"",
        "DPL":"",
        "DIS":"",
        "FULL":""},
)

# internet status
STATUS.register(
    Online,
    color='#00ff00',
    color_offline='#ff0000',
    format_online="",
    format_offline="",
    interval=10,
)

# show network speed
STATUS.register(
    Network,
    dynamic_color=True,
    format_up=" {interface:.6}  {bytes_recv}K  {bytes_sent}K",
    format_down=" {interface:.6} ",
    interface="wlp3s0",
    on_doubleleftclick="urxvtc -e sh -c nmcli connection show",
)

# show available memory
STATUS.register(
    "mem",
    color="#c2c2c2",
    warn_color="ffa500",
    alert_color='#ff0000',
    format=" {used_mem} {avail_mem}G",
    warn_percentage=70,
    alert_percentage=90,
    divisor=1024**3,
    on_leftclick="urxvtc -e sh -c htop",
)

# show cpu usage
STATUS.register(
    "load",
    critical_color='#ff0000',
    format=" {avg1} {avg5} {tasks}",
    on_leftclick="urxvtc -e sh -c htop",
)

# show system information
STATUS.register(
    "uname",
    format='{release}',
    on_leftclick="exec urxvtc -e sh -c neofetch; workspace 1 </>",
)

# Show keyboard locks
STATUS.register(
    "keyboard_locks",
    format='{caps} {num}',
    color='#ff0000',
    caps_on='Caps On',
    num_on='Num On',
    caps_off='',
    num_off='',
)

STATUS.run()
