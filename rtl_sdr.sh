#!/bin/bash

sudo apt install rtl-sdr

sudo rmmod dvb_usb_rtl28xxu # this is temporary

echo 'blacklist dvb_usb_rtl28xxu' | sudo tee –a /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf # this is permanent

# Gqrx
volk_profile # optimize system for FFT computation
