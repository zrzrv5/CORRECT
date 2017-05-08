# calcNbyLevich
利用Koutecký-Levich方程斜率计算转移电子数

- 使用


```
n = calcNbyLevich( K,r,A,C,D,nu )

```

- 说明

 [Koutecký-Levich 方程](http://web.mit.edu/3.53/www/BandFchapters/Chapters8_and_9.pdf)


 $\frac{1}{i}=\frac{1}{i_g}+\frac{1}{0.62nFAC_O^*D_O^{2/3}\nu^{-1/6}\omega^{1/2}}$


 通过得到$\frac{1}{i} - \omega^{-1/2}$图像的斜率计算电子转移数n.

    
  - K: 斜率
  - r: 当转速单位为rad/s时取0.62,当转速单位为rpm时取0.201
  - A: 电极面积
  - C: 浓度
  - D: 扩散系数  
  - nu: 黏滞率
 
 
 ===
 
 
 - n: 电子转移数

-  例子

    设一次实验中所得斜率为64072.7079,转速单位为rpm.则计算电子转移数为:

    ```
    >> n = calcNbyLevich(64072.7079,0.201,(0.25^2)*pi,1.2*10^(-6),1.9*10^(-5),0.01)

    n =

    2.2262
```
 



