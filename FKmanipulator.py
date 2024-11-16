#!/usr/bin/python3
import numpy as np
import sympy as sy

#自由度を設定
while True:
    try:
        strDOF = input("自由度を入力してください: ")
        DOF = int(strDOF)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字で入力してください: ") 
    else:
        if DOF > 100:
            print("自由度が多すぎます。100以下の数字を入力してください")
        else:
            break

#間接の位置ベクトルと回転軸ベクトルを設定
for i in range(1, DOF + 1):
    #位置ベクトルのx成分を設定
    while True:
        try:
            exec(f"input1 =  input('" + str(i - 1) + f"P" + str(i) + f"のx成分を入力してください: ')")
            vector_r_x = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字で入力してください: ")
        else:
            exec(f"p" + str(i) + f"_x = vector_r_x")
            break
    
    #位置ベクトルのy成分を設定
    while True:
        try:
            exec(f"input1 =  input('" + str(i - 1) + f"P" + str(i) + f"のy成分を入力してください: ')")
            vector_r_y = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字で入力してください: ")
        else:
            exec(f"p" + str(i) + f"_y = vector_r_y")
            break

    #位置ベクトルのz成分を設定
    while True:
        try:
            exec(f"input1 =  input('" + str(i - 1) + f"P" + str(i) + f"のz成分を入力してください: ')")
            vector_r_z = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字で入力してください: ")
        else:
            exec(f"p" + str(i) + f"_z = vector_r_z")
            break
    
    exec(f"p" + str(i) + f"= np.array([[p" + str(i) + f"_x], [p" + str(i) + "_y], [p" + str(i) +"_z]])") #x,y,z成分から位置ベクトルを生成
    exec(f"print(p" + str(i) + f")") #位置ベクトルを表示

    #回転軸ベクトルを設定
    while True:
        exec("input1 = input('θ" + str(i) + f"回転軸ベクトルの向きをx,y,zで入力: ')")
        if input1 == str("x"):
            exec(f"s" + str(i) + f"= np.array([[1], [0], [0]])")
            exec(f"print(s" + str(i) + f")")
            exec(f"sin_theta" + str(i) + f", cos_theta" + str(i) + f" = sy.symbols('sin_theta" + str(i) + f", cos_theta" + str(i) + f"')")
            exec(f"R" + str(i) + f" = np.array([[1, 0, 0], [0, cos_theta" + str(i) + f", - sin_theta" + str(i) + f"], [0, sin_theta" + str(i) + f", cos_theta" + str(i) + f"]])")
            break

        elif input1 == str("y"):
            exec(f"s" + str(i) + f"= np.array([[0], [1], [0]])")
            exec(f"print(s" + str(i) + f")")
            exec(f"sin_theta" + str(i) + f", cos_theta" + str(i) + f" = sy.symbols('sin_theta" + str(i) + f", cos_theta" + str(i) + f"')")
            exec(f"R" + str(i) + f" = np.array([[cos_theta" + str(i) + f", 0, sin_theta" + str(i) + f"], [0, 1, 0], [-sin_theta" + str(i) + f", 0, cos_theta" + str(i) + f"]])")
            break

        elif input1 == str("z"):
            exec(f"s" + str(i) + f"= np.array([[0], [0], [1]])")
            exec(f"print(s" + str(i) + f")")
            exec(f"sin_theta" + str(i) + f", cos_theta" + str(i) + f" = sy.symbols('sin_theta" + str(i) + f", cos_theta" + str(i) + f"')")
            exec(f"R" + str(i) + f" = np.array([[cos_theta" + str(i) + f", - sin_theta" + str(i) + f", 0], [sin_theta" + str(i) + f", cos_theta" + str(i) + f", 0], [0, 0 ,1]])")
            break
        else:
            print("入力に失敗しました。もう一度x,y,zで入力してください: ")



