# robosys2024
ロボットシステム学の講義用に製作

# FKmanipulator.py
<a href="https://github.com/IT2729/robosys2024/actions/workflows/test_FKmanipulator.yml"><img src="https://github.com/IT2729/robosys2024/actions/workflows/test_FKmanipulator.yml/badge.svg" alt="Test status on ubuntu-latest"></a>
<a href="https://github.com/IT2729/robosys2024/tree/main?tab=BSD-3-Clause-1-ov-file"><img alt="GitHub License" src="https://img.shields.io/github/license/IT2729/robosys2024"></a>

<img src="https://i.imgur.com/pV2jqEq.png" alt="the ploted graph">

## Description
入力からマニピュレータの順運動学解を導き、それっぽくグラフを描画するプログラム。

上図の先端の赤,緑,青は有顔ベクトルでそれぞれ $\mathrm{a}$ , $\mathrm{b}$ , $\mathrm{c}$ とすると初期値は

$$ \begin{bmatrix}
^{0}\mathrm{a} & ^{0}\mathrm{b} & ^{0}\mathrm{c}
\end{bmatrix} = \begin{bmatrix}
1 & 0 & 0\\
0 & 1 & 0\\
0 & 0 & 1
\end{bmatrix} $$

## Requirement

## Installation

## Usage

## Reference
1. 3Dグラフの作成【matplotlib】( https://liquids.dev/articles/017df634-6a8e-47e0-b0af-6a3fb8bd5790 )
2. matplotlibで3次元プロットする際に3軸のスケールを揃える ( https://qiita.com/ae14watanabe/items/71f678755525d8088849 )


## License

- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

## Copyright

- © 2024 Itsuki Terasawa
