### fastjson  str -->对象，目标对象带有泛型参数的处理方式
```java
RedisJsonObjectWrapper<TstTask> wrapper = JSONObject
				.parseObject(json, new TypeReference<RedisJsonObjectWrapper<TstTask>>(){});
```
```java
public class RedisJsonObjectWrapper<T> {
	private String type;
	private T data;

	public RedisJsonObjectWrapper(T t, String type){
		this.type  = type;
		this.setData(t);
	}

	public RedisJsonObjectWrapper(){

	}

  [...]
}
```
### 而不可以使用
```java
RedisJsonObjectWrapper<TstTask> wrapper = JSONObject
				.parseObject(json, RedisJsonObjectWrapper<TstTask>.class);
```
java中没有这种语法
