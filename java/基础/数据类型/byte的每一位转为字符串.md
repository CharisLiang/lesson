## 具体办法
```java
    /**
     * 把byte转为字符串的bit
     */
    public static String byteToBit(byte b) {
        return ""
                + (byte) ((b >> 7) & 0x1) + (byte) ((b >> 6) & 0x1)
                + (byte) ((b >> 5) & 0x1) + (byte) ((b >> 4) & 0x1)
                + (byte) ((b >> 3) & 0x1) + (byte) ((b >> 2) & 0x1)
                + (byte) ((b >> 1) & 0x1) + (byte) ((b >> 0) & 0x1);
    }
```

## 说明
### 移位运算符
|符号|说明|
|---|---|
|>>   | 右移运算符，num >> 1,相当于num除以2  |
|<<   |  左移运算符，num << 1,相当于num乘以2  |
|>>>   | 无符号右移，忽略符号位，空位都以0补齐   |

### 清空其它位，保留特定位
###### & 的作用是： 将byte与另一个byte 的每一个bit进行与操作
如： 只保留最低位： <br/>
b & 0x1 <br/>
其结果必然为：00000001
