from libqtile import layout

from colors import gruvbox_dark


def get_layouts():
    return [
        layout.Columns(
            border_focus=gruvbox_dark["darkPurple"],
            border_width=3,
            margin=5
        ),
        layout.Max(),
        # Try more layouts by unleashing below layouts.
        # layout.Stack(num_stacks=2),
        # layout.Bsp(),
        # layout.Matrix(),
        # layout.MonadTall(),
        # layout.MonadWide(),
        # layout.RatioTile(),
        # layout.Tile(),
        # layout.TreeTab(),
        # layout.VerticalTile(),
        # layout.Zoomy(),
    ]
