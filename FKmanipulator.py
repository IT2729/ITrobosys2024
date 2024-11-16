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

for i in range(1, DOF + 1):
    while True:
        try:
            exec(f"input1 =  input('" + str(i - 1) + f"P" + str(i) + f"のx成分を入力してください: ')")
            vector_r_x = float(input1)
        except ValueError as e:
            print("入力に失敗しました。もう一度数字で入力してください: ")
        else:
            exec(f"p" + str(i) + f"_x = vector_r_x")
            break
        
    while True:
        try:
            exec(f"input1 =  input('" + str(i - 1) + f"P" + str(i) + f"のy成分を入力してください: ')")
            vector_r_y = float(input1)
        except ValueError as e:
            print("入力に失敗しました。もう一度数字で入力してください: ")
        else:
            exec(f"p" + str(i) + f"_y = vector_r_y")
            break

    while True:
        try:
            exec(f"input1 =  input('" + str(i - 1) + f"P" + str(i) + f"のz成分を入力してください: ')")
            vector_r_z = float(input1)
        except ValueError as e:
            print("入力に失敗しました。もう一度数字で入力してください: ")
        else:
            exec(f"p" + str(i) + f"_z = vector_r_z")
            break

    exec(f"p" + str(i) + f"= np.array([[p" + str(i) + f"_x], [p" + str(i) + "_y], [p" + str(i) +"_z]])")
    exec(f"print(p" + str(i) + f")")


