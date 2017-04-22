# meanOfCircleAtPoint

计算一圈中某横坐标值对应的平均纵轴值

- 使用

```
meanY = meanOfCircleAtPoint( x,circleData,xIndex,yIndex )
```

- 说明

    - x : 待计算的横坐标值
    - `circleData` : 一圈的数据,即`corRead.circleN`
    - `xIndex` : 横轴物理量在`circleData`中的所在列数
    - `yIndex` : 纵轴物理量在`circleData`中的所在列数

    
    ===
    - `meanY` : 计算后的纵轴物理量平均值
- 例子

设现有从`corRead()`中获取的第二圈数据:

```
c2 = corRead('400rpm -1-0.2 O2.cor','%f %f %f',3).circle2
```
其第一列为电压,第二列为电流密度,第三列为时间.欲求电压为-0.6V时的电流密度:

```
j=meanOfCircle(-0.6,c2,1,2);
```
---

