## Mock 操作
### 只是mock 所有方法都使用默认操作
#### 命名规则
mock + InClass + 类名
#### 举例
mockClassTstTaskRedisDao()

### mock 一个方法
#### 命名规则：
mock + Method + 方法名 + InClass + 类名 [ + When + Conditions][ + For + Test + 测试方法]
#### 举例   模拟RedisDao.getBySn 方法
##### 没有条件
mockMethodGetBySnInClassRedisDao()
##### 有条件
mockMethodGetBySnInClassRedisDaoWhenThrowNoSuchException
##### 没有条件，有两个测试要模拟这个方法，但是这两个测试的模拟方式不一样
mockMethodGetBySnInClassRedisDaoForTestAAA
mockMethodGetBySnInClassRedisDaoForTestBBB
##### 有条件，有两个测试要模拟这个方法，但是这两个测试的模拟方式不一样
mockMethodGetBySnInClassRedisDaoWhenThrowNoSuchExceptionForTestAAAA
mockMethodGetBySnInClassRedisDaoWhenThrowNoSuchExceptionForTestBBBB

### mock 2个方法以上
#### 命名规则：
mock + MultiMethods + InClass + 类名 [ + When + Conditions][ + For + Test + 测试方法]
#### 举例
类似于《mock 一个方法》
