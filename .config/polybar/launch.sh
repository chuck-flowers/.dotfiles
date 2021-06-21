#!/bin/bash

killall -q polybar

polybar desktop-bottom 2>&1 & disown

