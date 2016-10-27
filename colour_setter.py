#!/usr/bin/python
import pexpect
import sys
import time
import subprocess

class BulbController:
    gatt = None
    currentRed = 0
    currentGreen = 0
    currentBlue = 0
    
    def __init__(self):
        self.gatt = pexpect.spawn('gatttool -I' )

    def start(self):
        self.connect()
        self.send_messages_until_quit()
        
    def connect(self):
        try:
            self.gatt.sendline('connect 10:78:60:00:15:98')
            self.gatt.expect('Connection successful', timeout=3)
            print("Connected to bluetooth service!")
        except pexpect.TIMEOUT:
            print("Couldn't connect to bluetooth service; retrying.")
            self.connect()

    def send_messages_until_quit(self):
        index = 0
        while True:
            temperature = subprocess.check_output(["bash", "get_temperature_stockholm_year_high.bash", "{i}".format(i = index)])
            print("Temperature: {t}".format(t=temperature))
            rgb = subprocess.check_output(["bash",
                                           "get_rgb.bash",
                                           "{t}".format(t = temperature)])
            print("Fading lamp to RGB value: {c}".format(c = rgb))
            [red, green, blue] = self.divide_rgb(rgb)
            self.fade_to_colour(red, green, blue, 5, 10)
            time.sleep(2)
            index = (index + 1) % 12

    def divide_rgb(self, rgb):
        return rgb.split(" ")

    def fade_to_colour(self, red, green, blue, steps, delay):
        cmd = 'char-write-cmd 0x000b 56{r}{g}{b}00f0aa'.format(r=red,
                                                               b=blue,
                                                               g=green)
        self.gatt.sendline(cmd)

def main():
    controller = BulbController()
    controller.start()

main()
