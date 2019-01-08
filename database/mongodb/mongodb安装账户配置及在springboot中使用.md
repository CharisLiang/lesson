## 安装
### step1
到官网下载windows版本64位的zip包
### step2
解压到本地目录
### step3
#### 配置环境变量
将mongodb的bin目录配置到path环境变量中
### step4
设置为服务
#### 1. 在mongodb根目录下创建文件:mongod.cfg, 并且输入一下内容：
```shell
systemLog:
    destination: file
    path: c:\data\log\mongod.log
storage:
    dbPath: c:\data\db
```
#### 2. 安装服务, 其中auth 代表客户端每次连接需要鉴权
```shell
mongod.exe --config "C:\mongodb\mongod.cfg" --auth --install
```
#### 3. 启动服务
```shell
net start MongoDB
```
#### 4. 关闭服务
```shell
net stop MongoDB
```
#### 5. 移除服务
```shell
mongod.exe --remove
```

##帐号设置
### step1 设置管理员账户
#### 1. 登录客户端
```shell
mongo.exe
```
#### 2. 创建管理员账户
```shell
use admin

db.createUser(
{user:'user',
 pwd:'passwd',
 roles:[
   {role:'userAdminAnyDatabase', db:'admin'}
]
})
```
#### 3. 使用用户管理账户登录认证
```shell
use admin
db.auth('user', 'passwd')
```
#### 4. 建立普通帐号
```shell
use admin

db.createUser(
{user:'user1',
 pwd:'passwd1',
 roles:[
   {role:'readWrite', db:'userdb'}
]
})
```
#### 5. 使用普通帐号登录
```shell
use userdb

db.auth("user1","passwd1")
```


## Springboot 中使用 Spring-data-mongodb 使用DAO层操作 mongodb
### 引入依赖
Spring Boot中可以通过在pom.xml中加入spring-boot-starter-data-mongodb引入对mongodb的访问支持依赖。它的实现依赖spring-data-mongodb。
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-mongodb</artifactId>
</dependency>
```
### 创建要存储的User实体
```java
public class User {

    @Id
    private Long id;

    private String username;
    private Integer age;

    public User(Long id, String username, Integer age) {
        this.id = id;
        this.username = username;
        this.age = age;
    }

    // 省略getter和setter

}
```
### 实现User的数据访问对象：UserDao
```java
public interface UserDao extends MongoRepository<User, Long> {

	User findByUsername(String username);
}
```
### 参数配置
```yml
spring:
  data:
    mongodb:
      uri: mongodb://device:laidian2018@localhost:27017/devicemanager
```
### 测试
```java
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes={DemoApplication.class})
public class TestMongodb {

	@Autowired
	private UserDao userDao;


	@Before
	public void setUp(){
		userDao.deleteAll();
	}

	@SuppressWarnings("deprecation")
	@Test
	public void testAdd(){
		userDao.save(new User(1L, "didi", 30));
		userDao.save(new User(2L, "mama", 40));
		userDao.save(new User(3L, "kaka", 50));

		Assert.assertEquals(3, userDao.findAll().size());
		Assert.assertEquals(new Integer(30), userDao.findByUsername("didi").getAge());
		userDao.deleteAll();
	}



	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
```
