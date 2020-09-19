# Touchscreen Auto Enable/Disable
If the touchscreen on your linux laptop goes crazy when you close the laptop lid, this is for you.

## Instructions

1. Find out what the name of your touchscreen device is:

- Run the command `xinput`. The results should look something like:

```
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ Logitech M310                           	id=11	[slave  pointer  (2)]
⎜   ↳ Logitech K520                           	id=12	[slave  pointer  (2)]
⎜   ↳ ELAN1200:00 04F3:3022 Touchpad          	id=14	[slave  pointer  (2)]
⎜   ↳ FTSC1000:00 2808:5120                   	id=15	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Asus Wireless Radio Control             	id=7	[slave  keyboard (3)]
    ↳ Video Bus                               	id=8	[slave  keyboard (3)]
    ↳ Power Button                            	id=9	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=10	[slave  keyboard (3)]
    ↳ USB2.0 HD UVC WebCam: USB2.0 HD         	id=13	[slave  keyboard (3)]
    ↳ Asus WMI hotkeys                        	id=16	[slave  keyboard (3)]
    ↳ gpio-keys                               	id=17	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=18	[slave  keyboard (3)]
    ↳ Logitech K520                           	id=19	[slave  keyboard (3)]
    ↳ C&T EarPods_TC01_K79                    	id=20	[slave  keyboard (3)]
    ↳ OBINS OBINS
AnnePro2                    	id=21	[slave  keyboard (3)]
    ↳ OBINS OBINS
AnnePro2                    	id=22	[slave  keyboard (3)]
```
- Take a guess on which device it is.
  
- Test it by running `xinput --test <device_id>` and touching your screen. Mine was `FTSC1000:00 2808:5120`.
  
2. Copy a unique portion of your device name into `lid.sh`, on the line 
  `DEVICE_INT=$(xinput | grep <device_name_here> | cut -d "=" -f2 | cut -d$'\t' -f1)`
  This line just finds the device id from the device name in case the ID ever changes because of other devices  detected. For my device, I input `FTSC`.
  
3. Then, do this:

- Copy `lid.sh` into `/etc/acpi`.
- Copy `lm_lid` into `/etc/acpi/events`. (This will catch laptop open/close lid events and run lid.sh)
- Run `lid.sh` in last line of your `/etc/X11/xinit/xinitrc`. Example in `xinitrc`. (This is so that the script runs on startup).


**Note:** These scripts are only tested on a ASUS UX360UA laptop. Touchscreen device name may be different for other systems or other aspects of these scripts may not work. Although I am confident you can make it work with minor tweaks if it doesn't.
