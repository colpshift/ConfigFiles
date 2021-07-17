#
# Moving Around
#

To move to another terminal, press [Alt]+[j] or [Alt]+[k]

To move a terminal to another tag, press [Shift]+[Alt]+[tag number]

To focus on another tag, press [Alt]+[tag number]

To move a terminal to master or stack, press [Alt]+[d] or [Alt]+[i]

To kill a window, press [Shift]+[Alt]+[c]

#
# layout
#

tiled       []=,  [Alt]+[t]

monocle     [M],  [Alt]+[m]

floating    ><>,  [Alt]+[f]
                  [Alt]+[right mouse button]  to resize the floating window
                  [Alt]+[left mouse button]   to move it around.
                  [Alt]+[middle mouse button] onto the window, to toggle it in being floating

#
# tags
#

[Alt]+[0]  show all tasg in the current

[Alt]+[Shift]+[8] back show individual tags

#
# Quiting
#

[Shift]+[Alt]+[q]

#
#  Status bar
#

By default dwm is showing dwm-X.X in its statusbar. This text can be changed by setting the WM_NAME property of the root window.

Using the tools of X.org, this can be set using:

% xsetroot -name "Some Text"

#
# patches
#
# ----------------------------------------------------------------------------
fullgaps

it also adds outer gaps (between the clients and the screen frame), as well as a gap between the master and stack area,
it adds keybindings to change the gap size at runtime: 
[Alt]+[-]/[Alt]+[=] to decrease/increase the gap size and 
[Alt]+[Shift]+[=] to set it to zero.

# ----------------------------------------------------------------------------
fibonacci

#include "fibonacci.c"
static Layout layout[] = {
	/* symbol               function */
	{ "[]=",                tile }, /* first entry is default */
	{ "><>",                floating },
	{ "(@)",                spiral },
	{ "[\\]",               dwindle },
};
Default key bindings are 
[Ctrl]+[r] for spiral and 
[Ctrl]+[Shift]+r for dwindle

# ----------------------------------------------------------------------------


