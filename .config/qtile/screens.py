from colors import gruvbox_dark
from libqtile import bar, widget
from libqtile.config import Screen

def build_screens():
	def build_bar(widgets):
		return bar.Bar(
			widgets,
			30,
			background=gruvbox_dark["background"],
			margin=5
		)

	def build_screen(top_widgets, bottom_widgets):
		return Screen(
			top=build_bar(top_widgets),
			bottom=build_bar(bottom_widgets),
			wallpaper='~/Pictures/wallpapers/wallpaper-sunset.svg',
			wallpaper_mode='stretch'
		)

	window_name = widget.WindowName(
		width=bar.CALCULATED
	)

	check_updates = widget.CheckUpdates(
		background=gruvbox_dark["darkOrange"],
		colour_have_updates=gruvbox_dark["foreground"],
		distro='Arch',
		display_format=" {updates}",
		padding=10
	)

	cpu = widget.CPU(
		format=' {load_percent}%',
		background=gruvbox_dark["darkBlue"],
		padding=10
	)
	
	ram = widget.Memory(
		format=' {MemPercent}%',
		background=gruvbox_dark["darkPurple"],
		padding=10
	)

	hdd = widget.DF(
		background=gruvbox_dark["darkYellow"],
		format=' {r:.1f}%',
		padding=10,
		partition='/',
		visible_on_warn=False
	)

	gpu = widget.NvidiaSensors(
		background=gruvbox_dark["darkGreen"],
		format=' {temp}°C',
		padding=10
	)

	current_layout = widget.CurrentLayout(
		padding=10
	)

	group_box = widget.GroupBox(
		this_current_screen_border=gruvbox_dark["darkYellow"]
	)

	sys_tray = widget.Systray()
	
	clock = widget.Clock(
		format="%I:%M %p",
		padding=10
	)

	date = widget.Clock(
		format="%m/%d/%Y %a",
		padding=10
	)

	topBar = [
		widget.Spacer(),
		window_name,
		widget.Spacer(),
		check_updates,
		cpu,
		ram,
		hdd,
		gpu
	]

	bottomBar = [
		current_layout,
		group_box,
		widget.Spacer(),
		clock,
		widget.Spacer(),
		sys_tray,
		date
	]

	return [
		build_screen(
			topBar,
			bottomBar
		),
		build_screen(
			topBar,
			bottomBar
		)
	]
