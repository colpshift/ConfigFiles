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

from configparser import ConfigParser
from i3pystatus import Status
from i3pystatus.core.util import internet
from i3pystatus.mail import imap
from i3pystatus.network import Network
from i3pystatus.online import Online
from i3pystatus.weather import weathercom
from i3pystatus.updates import pacman

STATUS = Status()

# Parser
CONFIG = ConfigParser()
CONFIG.read("/etc/.config_gmail.txt")
GMAILPASS = CONFIG.get("configuration", "password")

# show clock
STATUS.register(
    "clock",
    color="#6bb6ff",
    format="_%d/%m/%y _%k:%M|",
    on_leftclick="firefox https://calendar.google.com/",
)

# Show weather
STATUS.register(
    "weather",
    format="[{icon}] {current_temp}{temp_unit}[ {update_error}]",
    interval=900,
    colorize=True,
    hints={"markup": "pango"},
    backend=weathercom.Weathercom(location_code="BRXX0241:1:BR", units="metric"),
)

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
        format_plural=("_{current_unread}/{unread}"),
        format="_{current_unread}/{unread}",
        on_leftclick="firefox https://mail.google.com/",
        hide_if_null=False,
    )

# Show/change volume using PA
STATUS.register("pulseaudio", format="_{volume}%", format_muted="_Mute")

# show backlight %
STATUS.register(
    "backlight",
    base_path="/sys/class/backlight/intel_backlight/",
    format="_{percentage}%",
)

# show battery status
STATUS.register(
    "battery",
    format="[{status} ]{remaining}",
    interval=5,
    alert=True,
    alert_percentage=15,
    color="#ffa500",
    charging_color="#00ff00",
    critical_color="#ff0000",
    full_color="#c2c2c2",
    status={"CHR": "", "DPL": "", "DIS": "", "FULL": ""},
)

# internet status
STATUS.register(
    Online,
    color="#00ff00",
    color_offline="#ff0000",
    format_online="",
    format_offline="",
    interval=10,
)

# show network speed
STATUS.register(
    Network,
    dynamic_color=True,
    format_up="_{interface:.6} {bytes_recv}K {bytes_sent}K",
    format_down="_{interface:.6} ",
    interface="wlp3s0",
    on_doubleleftclick="urxvt -e nmcli",
)

# show available memory
STATUS.register(
    "mem",
    color="#c2c2c2",
    warn_color="ffa500",
    alert_color="#ff0000",
    format="_{used_mem} {avail_mem}G",
    warn_percentage=70,
    alert_percentage=90,
    divisor=1024 ** 3,
    on_leftclick="urxvt -e htop",
)

# show cpu usage
STATUS.register(
    "load",
    critical_color="#ff0000",
    format="_{avg1} {avg5} {tasks}",
    on_leftclick="urxvt -e htop",
)

# show updates
STATUS.register(
    "updates",
    notification_icon="software-update-available",
    color="#ffa500",
    format="_{count}",
    color_no_updates="#c2c2c2",
    format_no_updates="",
    backends=[pacman.Pacman()],
)

# show system information
STATUS.register("uname", format="_{release}", on_leftclick="urxvt -e uname -a")

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
