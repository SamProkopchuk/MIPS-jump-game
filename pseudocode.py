import numpy as np
from numpy.random import randint

'''
 |
 | Y, X ---->
 |
 v
'''

SIZE = 256
UNIT = 8

BG = 0xfffdd0

class Platform():
    def __init__(self, x, y, width, height):
        self.x = x
        self.y = x
        self.width = width
        self.height = height


class Player():
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.xvel = 0
        self.yvel = 0

    def update(self):
        self.xvel -= self.xvel // 2
        self.yvel -= self.yvel // 2

    def pixels(self):
        # rn we'll just render the player as a 2x3 block
        # bm stands for bottom middle pixel:
        bm = np.array([self.x, self.y])
        res = np.zeros([6, 2])
        res[0] = 


def pixel_idx(x, y):
    return y * SIZE // UNIT + x

def draw_background(display):
    display = BG

def draw_platforms(display, platforms, color = 0x388e3c):
    for platform in platforms:
        for dy in range(platform.height):
            start = pixel_idx(x, y + dy)
            display[start: start + platform.width] = color

def draw_player(display, player):
    for pixel in player.pixels():


def main():
    disp_units = (SIZE // UNIT) ** 2
    display = np.zeros([disp_units, disp_units])
    platforms = [Platform() for _ in range(3)]

    while key_press != 'e' and not_lost:


if __name__ == '__main__':
    main()