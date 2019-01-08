## 对mybatis构建的DAO层的测试（不使用spring容器）
### 背景
spring容器加载很慢，并且耦合度较高，因而分离出Spring容器，直接测试DAO层
### 注意
本文档只针对mybatis的Mapper的测试，并不包括数据库数据的模拟，如需这方面的帮助，查找dbunit的官网的Getting Start 文档
### 分析
我们会先使用mybatis的SessionFactory 加载配置文件，然后构造出Session， 然后加载待测试Mapper，然后测试Mapper
### 步骤
#### 1.初始化
```java
public class MyBatisUtil {

	public static SqlSessionFactory sessionFactory;

	public static final String RESOURCE = "mybatis/configuration.xml";

	static {
		try {
			// 使用MyBatis提供的Resources类加载mybatis的配置文件
			Reader reader = Resources.getResourceAsReader(MyBatisUtil.RESOURCE);
			// 构建sqlSession的工厂
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 创建能执行映射文件中sql的sqlSession
	public static SqlSession getSession() {
		return sessionFactory.openSession();
	}
}
```
#### 2. 获取session
```java
SqlSession session = MyBatisUtil.getSession();
```
#### 3. 获取待测试Mapper
```java
DeviceStatusMapper mapper = session.getMapper(DeviceStatusMapper.class);
```
#### 4. 运行测试方法
```java
Calendar beginDate = Calendar.getInstance();
beginDate.set(Calendar.MONTH, 5);
beginDate.set(Calendar.YEAR, 2018);
Calendar endDate = Calendar.getInstance();
List<DeviceStatus> status = mapper.getDataByDate(beginDate.getTime(), endDate.getTime());
```
#### 5. 提交事务，关闭SESSION
```java
session.commit();
session.close();
```
#### 6. 验证结果
assertThat(status, hasSize(31));
### 详见
guns 系统---test.com.stylefeng.guns.modular.system.dao.TestDeviceStatusMapper.testGetDataByDate
### 注意事项
需将待测试的Mapper添加到mybatis config文件的mappers里面
