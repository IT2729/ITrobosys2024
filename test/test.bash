#!/bin/bash

cd ~/robosys/robosys2024

error () {
	echo AN ERROR HAS OCCURRED IN TEST$t_num
	res=1
	}


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
# モード4(test4)

# 正常な入力を試す2
# モード1
# モード2
# モード3
# モード4

# 正常な入力を試す3
# モード1
# モード2
# モード3
# モード4

# 正常な入力を試す4
# モード1
# モード2
# モード3
# モード4

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

