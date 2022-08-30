import subprocess

from colors import gruvbox_dark
from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy

def build_screens():
	def build_bar(widgets, margin):
		return bar.Bar(
			widgets,
			30,
			background=gruvbox_dark["background"],
			margin=margin
		)

	def build_screen(top_widgets, bottom_widgets):
		MARGIN_VALUE = 10
		return Screen(
			top=build_bar(
				top_widgets,
				margin=[
					MARGIN_VALUE, 
					MARGIN_VALUE, 
					MARGIN_VALUE // 2, 
					MARGIN_VALUE
				]
			),
			bottom=build_bar(
				bottom_widgets,
				margin=[
					MARGIN_VALUE // 2,
					MARGIN_VALUE,
					MARGIN_VALUE,
					MARGIN_VALUE
				]
			),
			left=bar.Gap(MARGIN_VALUE // 2),
			right=bar.Gap(MARGIN_VALUE // 2),
			wallpaper='~/.local/share/wallpapers/wallpaper-sunset.svg',
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

	compositor = widget.GenPollText(
		fmt = ': {}',
		func = lambda: subprocess.run(['bash', '-c', 'if pgrep picom > /dev/null; then printf ON; else printf OFF; fi'], stdout=subprocess.PIPE).stdout.decode('utf-8').strip(),
		update_interval = 5,
		mouse_callbacks = {
			"Button1": lazy.spawn('bash -c "if pgrep picom > /dev/null; then pkill picom; else picom -b; fi"')
		},
		padding = 10
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
		partition='/home',
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
		compositor,
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
