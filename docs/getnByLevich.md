# getnByLevich
利用Koutecký-Levich方程斜率计算转移电子数

- 使用


```
n = getnByLevich( K,r,A,C,D,nu )
```

- 说明

 [Koutecký-Levich 方程](http://web.mit.edu/3.53/www/BandFchapters/Chapters8_and_9.pdf):

 <!--$$\frac{1}{i}=\frac{1}{i_g}+\frac{1}{0.62nFAC_O^*D_O^{2/3}\nu^{-1/6}\omega^{1/2}}$$-->
 
 ![img1](http://www.sciweavers.org/tex2img.php?eq=%5Cfrac%7B1%7D%7Bi%7D%3D%5Cfrac%7B1%7D%7Bi_g%7D%2B%5Cfrac%7B1%7D%7B0.62nFAC_O%5E%2AD_O%5E%7B2%2F3%7D%5Cnu%5E%7B-1%2F6%7D%5Comega%5E%7B1%2F2%7D%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
通过得到![img2](http://www.sciweavers.org/tex2img.php?eq=%5Cfrac%7B1%7D%7Bi%7D%20-%20%5Comega%5E%7B-1%2F2%7D&bc=White&fc=Black&im=jpg&fs=10&ff=arev&edit=0)图像的斜率计算电子转移数n.

 - K: 斜率
  - r: 当转速单位为rps时取0.62,当转速单位为rpm时取0.201
    - A: 电极面积
    - C: 浓度
    - D: 扩散系数  
    - nu: 黏滞率
 
 
 ===
 
 
    - n: 电子转移数

-  例子

设一次实验中所得斜率为64072.7079,转速单位为rpm则计算电子转移数为:

```
n = getnByLevich(K,0.201,(0.25^2)*pi,1.2*10^(-6),1.9*10^(-5),0.01)

n=-1.4484
```
 



