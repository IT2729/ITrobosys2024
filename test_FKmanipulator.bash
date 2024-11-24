#!/bin/bash

error () {
	echo ERROR
	res=1
}

res=0

###正常な入力を試す1###
python "FKmanipulator.py" < "test1_FKmanipulator_input.txt" > "test1_FKmanipulator_output.txt" #入出力をtxtファイルにして実行
out=$(diff "test1_FKmanipulator_output.txt" "test1_FKmanipulator_correctoutput.txt") #正しい出力結果txtファイルと比較
[ "$out" = "" ] || error #比較して差があればエラー

###正常な入力を試す2###
#python "FKmanipulator.py" < "test2_FKmanipulator_input.txt" > "test2_FKmanipulator_output.txt"
#out=$(diff "test2_FKmanipulator_output.txt" "test2_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###正常な入力を試す3###
#python "FKmanipulator.py" < "test3_FKmanipulator_input.txt" > "test3_FKmanipulator_output.txt"
#out=$(diff "test3_FKmanipulator_output.txt" "test3_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###正常な入力を試す4###
#python "FKmanipulator.py" < "test4_FKmanipulator_input.txt" > "test4_FKmanipulator_output.txt"
#out=$(diff "test4_FKmanipulator_output.txt" "test4_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###x,y,zで入力のところにx,y,z以外の文字を入力してみる###
#python "FKmanipulator.py" < "test5_FKmanipulator_input.txt" > "test5_FKmanipulator_output.txt"
#out=$(diff "test5_FKmanipulator_output.txt" "test5_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###数字で入力のところに文字を、x,y,zで入力のところの数字を入力してみる###
#python "FKmanipulator.py" < "test6_FKmanipulator_input.txt" > "test6_FKmanipulator_output.txt"
#out=$(diff "test6_FKmanipulator_output.txt" "test6_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###記号を入力してみる###
#python "FKmanipulator.py" < "test7_FKmanipulator_input.txt" > "test7_FKmanipulator_output.txt"
#out=$(diff "test7_FKmanipulator_output.txt" "test7_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###数字と文字と記号を混ぜて入力してみる###
#python "FKmanipulator.py" < "test8_FKmanipulator_input.txt" > "test8_FKmanipulator_output.txt"
#out=$(diff "test8_FKmanipulator_output.txt" "test8_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

###大きすぎる値とか小さすぎる値とかを入力してみる###
#python "FKmanipulator.py" < "test9_FKmanipulator_input.txt" > "test9_FKmanipulator_output.txt"
#out=$(diff "test9_FKmanipulator_output.txt" "test9_FKmanipulator_correctoutput.txt")
#[ "$out" = "" ] || error 

#エラーがなければOKを表示
[ "$res" = 0 ] && echo OK

exit $res #終了ステータスを返して終了

