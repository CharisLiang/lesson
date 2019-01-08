## 订阅

 配置：

```java
package com.stylefeng.guns.config;

import java.util.concurrent.CountDownLatch;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

import com.stylefeng.guns.modular.message.Receiver;

@Configuration
public class RedisConfig {

	@Bean
	public RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory,
			MessageListenerAdapter listenerAdapter) {
		RedisMessageListenerContainer container = new RedisMessageListenerContainer();
		container.setConnectionFactory(connectionFactory);
		container.addMessageListener(listenerAdapter, new PatternTopic("device-import"));
		container.addMessageListener(listenerAdapter, new PatternTopic("__keyevent@0__:expired"));
		return container;
	}

	@Bean
	MessageListenerAdapter listenerAdapter(Receiver receiver) {
		return new MessageListenerAdapter(receiver, "receiveMessage");
	}

	@Bean
    public Receiver receiver(CountDownLatch latch){
        return new Receiver(latch);
    }

	@Bean
    public CountDownLatch latch(){
        return new CountDownLatch(1);//指定了计数的次数 1
    }

}

```
### 说明
#### 1. 指定接收订阅消息的类，及方法。
```java
 return new MessageListenerAdapter(receiver, "receiveMessage")
 ```
#### 2. 指定要订阅的频道，可以订阅多个频道
```java
container.addMessageListener(listenerAdapter, new PatternTopic("device-import"))
container.addMessageListener(listenerAdapter, new PatternTopic("__keyevent@0__:expired"));
```

#### 3. 订阅事件
```java
container.addMessageListener(listenerAdapter, new PatternTopic("__keyevent@0__:expired"));
```
其中： __keyevent@0__:expired 代表 数据库0 的所有key的超时事件


## 订阅消息的接收类
```java
private CountDownLatch latch;

	@Autowired
	public Receiver(CountDownLatch latch) {
		this.latch = latch;
	}

	public void receiveMessage(String message, String channel) {
		logger.info("接收到redis订阅：  " + message + ">");
		//deviceService.saveAllDeviceStatus();

		latch.countDown();
	}
```

## 发布
```java
@Autowired
	private RedisTemplate<String,String> template;

	@RequestMapping("/hello2")
	@ResponseBody
	public String test(){
		template.convertAndSend("device-import","18888888888");
		template.convertAndSend("device-import","2");
		template.convertAndSend("device-import","3");
		return "Hello world!";
	}
```

## 发布/接收key过期事件
####　参考上面，添加如下发布（主题）：
```java
container.addMessageListener(listenerAdapter, new PatternTopic("__keyevent@0__:expired"));
```
####　订阅方式与上文提到的方法一样

## 注意事项
### redis配置默认关闭所有事件发布，需要在配置文件中打开/etc/redis/18701.conf
```shell
notify-keyspace-events Ex
```
