#!/usr/bin/python3
import numpy as np

while True:
    try:
        strDOF = input("自由度を入力してください: ")
        DOF = int(strDOF)
    except ValueError as e:
        print("入力に失敗しました。もう一度数字で入力してください: ")
    else:
        break

p1_x = input("0P1のx成分を入力")
p1_y = input("0P1のy成分を入力")
p1_z = input("0P1のz成分を入力")
p1 = np.array([[p1_x], [p1_y], [p1_z]])

print(p1)

