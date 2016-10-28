#!/usr/bin/python
import pexpect
import sys
import time
import subprocess

def main():
    gatt = pexpect.spawn('gatttool -I' )
    connect(gatt)
    send_messages_until_quit(gatt)

def connect(gatt):
    try:
        gatt.sendline('connect 10:78:60:00:15:98')
        gatt.expect('Connection successful', timeout=3)
        print("Connected to bluetooth service!")
    except pexpect.TIMEOUT:
        print("Couldn't connect to bluetooth service; retrying.")
        connect(gatt)

def send_messages_until_quit(gatt):
    index = 0
    while True:
        temperature = subprocess.check_output(["bash", "get_temperature_stockholm_year_high.bash", "{i}".format(i = index)])
        print("Temperature: {t}".format(t=temperature))
        rgb = subprocess.check_output(["bash",
                                       "get_rgb.bash",
                                       "{t}".format(t = temperature)])
        print("Setting lamp to RGB value: {c}".format(c = rgb))
        gatt.sendline('char-write-cmd 0x000b 56{c}00f0aa'.format(c=rgb))
        time.sleep(2)
        index = (index + 1) % 12
            
main()
