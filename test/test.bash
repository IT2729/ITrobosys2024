#!/bin/bash

error () {
	echo AN ERROR HAS OCCURRED IN TEST$t_num
	res=1
	}

res=0

cd ~/robosys/robosys2024

# 正常な入力を試す1
# モード1(test1)
t_num=1
out=$(echo 1 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 | python FKmanipulator/FKmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]]" ] || error

# モード2(test2)
t_num=2
out=$(echo 2 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 | python FKmanipulator/FKmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード3(test3)
t_num=3
out=$(echo 3 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 | python FKmanipulator/FKmanipulator)
[ "${out}" = "順運動学解は: 0Pr =
[[1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード4(test4)
t_num=4
out=$(echo 4 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 30 45 90 | python FKmanipulator/FKmanipulator)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 1.00000000000000, 2.00000000000000, 2.70710678118655,
 2.70710678118655]
y = [0.0, 0, 0, 0.353553390593274, 1.21957879437771]
z = [0.0, 0, 0, -0.612372435695794, -0.112372435695795]
# 有顔ベクトルの根本と先端の座標
a_x = [2.70710678118655, 2.70710678118655]
a_y = [1.21957879437771, 2.08560419816215]
a_z = [-0.112372435695795, 0.387627564304205]
b_x = [2.70710678118655, 2.00000000000000]
b_y = [1.21957879437771, 0.866025403784439]
b_z = [-0.112372435695795, 0.500000000000000]
c_x = [2.70710678118655, 3.41421356237309]
c_y = [1.21957879437771, 0.866025403784439]
c_z = [-0.112372435695795, 0.500000000000000]


# グラフの表示範囲を決定
# xとyの表示範囲
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

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す2
# モード1(test5)
t_num=5
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input1.txt)
[ "${out}" = "[[1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]]" ] || error

# モード2(test6)
t_num=6
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input2.txt)
[ "${out}" = "[[1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)]
 [1.0*sin(theta2) 1.0*cos(theta2)*cos(theta3)
  -1.0*sin(theta3)*cos(theta2)]
 [-1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)]]" ] || error

# モード3(test7)
t_num=7
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input3.txt)
[ "${out}" = "順運動学解は: 0Pr =
[[1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)]
 [1.0*sin(theta2) 1.0*cos(theta2)*cos(theta3)
  -1.0*sin(theta3)*cos(theta2)]
 [-1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)]]" ] || error

# モード4(test8)
t_num=8
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input4.txt)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 0, 0, -0.612372435695794, -0.112372435695795]
y = [0.0, 1.00000000000000, 2.00000000000000, 2.70710678118655,
 2.70710678118655]
z = [0.0, 0, 0, 0.353553390593274, 1.21957879437771]
# 有顔ベクトルの根本と先端の座標
a_x = [-0.112372435695795, 0.500000000000000]
a_y = [2.70710678118655, 3.41421356237310]
a_z = [1.21957879437771, 0.866025403784438]
b_x = [-0.112372435695795, 0.387627564304205]
b_y = [2.70710678118655, 2.70710678118655]
b_z = [1.21957879437771, 2.08560419816215]
c_x = [-0.112372435695795, 0.500000000000000]
c_y = [2.70710678118655, 2.00000000000000]
c_z = [1.21957879437771, 0.866025403784439]


# グラフの表示範囲を決定
# xとyの表示範囲
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

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す3
# txtファイルからモード番号+3 0 0 1 z 0 0 1 x 0 0 1 y 0 0 1 (30 45 90)を縦並びで入力
# モード1(test9)
t_num=9
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input5.txt)
[ "${out}" = "[[1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]]" ] || error

# モード2(test10)
t_num=10
out=$( python FKmanipulator/FKmanipulator < test/test_input_text/test_input6.txt)
[ "${out}" = "[[-1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)]
 [-1.0*sin(theta3)*cos(theta2) 1.0*sin(theta2)
  1.0*cos(theta2)*cos(theta3)]]" ] || error

# モード3(test11)
t_num=11
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input7.txt)
[ "${out}" = "順運動学解は: 0Pr =
[[1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]]
有顔ベクトルは: [a b c] =
[[-1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)]
 [-1.0*sin(theta3)*cos(theta2) 1.0*sin(theta2)
  1.0*cos(theta2)*cos(theta3)]]" ] || error

# モード4(test12)
t_num=12
out=$(python FKmanipulator/FKmanipulator < test/test_input_text/test_input8.txt)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 0, 0, 0.353553390593274, 1.21957879437771]
y = [0.0, 0, 0, -0.612372435695794, -0.112372435695795]
z = [0.0, 1.00000000000000, 2.00000000000000, 2.70710678118655,
 2.70710678118655]
# 有顔ベクトルの根本と先端の座標
a_x = [1.21957879437771, 0.866025403784439]
a_y = [-0.112372435695795, 0.500000000000000]
a_z = [2.70710678118655, 2.00000000000000]
b_x = [1.21957879437771, 0.866025403784439]
b_y = [-0.112372435695795, 0.500000000000000]
b_z = [2.70710678118655, 3.41421356237309]
c_x = [1.21957879437771, 2.08560419816215]
c_y = [-0.112372435695795, 0.387627564304205]
c_z = [2.70710678118655, 2.70710678118655]


# グラフの表示範囲を決定
# xとyの表示範囲
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

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す4
# モード1(test13)
t_num=13
out=$(echo 1 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 | python FKmanipulator/FKmanipulator)
[ "${out}" = "[[1.0*(-100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta2) + 200.0*sin(theta2) + 100.0*cos(theta2) + 100.0]
 [-1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*sin(theta1) - 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*sin(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta1) - 100.0*sin(theta1) + 100.0*cos(theta1) + 100.0]
 [1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta1) + 100.0*sin(theta1) + 100.0*cos(theta1)]]" ] || error

# モード2(test14)
t_num=14
out=$(echo 2 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 | python FKmanipulator/FKmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード3(test15)
t_num=15
out=$(echo 3 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 | python FKmanipulator/FKmanipulator)
[ "${out}" = "順運動学解は: 0Pr =
[[1.0*(-100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta2) + 200.0*sin(theta2) + 100.0*cos(theta2) + 100.0]
 [-1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*sin(theta1) - 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*sin(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta1) - 100.0*sin(theta1) + 100.0*cos(theta1) + 100.0]
 [1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta1) + 100.0*sin(theta1) + 100.0*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード4(test16)
t_num=16
out=$(echo 4 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 -330 -315 -270 | python FKmanipulator/FKmanipulator)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 100.000000000000, 100.000000000000, 241.421356237310,
 241.421356237310]
y = [0.0, 100.000000000000, 136.602540378444, 136.602540378444,
 152.494402638233]
z = [0.0, 0, 136.602540378444, 136.602540378444, 309.077027517603]
# 有顔ベクトルの根本と先端の座標
a_x = [241.421356237310, 241.421356237310]
a_y = [152.494402638233, 153.360428042017]
a_z = [309.077027517603, 309.577027517603]
b_x = [241.421356237310, 240.714249456123]
b_y = [152.494402638233, 152.140849247640]
b_z = [309.077027517603, 309.689399953299]
c_x = [241.421356237310, 242.128463018496]
c_y = [152.494402638233, 152.140849247640]
c_z = [309.077027517603, 309.689399953299]


# グラフの表示範囲を決定
# xとyの表示範囲
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

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す5
# モード1
# モード2
# モード3
# モード4

# 正常な入力を試す6
# モード1
# モード2
# モード3
# モード4

# 異常な入力を試す
# モードの入力について
# 1,2,3,4以外の数字を入力
# 文字を入力
# 記号を入力
# 文字と記号と数字の混合の入力
# 何も入力しない

# 自由度の入力について
# 負の値の入力
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない

# 位置ベクトルの入力について
# x成分
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない
# y成分
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない
# z成分
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない

# 回転軸ベクトルの向きの入力について
# x,y,z以外の文字の入力
# 数字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない

# 手先の位置ベクトルの入力について
# x成分
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない
# y成分
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない
# z成分
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない

# モード4の角度の入力について
# 文字の入力
# 記号の入力
# 文字と記号と数字の混合の入力
# 何も入力しない

# エラーがなければOKを表示
[ "$res" = 0 ] && echo OK

exit $res # 終了ステータスを返して終了
