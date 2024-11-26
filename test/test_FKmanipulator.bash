#!/bin/bash
# SPDX-FileCopyrightText: 2024 Itsuki Terasawa
# SPDX-License-Identifier: BSD-3-Clause

error () {
	echo AN ERROR HAS OCCURRED IN TEST$t_num
	res=1
}

res=0

cd ~/robosys/robosys2024

###正常な入力を試す1###
t_num=1
python "FKmanipulator.py" < "test/test1_FKmanipulator_input.txt" > "test/test1_FKmanipulator_output.txt" #入出力をtxtファイルにして実行
out=$(diff "test/test1_FKmanipulator_output.txt" "test/test1_FKmanipulator_correctoutput.txt") #正しい出力結果txtファイルと比較
[ "$out" = "" ] || error #比較して差があればエラー

###正常な入力を試す2###
t_num=2
python "FKmanipulator.py" < "test/test2_FKmanipulator_input.txt" > "test/test2_FKmanipulator_output.txt"
out=$(diff "test/test2_FKmanipulator_output.txt" "test/test2_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###正常な入力を試す3###
t_num=3
python "FKmanipulator.py" < "test/test3_FKmanipulator_input.txt" > "test/test3_FKmanipulator_output.txt"
out=$(diff "test/test3_FKmanipulator_output.txt" "test/test3_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###正常な入力を試す4###
t_num=4
python "FKmanipulator.py" < "test/test4_FKmanipulator_input.txt" > "test/test4_FKmanipulator_output.txt"
out=$(diff "test/test4_FKmanipulator_output.txt" "test/test4_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###正常な入力を試す5###
t_num=5
python "FKmanipulator.py" < "test/test5_FKmanipulator_input.txt" > "test/test5_FKmanipulator_output.txt"
out=$(diff "test/test5_FKmanipulator_output.txt" "test/test5_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###x,y,zで入力のところにx,y,z以外の文字を、y,nで入力のところにy,n以外の文字を入力してみる###
t_num=6
python "FKmanipulator.py" < "test/test6_FKmanipulator_input.txt" > "test/test6_FKmanipulator_output.txt"
out=$(diff "test/test6_FKmanipulator_output.txt" "test/test6_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###数字で入力のところに文字を、x,y,zで入力のところの数字を入力してみる###
t_num=7
python "FKmanipulator.py" < "test/test7_FKmanipulator_input.txt" > "test/test7_FKmanipulator_output.txt"
out=$(diff "test/test7_FKmanipulator_output.txt" "test/test7_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###記号を入力してみる###
t_num=8
python "FKmanipulator.py" < "test/test8_FKmanipulator_input.txt" > "test/test8_FKmanipulator_output.txt"
out=$(diff "test/test8_FKmanipulator_output.txt" "test/test8_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###数字と文字と記号を混ぜて入力してみる###
t_num=9
python "FKmanipulator.py" < "test/test9_FKmanipulator_input.txt" > "test/test9_FKmanipulator_output.txt"
out=$(diff "test/test9_FKmanipulator_output.txt" "test/test9_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###大きすぎる値とか小さすぎる値とかを入力してみる###
t_num=10
python "FKmanipulator.py" < "test/test10_FKmanipulator_input.txt" > "test/test10_FKmanipulator_output.txt"
out=$(diff "test/test10_FKmanipulator_output.txt" "test/test10_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###自由度を0にしてみる###
t_num=11
python "FKmanipulator.py" < "test/test11_FKmanipulator_input.txt" > "test/test11_FKmanipulator_output.txt"
out=$(diff "test/test11_FKmanipulator_output.txt" "test/test11_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

###何も入力せず改行してみる###
t_num=12
python "FKmanipulator.py" < "test/test12_FKmanipulator_input.txt" > "test/test12_FKmanipulator_output.txt"
out=$(diff "test/test12_FKmanipulator_output.txt" "test/test12_FKmanipulator_correctoutput.txt")
[ "$out" = "" ] || error 

#エラーがなければOKを表示
[ "$res" = 0 ] && echo OK

exit $res #終了ステータスを返して終了

