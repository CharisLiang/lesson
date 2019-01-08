## springboot 中注入redis
### 1. 配置文件中配置连接信息
```yml
spring:
  redis:
    host: 111.230.98.58
    port: 18701
    password: 123456
```
### 2. 注入RedisTemplate;
```java
  @Autowired
  private RedisTemplate<String, String> template;

  public RedisTemplate<String, String> getTemplate() {
		return template;
	}

	public void setTemplate(RedisTemplate<String, String> template) {
		this.template = template;
	}
```
### 3. 使用：
```java
Object obj = template.boundHashOps(RedisConstant.REDIS_HASH_DEVICE).get(sn);
```
```java
template.boundHashOps(RedisConstant.REDIS_HASH_DEVICE).put(sn, jsonStr);
```


## 不使用Springboot注入
```java
public class RedisUtil {

	private static final String REDIS_LOCAL_PASSWORD = "123456";
	private static final int REDIS_LOCAL_PORT = 18701;
	private static final String REDIS_LOCAL_URL = "111.230.98.58";

	public static final RedisTemplate<String,String> getRedisTemplate(){
		JedisConnectionFactory conn = new JedisConnectionFactory();
        conn.setHostName(REDIS_LOCAL_URL);
        conn.setPort(REDIS_LOCAL_PORT);
        conn.setPassword(REDIS_LOCAL_PASSWORD);
        conn.setUsePool(true);
        conn.afterPropertiesSet();
        RedisTemplate<String, String> template = new StringRedisTemplate(conn);;
        template.afterPropertiesSet();
        return template;
	}
}
```
调用
```java
RedisTemplate<String, String> template = RedisUtil.getRedisTemplate();
template.boundListOps("orders").leftPush(json);
```
