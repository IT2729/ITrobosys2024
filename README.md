# robosys2024
ロボットシステム学の講義用に製作

# fkmanipulator
<a href="https://github.com/IT2729/robosys2024/actions/workflows/test_FKmanipulator.yml"><img src="https://github.com/IT2729/robosys2024/actions/workflows/test_FKmanipulator.yml/badge.svg" alt="Test status on ubuntu-latest"></a>
<a href="https://github.com/IT2729/robosys2024/tree/main?tab=BSD-3-Clause-1-ov-file"><img alt="GitHub License" src="https://img.shields.io/github/license/IT2729/robosys2024"></a>

## Description
標準入力からマニピュレータの先端の順運動学解を導出して標準出力したり、関節位置からマニピュレータを再現したグラフを描画するプログラムのコードを標準出力したりできるプログラム。

このプログラムにはモードが4つあり、それぞれ
1. マニピュレータ先端の位置ベクトルを出力するモード
2. マニピュレータ先端に取り付けられた有顔ベクトル(マニピュレータの先端姿勢)を出力するモード
3. 順運動学解(マニピュレータの先端位置ベクトルと有顔ベクトル)を出力するモード
4. マニピュレータを再現したグラフを描画するプログラムのコードを出力するモード

のようになっている。


先端の位置ベクトル $\mathrm{P} _ r$ は、自由度を $n$ 、基準姿勢時の $i$ 番目の関節から見た $i+1$ 番目の関節の位置ベクトルを $^i\mathrm{P} _ {i+1}$ 、 $i$ 番目の関節の回転軸ベクトル $\hat{\mathrm{s}} _ {i}$ まわりの角度 $\theta _ {i}$ の回転を示す座標回転変換行列を $\mathrm{R} _ {i}$ とすると

$$
\begin{aligned}
\mathrm{P} _ r &= \ ^0\mathrm{P} _ 1 \ + \ \mathrm{R} _ 1 ( \ ^{1}\mathrm{P} _ 2 \ + \ \mathrm{R} _ 2 ( \ ^2\mathrm{P} _ 3 \ + \ \cdots \ + \ \mathrm{R} _ i ( \ ^i\mathrm{P} _ {i+1} \ + \ \cdots \ + \ \mathrm{R} _ {n-1} ( \ ^{n-1}\mathrm{P} _ n \ + \ \mathrm{R} _ n \ ^{n}\mathrm{P} _ r ) \\
&= \ ^0\mathrm{P} _ 1 \ + \ ^0\mathrm{R} _ 1 \ ^1\mathrm{P} _ 2 \ + \ \cdots \ + \ ^0\mathrm{R} _ i \ ^i\mathrm{P} _ {i+1} \ + \ \cdots \ + \ ^0\mathrm{R} _ {n-1} \ ^{n-1}\mathrm{P} _ n + \ ^0\mathrm{R} _ n \ ^n\mathrm{P} _ r 
\end{aligned}
$$

で導出される。ただし、 $^0\mathrm{R} _ i$ は

$$
^0\mathrm{R} _ i = \prod_{k=1}^i \mathrm{R} _ k
$$

基準姿勢時の有顔ベクトル $\hat{\mathrm{a}}$ , $\hat{\mathrm{b}}$ , $\hat{\mathrm{c}}$ は

$$
\begin{bmatrix}
\hat{\mathrm{a}} & \hat{\mathrm{b}} & \hat{\mathrm{c}}
\end{bmatrix} \left( = \begin{bmatrix}
\hat{a}_x & \hat{b}_x & \hat{c}_x\\
\hat{a}_y & \hat{b}_y & \hat{c}_y\\
\hat{a}_z & \hat{b}_z & \hat{c}_z\\
\end{bmatrix} \right) = \begin{bmatrix}
1 & 0 & 0\\
0 & 1 & 0\\
0 & 0 & 1
\end{bmatrix}
$$

となっており、変換後の有顔ベクトル $\mathrm{a}$ , $\mathrm{b}$ , $\mathrm{c}$ は

$$
\begin{bmatrix}
\mathrm{a} & \mathrm{b} & \mathrm{c}
\end{bmatrix} = \ ^0\mathrm{R} _ n \ \begin{bmatrix}
\hat{\mathrm{a}} & \hat{\mathrm{b}} & \hat{\mathrm{c}}
\end{bmatrix}
$$

で導出される。


## Requirement
- NumPy 2.1.3 or later
- SymPy 1.13.3 or later
- Matplotlib 3.9.2 or later(モード4で出力されるコードを実行する場合)

## Installation
インストール方法は以下の通り。

### With pip

```
pip install git+https://github.com/IT2729/robosys2024
```

### With git clone

```
git clone https://github.com/IT2729/robosys2024.git
mv robosys2024/fkmanipulator/fkmanipukator <任意の移動先ディレクトリ>
```

## Usage
実行方法は以下の3通り。
### Standard
プログラムのあるディレクトリで

```
python fkmanipulator
```
を入力して実行。

その後、

モード番号→自由度数 $n$ →  
$^0\mathrm{P} _ 1$ の $x$ 成分の値→ 
$^0\mathrm{P} _ 1$ の $y$ 成分の値→ 
$^0\mathrm{P} _ 1$ の $z$ 成分の値→ 
$\hat{\mathrm{s}} _ 1$ の方向→  
$^1\mathrm{P} _ 2$ の $x$ 成分の値→ 
$^1\mathrm{P} _ 2$ の $y$ 成分の値→ 
$^1\mathrm{P} _ 2$ の $z$ 成分の値→ 
$\hat{\mathrm{s}} _ 2$ の方向→ … →  
$^{n-1}\mathrm{P} _ n$ の $x$ 成分の値→ 
$^{n-1}\mathrm{P} _ n$ の $y$ 成分の値→ 
$^{n-1}\mathrm{P} _ n$ の $z$ 成分の値→ 
$\hat{\mathrm{s}} _ n$ の方向→  
$^n\mathrm{P} _ r$ の $x$ 成分の値→ 
$^n\mathrm{P} _ r$ の $y$ 成分の値→ 
$^n\mathrm{P} _ r$ の $z$ 成分の値

の順で改行または空白区切りで入力。 $^i\mathrm{P} _ {i+1}$ と $\hat{\mathrm{s} _ i}$ についての定義とモード番号についてはDescriptionを参照のこと。 $\hat{\mathrm{s}} _ i$ の方向は $x$ 軸方向まわりの回転なら"x"、 $y$ 軸方向まわりの回転なら"y" 、 $z$ 軸まわりの回転なら"z"を入力。モード番号はコンマなしで入力。何も入力せず改行で入力を終了できる。

また、モード4の場合は最後の入力の後に

$\theta _ 1$ の値→
$\theta _ 2$ の値→ … →
$\theta _ {n-1}$ の値→
$\theta _ n$ の値

の順で改行または空白区切りで入力。 $\theta _ i$ についてもDescriptionを参照のこと。 $\theta _ i$ はdegreeで入力。

モード4で出力されたコードは、pyファイルにコピーペーストするかリダイレクトでpyファイルに出力するかして、

```
python <貼り付けたor出力先のファイル名>.py
```

で実行するとグラフが描画される。

### With Redirecting
txtファイルなどからリダイレクトで入力。

```
python fkmanipulator < <任意のファイル名>.txt
```

入力する順番はStandardと同じ。ファイルの中身は改行区切り(縦並び)でも空白区切り(横並び)でも可。

### With Piping
echoコマンドなどの出力をパイプで繋げて実行。

```
echo <任意の入力データ> | python fkmanipulator
```

入力する順番はStandardと同じ。


- Usage Example 1 (Standard: モード1)
```
$ python fkmanipulator
1
3
1
0
0
x
1
0
0
y
1
0
0
z
1
0
0

[[1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]]
```

- Usage Example 2 (With Redirecting: モード2)
```
$ python fkmanipulator < sample1.txt
[[-1.0*sin(theta1)*sin(theta3) + 1.0*cos(theta1)*cos(theta2)*cos(theta3)
  -1.0*sin(theta1)*cos(theta3) - 1.0*sin(theta3)*cos(theta1)*cos(theta2)
  1.0*sin(theta2)*cos(theta1)]
 [1.0*sin(theta1)*cos(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta3)*cos(theta2) + 1.0*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*sin(theta2)]
 [-1.0*sin(theta2)*cos(theta3) 1.0*sin(theta2)*sin(theta3)
  1.0*cos(theta2)]]
```

<div align="center">
  <div class="input data of usage example 2">
    <img src="https://i.imgur.com/xFstTM3.png"\>
    <p>Usage Example 2で入力したtxtファイルの内容</p>
  </div>
</div>

- Usage Example 3 (With Redirecting: モード3)
```
$ python fkmanipulator < sample2.txt
先端の位置ベクトルは: 0Pr =
[[1.0*(-1.0*sin(theta2)*cos(theta3) - 1.0*sin(theta3)*cos(theta2))*cos(theta1) - 1.0*sin(theta2)*cos(theta1)]
 [-1.0*sin(theta2)*sin(theta3) + 1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [-1.0*(-1.0*sin(theta2)*cos(theta3) - 1.0*sin(theta3)*cos(theta2))*sin(theta1) + 1.0*sin(theta1)*sin(theta2)]]
有顔ベクトルは: [a b c] =
[[1.0*(-sin(theta2)*sin(theta3) + cos(theta2)*cos(theta3))*cos(theta1)
  1.0*(-sin(theta2)*cos(theta3) - sin(theta3)*cos(theta2))*cos(theta1)
  1.0*sin(theta1)]
 [1.0*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta2)
  -1.0*sin(theta2)*sin(theta3) + 1.0*cos(theta2)*cos(theta3) 0]
 [-1.0*(-sin(theta2)*sin(theta3) + cos(theta2)*cos(theta3))*sin(theta1)
  -1.0*(-sin(theta2)*cos(theta3) - sin(theta3)*cos(theta2))*sin(theta1)
  1.0*cos(theta1)]]
```

<div align="center">
  <div class="input data of usage example 3">
    <img src="https://i.imgur.com/Y9zBO3k.png"\>
    <p>Usage Example 2で入力したtxtファイルの内容</p>
  </div>
</div>

- Usage Example 4 (With Piping: モード4)
```
$ echo 4 6 0 0 1 z 0 0 1 x 0 0 1 x 0 0 1 z 0 0 1 x 0 0 1 z 0 0 1 30 60 45 120 90 135 | python fkmanipulator
#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 0, 0, 0.433012701892219, 0.915975615036753, 1.39893852818129,
 2.21364328945692, 3.02834805073255]
y = [0.0, 0, 0, -0.750000000000000, -1.58651630373781, -2.42303260747562,
 -2.10209183960440, -1.78115107173319]
z = [0.0, 1.00000000000000, 2.00000000000000, 2.50000000000000,
 2.24118095489748, 1.98236190979496, 2.46532482293949, 2.94828773608403]
# 有顔ベクトルの根本と先端の座標
a_x = [3.02834805073255, 3.59679379499961]
a_y = [-1.78115107173319, -2.05862120096350]
a_z = [2.94828773608403, 2.17376868324570]
b_x = [3.02834805073255, 2.91378109310739]
b_y = [-1.78115107173319, -0.875608499071280]
b_z = [2.94828773608403, 2.53979408703014]
c_x = [3.02834805073255, 3.84305281200818]
c_y = [-1.78115107173319, -1.46021030386198]
c_z = [2.94828773608403, 3.43125064922856]


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

plt.show()
```


<div align="center">
  <div class="the gragh ploted by an output of usage example 4">
    <img src="https://i.imgur.com/SM4jbvp.png"\>
    <p>Usage Example 4で出力されたコードを実行し描画されたグラフ<br>(黄: マニピュレータ再現部分, 赤: 有顔ベクトル $\mathrm{a}$ , 緑: 有顔ベクトル $\mathrm{b}$ , 青: 有顔ベクトル $\mathrm{c}$ ) </p>
  </div>
</div>

## About GitHub Actions
- <a href="https://github.com/IT2729/robosys2024/blob/main/.github/workflows/test_FKmanipulator.yml">test</a>
<table width="800">
  <thead>
    <tr>
      <th scope="col">Purpose</th>
      <th scope="col">OS</th>
      <th scope="col">Language</th>
      <th scope="col">Language Ver.</th>
      <th scope="col">Checkout Ver.</th>
      <th scope="col">Running Program</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td width="16.5%">For testing</td>
      <td width="28.5%">Ubuntu latest ver.<br>(Now ver. 22.04.5 LTS)</td>
      <td width="10%">Python</td>
      <td width="12,5%">3.6~3.12</td>
      <td width="12.5%">v4</td>
      <td width="20%"><a href="https://github.com/IT2729/robosys2024/blob/main/test/test_FKmanipulator.bash">test_FKmnaipulator.bash</a></td>
    </tr>
  </tbody>
</table>

## Reference
- <a href="https://liquids.dev/articles/017df634-6a8e-47e0-b0af-6a3fb8bd5790">3Dグラフの作成【matplotlib】</a>
- <a href="https://qiita.com/ae14watanabe/items/71f678755525d8088849">matplotlibで3次元プロットする際に3軸のスケールを揃える</a>
- <a href="https://www.shokabo.co.jp/mybooks/ISBN978-4-7853-6512-7.htm">広瀬茂男著，ロボット工学，裳華房</a>

## License

- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

## Copyright

- © 2024 Itsuki Terasawa
