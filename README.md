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


先端の位置ベクトル $\mathrm{P} _ r$ は、自由度を $n$ 、基準姿勢での $i$ 番目の関節から見た $i+1$ 番目の関節の位置ベクトルを $^i\mathrm{P} _ {i+1}$ 、 $i$ 番目の関節の回転軸ベクトル $\hat{\mathrm{s}} _ {i}$ まわりの角度 $\theta _ {i}$ の回転を示す座標回転変換行列を $\mathrm{R} _ {i}$ とすると

$$
\begin{aligned}
\mathrm{P} _ r &= \ ^0\mathrm{P} _ 1 \ + \ \mathrm{R} _ 1 ( \ ^{1}\mathrm{P} _ 2 \ + \ \mathrm{R} _ 2 ( \ ^2\mathrm{P} _ 3 \ + \ \cdots \ + \ \mathrm{R} _ i ( \ ^i\mathrm{P} _ {i+1} \ + \ \cdots \ + \ \mathrm{R} _ {n-1} ( \ ^{n-1}\mathrm{P} _ n \ + \ \mathrm{R} _ n \ ^{n}\mathrm{P} _ r ) \\
&= \ ^0\mathrm{P} _ 1 \ + \ ^0\mathrm{R} _ 1 \ ^1\mathrm{P} _ 2 \ + \ \cdots \ + \ ^0\mathrm{R} _ i \ ^i\mathrm{P} _ {i+1} \ + \ \cdots \ + \ ^0\mathrm{R} _ {n-1} \ ^{n-1}\mathrm{P} _ n + \ ^0\mathrm{R} _ n \ ^n\mathrm{P} _ r 
\end{aligned}
$$

で導出される。

有顔ベクトルの初期値 
 $ \begin{bmatrix}
^0\mathrm{a} & ^0\mathrm{b} & ^0\mathrm{c}
\end{bmatrix} $ 
は

$$ \begin{bmatrix}
^0\mathrm{a} & ^0\mathrm{b} & ^0\mathrm{c}
\end{bmatrix} \left( = \begin{bmatrix}
^0a_x & ^0b_x & ^0c_x\\
^0a_y & ^0b_y & ^0c_y\\
^0a_z & ^0b_z & ^0c_z\\
\end{bmatrix} \right) = \begin{bmatrix}
1 & 0 & 0\\
0 & 1 & 0\\
0 & 0 & 1
\end{bmatrix} $$


## Requirement
- NumPy 2.1.3 or later
- SymPy 1.13.3 or later
- Matplotlib 3.9.2 or later

## Installation
インストール方法は以下の通り。

### With pip

```
pip install git+https://github.com/IT2729/robosys2024
```

### With git clone

```
git clone https://github.com/IT2729/robosys2024.git
mv robosys2024/FKmanipulator.py < 任意の移動先ディレクトリ >
```

## Usage
実行方法は以下の通り。

プログラムがあるディレクトリで

```
python FKmanipulator.py
```
を入力する。

あとは案内に従って、

自由度→位置ベクトル→回転軸ベクトル→位置ベクトル→...→回転軸ベクトル

→位置ベクトル→角度→グラフの表示の要否

を入力するだけ。

ただし(n)P(n + 1)表記は、根本からマニピュレータの間接を数えたときのn番目の間接から見たn + 1番目の間接の位置ベクトル。

また0P1表記は根本(原点)からみた1番目の間接の位置ベクトルで、(n)Pr表記は最後の間接からみた先端の位置ベクトル。

θ(n)表記は根本からマニピュレータの間接を数えたときのn番目の間接の回転角度で、角度はradianではなくdegreeで入力。

l(n)表記は(n)P(n + 1)に座標変換行列を掛けたリンクベクトル。

- 実行例

<<<<<<< HEAD
```
=======
```ansi
>>>>>>> main
$ python FKmanipulator.py
自由度を入力してください:3
0P1のx成分を入力してください:0
0P1のy成分を入力してください:0
0P1のz成分を入力してください:1
[[0.0]
 [0.0]
 [1.00000000000000]]
θ1の回転軸ベクトルの向きをx,y,zで入力してください:z
[[0]
 [0]
 [1]]
1P2のx成分を入力してください:0
1P2のy成分を入力してください:0
1P2のz成分を入力してください:1
[[0.0]
 [0.0]
 [1.00000000000000]]
θ2の回転軸ベクトルの向きをx,y,zで入力してください:x
[[1]
 [0]
 [0]]
2P3のx成分を入力してください:0
2P3のy成分を入力してください:0
2P3のz成分を入力してください:1
[[0.0]
 [0.0]
 [1.00000000000000]]
θ3の回転軸ベクトルの向きをx,y,zで入力してください:x
[[1]
 [0]
 [0]]
3Prのx成分を入力してください:0
3Prのy成分を入力してください:0
3Prのz成分を入力してください:1
[[0.0]
 [0.0]
 [1.00000000000000]]
l0 =
[[0]
 [0]
 [1.00000000000000]]
l1 =
[[0]
 [0]
 [1.00000000000000]]
l2 =
[[1.0*sin(theta1)*sin(theta2)]
 [-1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)]]
l3 =
[[-1.0*(-1.0*sin(theta2)*cos(theta3) - 1.0*sin(theta3)*cos(theta2))*sin(theta1)]
 [1.0*(-1.0*sin(theta2)*cos(theta3) - 1.0*sin(theta3)*cos(theta2))*cos(theta1)]
 [-1.0*sin(theta2)*sin(theta3) + 1.0*cos(theta2)*cos(theta3)]]
順運動学解は:
[[-1.0*(-1.0*sin(theta2)*cos(theta3) - 1.0*sin(theta3)*cos(theta2))*sin(theta1) + 1.0*sin(theta1)*sin(theta2)]
 [1.0*(-1.0*sin(theta2)*cos(theta3) - 1.0*sin(theta3)*cos(theta2))*cos(theta1) - 1.0*sin(theta2)*cos(theta1)]
 [-1.0*sin(theta2)*sin(theta3) + 1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]]
有顔ベクトルは:
[[1.0*cos(theta1)
  -1.0*(-sin(theta2)*sin(theta3) + cos(theta2)*cos(theta3))*sin(theta1)
  -1.0*(-sin(theta2)*cos(theta3) - sin(theta3)*cos(theta2))*sin(theta1)]
 [1.0*sin(theta1)
  1.0*(-sin(theta2)*sin(theta3) + cos(theta2)*cos(theta3))*cos(theta1)
  1.0*(-sin(theta2)*cos(theta3) - sin(theta3)*cos(theta2))*cos(theta1)]
 [0 1.0*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta2)
  -1.0*sin(theta2)*sin(theta3) + 1.0*cos(theta2)*cos(theta3)]]
θ1の角度をdegで入力してください:30
θ2の角度をdegで入力してください:45
θ3の角度をdegで入力してください:90
x =
[0.0 0 0 0.353553390593274 0.707106781186547]
y =
[0.0 0 0 -0.612372435695794 -1.22474487139159]
z =
[0.0 1.00000000000000 2.00000000000000 2.70710678118655 2.00000000000000]
グラフを表示しますか？[y/n]:y
```
<div align="center">
  <div class="the gragh ploted by the execution example">
    <img src="https://i.imgur.com/D3gs2G2.png"\>
    <p>実行例で生成されたグラフ</p>
  </div>
</div>

## About GitHub Actions
- <a href="https://github.com/IT2729/robosys2024/blob/main/.github/workflows/test_FKmanipulator.yml">ubuntu-latest</a>
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

## License

- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

## Copyright

- © 2024 Itsuki Terasawa
