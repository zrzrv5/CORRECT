# calcNbyjw
利用最小二乘法拟合1/j~ω^-0.5 的斜率然后利用**[calcNbyLevich()](docs/calcNbyLevich.md)**计算转移电子数.


- 使用

```
ns = calcNbyjw(jMat,vArray,wArray,verbose)
```

- 说明

    - `jMat` : 电流矩阵,每一行是同一ω下不同电压下的电流
    - `vArray` : 电压数组
    - `wArray` : ω数组
    
    ---
    
    - `ns` : 转移电子数数组




