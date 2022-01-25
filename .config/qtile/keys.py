from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from groups import groups

mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key(
        [mod],
        "h",
        lazy.layout.left(),
        desc="Move focus to left"
    ),
    Key(
        [mod],
        "l",
        lazy.layout.right(),
        desc="Move focus to right"
    ),
    Key(
        [mod],
        "j",
        lazy.layout.down(),
        desc="Move focus down"
    ),
    Key(
        [mod],
        "k",
        lazy.layout.up(),
        desc="Move focus up"
    ),
    Key(
        [mod],
        "Left",
        lazy.layout.left(),
        desc="Move focus to left"
    ),
    Key(
        [mod],
        "Right",
        lazy.layout.right(),
        desc="Move focus to right"
    ),
    Key(
        [mod],
        "Down",
        lazy.layout.down(),
        desc="Move focus down"
    ),
    Key(
        [mod],
        "Up",
        lazy.layout.up(),
        desc="Move focus up"
    ),
    Key(
        [mod],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window"
    ),

    # Move windows
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"
    ),
    Key(
        [mod, "shift"],
        "Left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "Right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
    ),
    Key(
        [mod, "shift"],
        "Down",
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),
    Key(
        [mod, "shift"],
        "Up",
        lazy.layout.shuffle_up(),
        desc="Move window up"
    ),

    # Resize windows
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down"
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        desc="Grow window up"
    ),
    Key(
        [mod, "control"],
        "Left",
        lazy.layout.grow_left(),
        desc="Grow window to the left"
    ),
    Key(
        [mod, "control"],
        "Right",
        lazy.layout.grow_right(),
        desc="Grow window to the right"
    ),
    Key(
        [mod, "control"],
        "Down",
        lazy.layout.grow_down(),
        desc="Grow window down"
    ),
    Key(
        [mod, "control"],
        "Up",
        lazy.layout.grow_up(),
        desc="Grow window up"
    ),
    Key(
        [mod],
        "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
    ),
    Key(
        [mod],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"
    ),

    # Toggle between different layouts as defined below
    Key(
        [mod],
        "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"
    ),
    Key(
        [mod],
        "w",
        lazy.window.kill(),
        desc="Kill focused window"
    ),

    # Quit and restart Qtile
    Key(
        [mod, "control"],
        "r",
        lazy.restart(),
        desc="Restart Qtile"
    ),
    Key(
        [mod, "control"],
        "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
    ),

    # Show app runner
    Key(
        [mod],
        "d",
        lazy.spawn("rofi -show drun")
    ),

    # Fetch credentials
    Key(
        [mod],
        "u",
        lazy.spawn("/home/cflowers/.local/bin/pass-username"),
        desc="Fetch username"
    ),
    Key(
        [mod],
        "p",
        lazy.spawn("/home/cflowers/.local/bin/passmenu"),
        desc="Fetch password"
    ),

    # Quick launch
    Key(
        [mod],
        "z",
        lazy.spawn("brave"),
        desc="Launch web browser"
    ),
    Key(
        [mod],
        "x",
        lazy.spawn(f"{terminal} -e bash -c 'sleep .25 && ranger'"),
        "Launch file browser"
    ),
    Key(
        [mod],
        "c",
        lazy.spawn("steam"),
        "Launch Steam"
    ),
    Key(
        [mod],
        "v",
        lazy.spawn(
            f"""
{terminal} -e bash -c \\
'sleep .25 && nvim /home/cflowers/vimwiki/index.wiki'
            """
        ),
        "Launch vimwiki for editing"
    ),
    Key(
        [mod, "shift"],
        "v",
        lazy.spawn(
            f"""
{terminal} -e bash -c \\
'sleep .25 && nvim -es -- /home/cflowers/vimwiki/index.wiki << EOF
VimwikiAll2HTML
Vimwiki2HTMLBrowse
q
EOF
'
            """
        )
    )
]

for i in groups:
    keys.append(Key([mod], i.name, lazy.group[i.name].toscreen()))
    keys.append(Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)))
