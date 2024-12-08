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

で導出される。ただし、 $^0\mathrm{R} _ i$ は

$$
^0\mathrm{R} _ i = \prod_{k=1}^i \mathrm{R} _ k
$$

有顔ベクトルの初期値 $\hat{\mathrm{a}}$ , $\hat{\mathrm{b}}$ , $\hat{\mathrm{c}}$ は

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
- そのまま実行する。
<p style"text-indent:1em;">
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
$\hat{\mathrm{s}} _ 1$ の方向の値→  
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

の順で改行または空白区切りで入力。 $^i\mathrm{P} _ {i+1}$ と $\hat{\mathrm{s} _ i}$ についての定義とモード番号についてはDescriptionを参照のこと。 $\hat{\mathrm{s}} _ i$ の方向は $x$ 軸方向まわりの回転なら $"x"$ 、 $y$ 軸方向まわりの回転なら $"y"$ 、 $z$ 軸まわりの回転なら $"z"$ を入力。モード番号はコンマなしで入力。

また、モード4の場合は最後の入力の後に

$\theta _ 1$ の値→
$\theta _ 2$ の値→ … →
$\theta _ {n-1}$ の値→
$\theta _ n$ の値

の順で改行または空白区切りで入力。 $\theta _ i$ についてもDescriptionを参照のこと。 $\theta _ i$ はdegreeで入力。
</p>

- パイプで入力を繋げて実行する。
- リダイレクトで入力を繋げて実行する。


<div align="center">
  <div class="the gragh ploted by the execution example">
    <img src="https://i.imgur.com/D3gs2G2.png"\>
    <p>実行例で生成されたグラフ</p>
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
