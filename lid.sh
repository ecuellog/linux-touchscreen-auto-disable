#!/bin/bash

export DISPLAY=:0.0
export XAUTHORITY=/run/user/1000/gdm/Xauthority

grep -q closed /proc/acpi/button/lid/*/state
LIDST=$?

DEVICE_INT=$(xinput | grep FTSC | cut -d "=" -f2 | cut -d$'\t' -f1)

xinput set-int-prop $DEVICE_INT "Device Enabled" 8 $LIDST
