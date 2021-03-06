# calcNfromFiles

由不同转速下测得的.cor文件计算电子转移数

- 使用

```
[ n,handler ] = calcNfromFiles( filenames,omegaArray,vArray,KLargs,displayResult )
```

- 说明
    
    - `filenames` : 文件名cell数组 **注意** 应使用`{}`而非`[]`
    - `omegaArray` : ω数组,应与filenames相符
    - `vArray` : 电压范围
    - `KLargs` : Koutecký-Levich方程中有关参数数组.详情参见[calcNbyLevich](docs/calcNbyLevich.md)
    - `displayResult` : 是否显示计算过程与结果.可省略,当电压范围过多时建议省略.

    ---
    
    - `n` : 与vArray对应的电子转移数n
    - `handler` : 图像句柄

- 例子

    设在当前文件夹下有一存有不同转速下测得的循环伏安数据的文件夹`data`
    `data`文件夹中有下列文件:
    
    ```
    Pt-C_O2_400.cor    Pt-C_O2_625.cor    Pt-C_O2_900.cor    Pt-C_O2_1225.cor    Pt-C_O2_1600.cor    Pt-C_O2_2025.cor
    ```
    
    指定文件cell数组,字符串cell数组应用`{}`而非`[]`.
    
    ```
    files = {'data/Pt-C_O2_400.cor','data/Pt-C_O2_625.cor','data/Pt-C_O2_900.cor','data/Pt-C_O2_1225.cor','data/Pt-C_O2_1600.cor','data/Pt-C_O2_2025.cor'};
    ```
    
    指定角速度ω
    
    ```
    rpm = [400,625,900,1225,1600,2025];
    omega = rpm * 2 * pi;
    ```
    指定参数
    
    ```matlab
    dKLargs = [0.201,(0.25^2)*pi,1.2*10^(-6),1.9*10^(-5),0.01];
    %由于使用rpm而非rps,r需取0.201
    %电极半径为0.25cm
    %浓度
    %扩散系数
    %黏滞率
    ```
    
    计算并绘图
    
    ```
calcNfromFiles(files,omega,linspace(-1,-0.0,1000),dKLargs);    
    ```
    
    




