#!/usr/bin/python3
import numpy as np
import sympy as sy
import matplotlib.pyplot as plt
import math


r0 = np.eye(3) #P1の座標変換行列を零ベクトルとして設定
oPr = sy.zeros(3, 1) #0Prの位置ベクトル決定用零ベクトル
#有顔ベクトルを定義
a = sy.Matrix([[1], [0], [0]])
b = sy.Matrix([[0], [1], [0]])
c = sy.Matrix([[0], [0], [1]])


#自由度を設定
while True:
    try:
        strDOF = input("自由度を入力してください:")
        DOF = int(strDOF)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度整数を入力してください。") 
    else:
        if DOF > 100: #最大自由度を定義
            print("自由度が多すぎます。100以下の整数を入力してください。")
        elif DOF < 0: #最小自由度を定義
            print("入力に失敗しました。0以上の整数を入力してください。")
        else:
            break


#間接の位置ベクトルと回転軸ベクトルを設定
for i in range(1, DOF + 1):
    #位置ベクトルのx成分を設定
    while True:
        try:
            exec(f"input1 = input('{str(i - 1)}P{str(i)}のx成分を入力してください:')")
            vector_r_x = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字を入力してください。")
        else:
            if vector_r_x > 100: #最大値を定義
                print("数字が大きすぎます。100以下の数字を入力してください。")
            elif vector_r_x < - 100: #最小値を定義
                print("数字が小さすぎます。-100以上の数字を入力してください。")
            else:
                exec(f"p{str(i)}_x = vector_r_x")
                break
    
    #位置ベクトルのy成分を設定
    while True:
        try:
            exec(f"input1 = input('{str(i - 1)}P{str(i)}のy成分を入力してください:')")
            vector_r_y = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字を入力してください。")
        else:
            if vector_r_y > 100: #最大値を定義
                print("数字が大きすぎます。100以下の数字を入力してください。")
            elif vector_r_y < - 100: #最小値を定義
                print("数字が小さすぎます。-100以上の数字を入力してください。")
            else:
                exec(f"p{str(i)}_y = vector_r_y")
                break

    #位置ベクトルのz成分を設定
    while True:
        try:
            exec(f"input1 = input('{str(i - 1)}P{str(i)}のz成分を入力してください:')")
            vector_r_z = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字を入力してください。")
        else:
            if vector_r_z > 100: #最大値を定義
                print("数字が大きすぎます。100以下の数字を入力してください。")
            elif vector_r_z < - 100: #最小値を定義
                print("数字が小さすぎます。-100以上の数字を入力してください。")
            else:
                exec(f"p{str(i)}_z = vector_r_z")
                break
    
    #x,y,z成分から位置ベクトルを作成
    exec(f"p{str(i)}= sy.Matrix(\
         [[p{str(i)}_x], \
         [p{str(i)}_y], \
         [p{str(i)}_z]]\
         )")
    exec(f"p{str(i)}_np = sy.matrix2numpy(p{str(i)})") #printの視認性のためsympyからnumpyに変換
    exec(f"print(p{str(i)}_np)") #位置ベクトルを表示

    #回転軸ベクトルを設定
    while True:
        exec(f"input1 = input('θ{str(i)}回転軸ベクトルの向きをx,y,zで入力してください:')")
        #x軸周りの回転の場合
        if input1 == str("x"):
            exec(f"s{str(i)}= np.array([[1], [0], [0]])")
            exec(f"print(s{str(i)})")
            exec(f"theta{str(i)} = sy.symbols('theta{str(i)}')")
            exec(f"r{str(i)} = sy.Matrix(\
                 [[1, 0, 0], \
                 [0, sy.cos(theta{str(i)}), - sy.sin(theta{str(i)})], \
                 [0, sy.sin(theta{str(i)}), sy.cos(theta{str(i)})]]\
                 )"
                 )
            break

        #y軸周りの回転の場合
        elif input1 == str("y"):
            exec(f"s{str(i)}= np.array([[0], [1], [0]])")
            exec(f"print(s{str(i)})")
            exec(f"theta{str(i)} = sy.symbols('theta{str(i)}')")
            exec(f"r{str(i)} = sy.Matrix(\
                 [[sy.cos(theta{str(i)}), 0, sy.sin(theta{str(i)})], \
                 [0, 1, 0], \
                 [- sy.sin(theta{str(i)}), 0, sy.cos(theta{str(i)})]]\
                 )"
                 )
            break

        #z軸周りの回転の場合
        elif input1 == str("z"):
            exec(f"s{str(i)}= np.array([[0], [0], [1]])")
            exec(f"print(s{str(i)})")
            exec(f"theta{str(i)} = sy.symbols('theta{str(i)}')")
            exec(f"r{str(i)} = sy.Matrix(\
                 [[sy.cos(theta{str(i)}), - sy.sin(theta{str(i)}), 0], \
                 [sy.sin(theta{str(i)}), sy.cos(theta{str(i)}), 0], \
                 [0, 0 ,1]]\
                 )"
                 )
            break
        #それ以外の入力でエラー
        else:
            print("入力に失敗しました。もう一度x,y,zを入力してください。")


#最後の間接から先端までの位置ベクトルを設定
#位置ベクトルのx成分を設定
while True:
    try:
        exec(f"input1 = input('{str(DOF)}Prのx成分を入力してください:')")
        vector_r_x = float(input1)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字を入力してください。")
    else:
        if vector_r_x > 100: #最大値を定義
            print("数字が大きすぎます。100以下の数字を入力してください。")
        elif vector_r_x < - 100: #最小値を定義
            print("数字が小さすぎます。-100以上の数字を入力してください。")
        else:
            exec(f"pr_x = vector_r_x")
            break
    
#位置ベクトルのy成分を設定
while True:
    try:
        exec(f"input1 = input('{str(DOF)}Prのy成分を入力してください:')")
        vector_r_y = float(input1)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字を入力してください。")
    else:
        if vector_r_y > 100: #最大値を定義
            print("数字が大きすぎます。100以下の数字を入力してください。")
        elif vector_r_y < - 100: #最小値を定義
            print("数字が小さすぎます。-100以上の数字を入力してください。")
        else:
            exec(f"pr_y = vector_r_y")
            break

#位置ベクトルのz成分を設定
while True:
    try:
        exec(f"input1 = input('{str(DOF)}Prのz成分を入力してください:')")
        vector_r_z = float(input1)
    except ValueError as e: #数字以外の入力でループ
        print("入力に失敗しました。もう一度数字を入力してください。")
    else:
        if vector_r_z > 100: #最大値を定義
            print("数字が大きすぎます。100以下の数字を入力してください。")
        elif vector_r_z < - 100: #最小値を定義
            print("数字が小さすぎます。-100以上の数字を入力してください。")
        else:
            exec(f"pr_z = vector_r_z")
            break

#x,y,z成分から位置ベクトルを作成
exec(f"p{str(DOF + 1)} = sy.Matrix([[pr_x], [pr_y], [pr_z]])")
exec(f"p{str(DOF + 1)}_np = sy.matrix2numpy(p{str(DOF + 1)})") #printの視認性のためsympyからnumpyに変換
exec(f"print(p{str(DOF + 1)}_np)") #位置ベクトルを表示


#順運動学解を求める
for j in range(0, DOF + 1):
    k = j
    exec(f"A = p{str(j + 1)}")
    while k >= 0:
        exec(f"A = r{str(k)} * A")
        k -= 1
    exec(f"l{str(j)} = A")
    exec(f"l{str(j)}_np = sy.matrix2numpy(l{str(j)})") #printの視認性のためsympyからnumpyに変換
    exec(f"print('l{str(j)} =')")
    exec(f"print(l{str(j)}_np)")
    exec(f"oPr += l{str(j)}")

np_oPr = sy.matrix2numpy(oPr) #sympyからnumpyに変換
print("順運動学解は:\n{}" .format(np_oPr)) #順運動学解を表示


#有顔ベクトルを求める
p = DOF
while p >= 0:
    exec(f"a = r{str(p)} * a")
    exec(f"b = r{str(p)} * b")
    exec(f"c = r{str(p)} * c")
    p -= 1

np_a = sy.matrix2numpy(a)
np_b = sy.matrix2numpy(b)
np_c = sy.matrix2numpy(c)

ab = np.append(a, b, axis=1)
abc = np.append(ab, c, axis=1)

print("有顔ベクトルは:\n{}" .format(abc)) #有顔ベクトルを表示


#根本座標[x, y, z] = [0, 0, 0]を設定
x = np.zeros((1, 1))
y = np.zeros((1, 1))
z = np.zeros((1, 1))


#原点から最初の間接までの位置ベクトルをx,y,zの行列の末尾に追加
l0_np = sy.matrix2numpy(l0)
ol0 = l0_np

x = np.append(x, l0[0])
y = np.append(y, l0[1])
z = np.append(z, l0[2])


#角度を設定
for l in range(1, DOF + 1):
    while True:
        try:
            exec(f"input1 = input('θ{str(l)}の角度をdegで入力してください:')")
            deg = float(input1)
        except ValueError as e: #数字以外の入力でループ
            print("入力に失敗しました。もう一度数字を入力してください。")
        else:
            if deg > 10000: #最大角度を定義
                print("数字が大きすぎます。10000以下の数字を入力してください。")
            elif deg < - 10000: #最小角度を定義
                print("数字が小さすぎます。-10000以上の数字を入力してください。")
            else:
                exec(f"rad{str(l)} = sy.pi / 180.0 * deg") #degからradに変換
                break
    
    #原点から間接の位置ベクトルに角度を代入し、x,y,zの末尾に追加
    m = l
    while m > 0:
        exec(f"l{str(l)} = l{str(l)}.subs(theta{str(m)}, rad{str(m)})")
        m -= 1
    exec(f"l{str(l)}_np = sy.matrix2numpy(l{str(l)})")
    n = l
    exec(f"ol{str(l)} = np.zeros((3, 1))")
    while n >= 0:
        exec(f"ol{str(l)} = ol{str(l)} + l{str(n)}_np")
        n -= 1

    exec(f"x = np.append(x, ol{str(l)}[0])")
    exec(f"y = np.append(y, ol{str(l)}[1])")
    exec(f"z = np.append(z, ol{str(l)}[2])")


print("x =\n{}".format(x))
print("y =\n{}".format(y))
print("z =\n{}".format(z))


#有顔ベクトルに角度を代入
for q in range( 1, DOF + 1):
    exec(f"a = a.subs(theta{str(q)}, rad{str(q)})")
    exec(f"b = b.subs(theta{str(q)}, rad{str(q)})")
    exec(f"c = c.subs(theta{str(q)}, rad{str(q)})")

exec(f"a_position = np.append(ol{str(DOF)}, a + ol{str(DOF)}, axis=1)")
exec(f"b_position = np.append(ol{str(DOF)}, b + ol{str(DOF)}, axis=1)")
exec(f"c_position = np.append(ol{str(DOF)}, c + ol{str(DOF)}, axis=1)")

a_x = a_position[0]
a_y = a_position[1]
a_z = a_position[2]
b_x = b_position[0]
b_y = b_position[1]
b_z = b_position[2]
c_x = c_position[0]
c_y = c_position[1]
c_z = c_position[2]

while True:
    input1 = input("グラフを表示しますか？[y/n]:")
    if input1 == str("y") or input1 == str("Y"):
        #グラフの表示範囲を決定
        #xとyの表示範囲
        Max_mat = [max(x), max(y), max(z)]
        Max_num = max(Max_mat)
        Min_mat = [min(x), min(y), min(z)]
        Min_num = min(Min_mat)
        Max = np.float16(round(Max_num + 1, 1))
        Min = np.float16(round(Min_num - 1, 1))
        if abs(Max) > abs(Min):
            Range = abs(Max)
        elif abs(Min) > abs(Max):
            Range = abs(Min)
        else:
            Range = abs(Max)

        #zの表示範囲
        z_Max = np.float16(round(max(z)))
        z_Min = np.float16(round(min(z)))


        #座標軸表示用
        x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
        y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
        z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])


        #グラフ表示についての設定
        fig = plt.figure()
        ax = fig.add_subplot(projection="3d")

        ax.set_ylim(- Range, Range)
        ax.set_xlim(- Range, Range)
        if abs(z_Max) > abs(z_Min):
            ax.set_zlim(z_Min, z_Min + 2 * Range)
        elif abs(z_Min) > abs(z_Max):
            ax.set_zlim(z_Max - 2 * Range, z_Max)
        else:
            ax.set_zlim(z_Min, z_Min + 2 * Range)

        ax.plot(x_axis[0], x_axis[1], x_axis[2], label="x", color="#8b0000")
        ax.plot(y_axis[0], y_axis[1], y_axis[2], label="y", color="#006400")
        ax.plot(z_axis[0], z_axis[1], z_axis[2], label="z", color="#00008b")
        ax.plot(x, y, z, marker="o", markersize=3, color="#b8860b")
        ax.plot(a_x, a_y, a_z, color="red")
        ax.plot(b_x, b_y, b_z, color="green")
        ax.plot(c_x, c_y, c_z, color="blue")

        ax.set_box_aspect((1, 1, 1))
        ax.legend()

        plt.show()
        break
    
    elif input1 == str("n") or input1 == str("N"):
        break

    else:
        print("入力に失敗しました。もう一度入力してください。")
