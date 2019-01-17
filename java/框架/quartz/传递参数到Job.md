### 首先在运行前传入参数
JobDetail类的getJobDataMap()方法，返回值JobDataMap，可以在此基础上进行Map操作。

例如：
```java
job.getJobDataMap().put("love", "I love you very much!");
```

### 其次在job中获得参数
在execute方法中，传入上下文context，如下所示：
```java
public void execute(JobExecutionContext context)
```
再获得JobDataMap，从Map中获得所需数据，示例代码如下：
```java
String jobName = context.getJobDetail().getName();

JobDataMap dataMap = context.getJobDetail().getJobDataMap();

String strData = dataMap.getString("love");
```
