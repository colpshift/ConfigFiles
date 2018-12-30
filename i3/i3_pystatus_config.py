#
# File: i3_pystatus-config.py / i3pyconfig.py
# Author: Colps
# Github: https://github.com/colpshift
# Description: i3 pystatus configuration file
# Last Modified: dezembro 25, 2018
#

from i3pystatus import Status
from i3pystatus import battery
from platform import uname
from i3pystatus.weather import weathercom
from i3pystatus.network import Network
from i3pystatus.network import sysfs_interface_up
from i3pystatus.updates import pacman
from i3pystatus.updates import cower

class MyNetwork(Network):
    """
    Modified Network class that automatic switch interface in case of
    the current interface is down.
    """
    on_upscroll = None
    on_downscroll = None

    def run(self):
        super().run()
        if not sysfs_interface_up(self.interface, self.unknown_up):
            self.cycle_interface()

def make_bar(percentage):
    """Modified function make_bar to substitute the original one"""
    bars = ['', '', '', '', '']
    base = 100 / len(bars)
    index = round(percentage / base) - 1
    return bars[index]

# battery module will display unicode icons
battery.make_bar = make_bar
status = Status()

# show updates in pacman/aur
status.register(
    "updates",
    format=" {Pacman}/{Cower}",
    backends=[pacman.Pacman(), cower.Cower()],
)

# Show keyboard locks 
status.register(
    "keyboard_locks",
    format='{caps} {num}',
    color='#e60053',
    caps_on='Caps On',
    num_on='Num On',
    caps_off='',
    num_off='',
    )

# show clock
status.register(
    "clock",
    color='#49edff',
    format=" %a %d/%m  %H:%M",
)

# Show weather 
status.register(
    'weather',
    format='{current_temp}{temp_unit}[ {icon}][ {update_error}]',
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
    location_code='BRXX0241:1:BR',
    units='metric',
    ),
)

# show/change volume using PA
status.register(
    "pulseaudio",
    format=" {volume}%",
    format_muted=" Mute",
)

# show battery status
status.register(
    battery,
    format="{bar} [{status} ]{remaining}",
    interval=5,
    alert=True,
    alert_percentage=15,
    status={
        "CHR": "",
        "DPL": "",
        "DIS": "",
        "FULL": "",
    },
)

# show network speed
status.register(
    MyNetwork,
    format_up="{interface:.6}  {bytes_recv}K  {bytes_sent}K",
    format_down="{interface:.6} ",
    interface="enp3s0",
)

# show available memory
status.register(
    "mem",
    format=" {avail_mem}G",
    warn_percentage=70,
    alert_percentage=90,
    divisor=1024**3,
)

# show cpu usage
status.register(
    "load",
    format=" {avg1} {avg5}",
)

# show disk available space
status.register(
    "disk",
    format=" {avail}G",
    path="/",
)

# show system information
status.register(
    "uname",
    format=' {nodename} {release} ',
)

status.run()
