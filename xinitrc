#!/usr/bin/env bash
sleep 100
xsetroot -solid black &
#启动屏保程序
gnome-screensaver &
#启用gnome的主题，否则你的awesome下的gnome程序会非常难看
gnome-settings-daemon &
#电源管理程序
gnome-power-manager &
#网络管理程序
nm-applet &
#自动更新程序
update-notifier &
exec /usr/local/bin/awesome
