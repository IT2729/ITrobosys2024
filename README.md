# robosys2024
ロボットシステム学の講義用に製作

# FKmanipulator.py
<a href="https://github.com/IT2729/robosys2024/actions/workflows/test_FKmanipulator.yml"><img src="https://github.com/IT2729/robosys2024/actions/workflows/test_FKmanipulator.yml/badge.svg" alt="Test status on ubuntu-latest"></a>
<a href="https://github.com/IT2729/robosys2024/tree/main?tab=BSD-3-Clause-1-ov-file"><img alt="GitHub License" src="https://img.shields.io/github/license/IT2729/robosys2024"></a>

<img src="https://i.imgur.com/pV2jqEq.png" alt="the ploted graph">

## Description
入力からマニピュレータの順運動学解を導き、角度を入力後マニピュレータっぽくグラフを描画するプログラム。

上図の先端の赤,緑,青は有顔ベクトルでそれぞれ $\mathrm{a}$ , $\mathrm{b}$ , $\mathrm{c}$ とすると初期値は

$$ \begin{bmatrix}
^{0}\mathrm{a} & ^{0}\mathrm{b} & ^{0}\mathrm{c}
\end{bmatrix} = \begin{bmatrix}
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

```
python FKmanipulator.py
```

あとは案内に従って、

自由度→位置ベクトル→回転軸ベクトル→位置ベクトル→...→回転軸ベクトル

→位置ベクトル→角度→グラフの表示の要否

を入力するだけ。

- 実行例

```
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

<img src="https://i.imgur.com/D3gs2G2.png" alt="the ploted graph of the execution example">

## About GitHub Action
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
      <td width="28.5%">Ubuntu latest ver.<br>(Now ver.22.04.5 LTS)</td>
      <td width="10%">Python</td>
      <td width="12,5%">3.6~3.12</td>
      <td width="12.5%">v3</td>
      <td width="20%"><a href="https://github.com/IT2729/robosys2024/blob/main/test/test_FKmanipulator.bash">test_FKmnaipulator.bash</a></td>
    </tr>
  </tbody>
</table>


## Reference
1. 3Dグラフの作成【matplotlib】(https://liquids.dev/articles/017df634-6a8e-47e0-b0af-6a3fb8bd5790)
2. matplotlibで3次元プロットする際に3軸のスケールを揃える (https://qiita.com/ae14watanabe/items/71f678755525d8088849)

## License

- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

## Copyright

- © 2024 Itsuki Terasawa
