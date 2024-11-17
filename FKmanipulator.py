#!/usr/bin/python3
import numpy as np
import sympy as sy

r0 = np.eye(3)
oPr = sy.zeros(3, 1)

#自由度を設定
while True:
    try:
        strDOF = input("自由度を入力してください: ")
        DOF = int(strDOF)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字で入力してください。") 
    else:
        if DOF > 100:
            print("自由度が多すぎます。100以下の数字を入力してください。")
        elif DOF < 0:
            print("入力に失敗しました。0以上の数字を入力してください。")
        else:
            break

#間接の位置ベクトルと回転軸ベクトルを設定
for i in range(1, DOF + 1):
    #位置ベクトルのx成分を設定
    while True:
        try:
            exec(f"input1 =  input('{str(i - 1)}P{str(i)}のx成分を入力してください: ')")
            vector_r_x = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字で入力してください。")
        else:
            exec(f"p{str(i)}_x = vector_r_x")
            break
    
    #位置ベクトルのy成分を設定
    while True:
        try:
            exec(f"input1 = input('{str(i - 1)}P{str(i)}のy成分を入力してください: ')")
            vector_r_y = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字で入力してください。")
        else:
            exec(f"p{str(i)}_y = vector_r_y")
            break

    #位置ベクトルのz成分を設定
    while True:
        try:
            exec(f"input1 =  input('{str(i - 1)}P{str(i)}のz成分を入力してください: ')")
            vector_r_z = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字で入力してください。")
        else:
            exec(f"p{str(i)}_z = vector_r_z")
            break
    
    exec(f"p{str(i)}= sy.Matrix([[p{str(i)}_x], [p{str(i)}_y], [p{str(i)}_z]])") #x,y,z成分から位置ベクトルを生成
    exec(f"print(p{str(i)})") #位置ベクトルを表示

    #回転軸ベクトルを設定
    while True:
        exec(f"input1 = input('θ{str(i)}回転軸ベクトルの向きをx,y,zで入力: ')")
        if input1 == str("x"):
            exec(f"s{str(i)}= np.array([[1], [0], [0]])")
            exec(f"print(s{str(i)})")
            exec(f"sin_theta{str(i)}, cos_theta{str(i)} = sy.symbols('sin_theta{str(i)}, cos_theta{str(i)}')")
            exec(f"r{str(i)} = sy.Matrix([[1, 0, 0], [0, cos_theta{str(i)}, - sin_theta{str(i)}], [0, sin_theta{str(i)}, cos_theta{str(i)}]])")
            break

        elif input1 == str("y"):
            exec(f"s{str(i)}= np.array([[0], [1], [0]])")
            exec(f"print(s{str(i)})")
            exec(f"sin_theta{str(i)}, cos_theta{str(i)} = sy.symbols('sin_theta{str(i)}, cos_theta{str(i)}')")
            exec(f"r{str(i)} = sy.Matrix([[cos_theta{str(i)}, 0, sin_theta{str(i)}], [0, 1, 0], [-sin_theta{str(i)}, 0, cos_theta{str(i)}]])")
            break

        elif input1 == str("z"):
            exec(f"s{str(i)}= np.array([[0], [0], [1]])")
            exec(f"print(s{str(i)})")
            exec(f"sin_theta{str(i)}, cos_theta{str(i)} = sy.symbols('sin_theta{str(i)}, cos_theta{str(i)}')")
            exec(f"r{str(i)} = sy.Matrix([[cos_theta{str(i)}, - sin_theta{str(i)}, 0], [sin_theta{str(i)}, cos_theta{str(i)}, 0], [0, 0 ,1]])")
            break
        else:
            print("入力に失敗しました。もう一度x,y,zで入力してください。")


#位置ベクトルのx成分を設定
while True:
    try:
        exec(f"input1 =  input('{str(DOF)}Prのx成分を入力してください: ')")
        vector_r_x = float(input1)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字で入力してください。")
    else:
        exec(f"pr_x = vector_r_x")
        break
    
#位置ベクトルのy成分を設定
while True:
    try:
        exec(f"input1 = input('{str(DOF)}Prのy成分を入力してください: ')")
        vector_r_y = float(input1)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字で入力してください。")
    else:
        exec(f"pr_y = vector_r_y")
        break

#位置ベクトルのz成分を設定
while True:
    try:
        exec(f"input1 =  input('{str(DOF)}Prのz成分を入力してください: ')")
        vector_r_z = float(input1)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字で入力してください。")
    else:
        exec(f"pr_z = vector_r_z")
        break
    
exec(f"p{str(DOF + 1)} = sy.Matrix([[pr_x], [pr_y], [pr_z]])") #x,y,z成分から位置ベクトルを生成
exec(f"print(p{str(DOF + 1)})") #位置ベクトルを表示


for j in range(0, DOF + 1):
    k = j
    exec(f"A = p{str(j + 1)}")
    while k >= 0:
        exec(f"A = r{str(k)} * A")
        k -= 1
    exec(f"l{str(j)} = A")
    exec(f"print(l{str(j)})")
    exec(f"oPr += l{str(j)}")

print(oPr)
