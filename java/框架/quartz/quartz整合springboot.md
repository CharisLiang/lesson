## maven 坐标
除了SpringBoot本身的依赖以外，还需要：
```xml
<dependency>
	<groupId>org.quartz-scheduler</groupId>
	<artifactId>quartz</artifactId>
	<version>2.2.1</version>
</dependency>
<dependency>
	<groupId>org.quartz-scheduler</groupId>
	<artifactId>quartz-jobs</artifactId>
	<version>2.2.1</version>
</dependency>
```
## 配置文件
#### 在/src/main/resources/目录下创建quartz.properties文件，添加以下内容：
```shell
org.quartz.scheduler.instanceName = DefaultQuartzScheduler
org.quartz.scheduler.rmi.export = false
org.quartz.scheduler.rmi.proxy = false
org.quartz.scheduler.wrapJobExecutionInUserTransaction = false

org.quartz.threadPool.class = org.quartz.simpl.SimpleThreadPool

org.quartz.threadPool.threadCount = 5
org.quartz.threadPool.threadPriority = 5
org.quartz.threadPool.threadsInheritContextClassLoaderOfInitializingThread = true

org.quartz.jobStore.misfireThreshold = 5000
# 保存到内存中，不持久化到数据库
org.quartz.jobStore.class = org.quartz.simpl.RAMJobStore
```
#### 若要保存到数据库，则应为:
```shell
# 固定前缀org.quartz
# 主要分为scheduler、threadPool、jobStore、plugin等部分
#
#
org.quartz.scheduler.instanceName = DefaultQuartzScheduler
org.quartz.scheduler.rmi.export = false
org.quartz.scheduler.rmi.proxy = false
org.quartz.scheduler.wrapJobExecutionInUserTransaction = false

# 实例化ThreadPool时，使用的线程类为SimpleThreadPool
org.quartz.threadPool.class = org.quartz.simpl.SimpleThreadPool

# threadCount和threadPriority将以setter的形式注入ThreadPool实例
# 并发个数
org.quartz.threadPool.threadCount = 5
# 优先级
org.quartz.threadPool.threadPriority = 5
org.quartz.threadPool.threadsInheritContextClassLoaderOfInitializingThread = true

org.quartz.jobStore.misfireThreshold = 5000

# 默认存储在内存中
#org.quartz.jobStore.class = org.quartz.simpl.RAMJobStore

#持久化
org.quartz.jobStore.class = org.quartz.impl.jdbcjobstore.JobStoreTX

org.quartz.jobStore.tablePrefix = QRTZ_

org.quartz.jobStore.dataSource = qzDS

org.quartz.dataSource.qzDS.driver = com.mysql.jdbc.Driver

org.quartz.dataSource.qzDS.URL = jdbc:mysql://190.0.1.88:3306/hello_test?useUnicode=true&characterEncoding=UTF-8

org.quartz.dataSource.qzDS.user = root

org.quartz.dataSource.qzDS.password = root

org.quartz.dataSource.qzDS.maxConnections = 10
```

#### 同时需要在数据库创建对应的表
```sql
#
# Quartz seems to work best with the driver mm.mysql-2.0.7-bin.jar
#
# PLEASE consider using mysql with innodb tables to avoid locking issues
#
# In your Quartz properties file, you'll need to set
# org.quartz.jobStore.driverDelegateClass = org.quartz.impl.jdbcjobstore.StdJDBCDelegate
#

DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;


CREATE TABLE QRTZ_JOB_DETAILS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE QRTZ_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE QRTZ_SIMPLE_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(10) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CRON_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_BLOB_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CALENDARS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_FIRED_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    SCHED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE QRTZ_SCHEDULER_STATE
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE QRTZ_LOCKS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL,
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);


commit;

```
## 配置类:
#### 目的是配置好schedular类，该类是大部份操作的入口
```java
@Configuration
public class SchedulerConfig {

	@Autowired
	private InjectableJobFactory jobFactory;

    @Bean(name="SchedulerFactory")
    public SchedulerFactoryBean schedulerFactoryBean() throws IOException {
        SchedulerFactoryBean factory = new SchedulerFactoryBean();
        factory.setJobFactory(jobFactory);
        factory.setQuartzProperties(quartzProperties());
        return factory;
    }

    @Bean
    public Properties quartzProperties() throws IOException {
        PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
        propertiesFactoryBean.setLocation(new ClassPathResource("/quartz.properties"));
        //在quartz.properties中的属性被读取并注入后再初始化对象
        propertiesFactoryBean.afterPropertiesSet();
        return propertiesFactoryBean.getObject();
    }

    /*
     * quartz初始化监听器
     */
    @Bean
    public QuartzInitializerListener executorListener() {
       return new QuartzInitializerListener();
    }

    /*
     * 通过SchedulerFactoryBean获取Scheduler的实例
     */
    @Bean(name="quartzScheduler")
    public Scheduler scheduler() throws IOException {
        return schedulerFactoryBean().getScheduler();
    }

	public InjectableJobFactory getJobFactory() {
		return jobFactory;
	}

	public void setJobFactory(InjectableJobFactory jobFactory) {
		this.jobFactory = jobFactory;
	}

}
```

## 实现Job类
#### 具体要做的工作（业务逻辑）就在这里编写
```java
//该注解的作用：禁止多线程同时执行Job,保证同一时间只有一个Job在执行
// (保证上一个任务执行完后，再去执行下一个任务)
@DisallowConcurrentExecution
public class SendTaskJob implements Job {
	private static Logger logger = LoggerFactory.getLogger(Logger.class);

	private static final int INTERVAL_OF_EACH_ORDER = 5000;

	@Autowired
	private TstDeviceTestPlantRedisDao redisDao;
	@Autowired
	private TstTaskService taskService;
	@Autowired
	private TstDeviceTestPlantDao plantDao;


	private boolean jobHasStoped(JobExecutionContext context, String group){
		Scheduler scheduler = context.getScheduler();
		JobDetail dt = null;
		try {
			dt = scheduler.getJobDetail(new JobKey(QuartzHelper.DEFAULT_JOB_NAME, group));
		} catch (SchedulerException e) {
			return true;
		}
		if(dt == null) return true;
		return false;
	}

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		String deviceSn = context.getJobDetail().getJobDataMap().getString("deviceSn");
		int channelCount = context.getJobDetail().getJobDataMap().getInt("channelCount");
		if(channelCount == 0) channelCount = TstDevice.TOTAL_CHANNEL_COUNTS;
		TstDeviceTestPlant plant = redisDao.getBySn(deviceSn);
		for(int i=0; i < channelCount; i++){
			try{
				if(jobHasStoped(context, deviceSn)){
					return;
				}

				Integer plantId = context.getJobDetail().getJobDataMap().getInt("plantId");
				taskService.create(deviceSn, 0, i + 1, TaskType.TYPE_CODE_ORDER, plantId);
				Thread.sleep(INTERVAL_OF_EACH_ORDER);
			}
			catch(Exception e){
				logger.info("生成订单发生异常，但Job必须继续执行！");
			}

		}
		int currentTimes = plant.getCurrentTimes();
		if(jobHasStoped(context, deviceSn)){
			return;
		}
		if(currentTimes >= plant.getRepeatTimes()){

			Integer id = context.getJobDetail().getJobDataMap().getInt("plantId");
			TstDeviceTestPlant plantInDb = plantDao.selectById(id);

			if(plantInDb == null){
				plant.setFinishFlag(true);
				plant.setFinishReason(FinishReason.EXECUTE_SUCCESS);
				plant.setFinishTime(new Date());

				plantDao.insert(plant);
			}else{
				plantInDb.setCurrentTimes(plantInDb.getRepeatTimes());
				plantInDb.setFinishFlag(true);
				plantInDb.setFinishReason(FinishReason.EXECUTE_SUCCESS);
				plantInDb.setFinishTime(new Date());
				plantDao.updateById(plantInDb);
			}
			redisDao.deleteBySn(deviceSn);
		}
		else{

			plant.setCurrentTimes(plant.getCurrentTimes() + 1);
			redisDao.updateBySn(plant);
		}
	}

	public TstDeviceTestPlantRedisDao getRedisDao() {
		return redisDao;
	}

	public void setRedisDao(TstDeviceTestPlantRedisDao redisDao) {
		this.redisDao = redisDao;
	}

	public TstTaskService getTaskService() {
		return taskService;
	}

	public void setTaskService(TstTaskService taskService) {
		this.taskService = taskService;
	}

	public TstDeviceTestPlantDao getPlantDao() {
		return plantDao;
	}

	public void setPlantDao(TstDeviceTestPlantDao plantDao) {
		this.plantDao = plantDao;
	}

}
```
## 对Job进行操作
#### 包括创建，删除，暂停，继续等操作
```java
@Component
public class QuartzHelper {

	private static final String ERROR_MESSAGE_OF_CREATING_PREBURNINGJOB = "创建quartz任务： PreBurningJob";

	public static final String DEFAULT_JOB_NAME = "defaultJobName";

	@Autowired
	@Qualifier("quartzScheduler")
    private Scheduler scheduler;

	private JobDetail getJobDetail(String group){
		JobKey jobKey = new JobKey(DEFAULT_JOB_NAME, group);
		JobDetail jobDetail = null;
		try {
			jobDetail = scheduler.getJobDetail(jobKey);
		} catch (SchedulerException e) {
			throw new DeviceTestBaseException("获取Job的细节失败");
		}
		if(jobDetail == null)
			throw new DeviceTestBaseException("获取到的JobDetail为null");
		return jobDetail;
	}

	public String getJobParam(String group, String paramName){
		JobDetail jobDetail = getJobDetail(group);
		Object obj = jobDetail.getJobDataMap().get(paramName);
		return obj.toString();

	}

	public boolean existJob(String job, String group){
		try {
			List<String> groupNames = scheduler.getJobGroupNames();
			for(String groupName: groupNames){
				if(group == null || group.equals(groupName)){
					return true;
				}
			}
		} catch (SchedulerException e) {
			throw new BaseSchedulerException("获取groupNames 发生异常");
		}
		return false;
	}

	public void pause(String group) {
		boolean hasSuchJobRunning = existJob(DEFAULT_JOB_NAME, group);
		if(!hasSuchJobRunning)
			throw new DeviceTestBaseException("没有对应的JOB正在运行中");
		try {
			scheduler.pauseJob(JobKey.jobKey(DEFAULT_JOB_NAME, group));
		} catch (SchedulerException e) {
			throw new BaseSchedulerException("暂停Job发生异常");
		}
	}

	public void start(String job, String deviceSn, int repeatTimes, int interval, Integer plantId, int channelCount) {

		startScheduler();

        JobDetail jobDetail = newJob(SendTaskJob.class).withIdentity(job, deviceSn).build();
        jobDetail.getJobDataMap().put("deviceSn", deviceSn);
        jobDetail.getJobDataMap().put("plantId", plantId);
        jobDetail.getJobDataMap().put("channelCount", channelCount);
        Trigger trigger = TriggerBuilder.newTrigger().withIdentity(job, deviceSn).startNow()
            .withSchedule(simpleSchedule()
            		.withIntervalInSeconds(interval)
            		.withRepeatCount(repeatTimes - 1))
            .build();

        scheduleJob(jobDetail, trigger);

	}

	private void scheduleJob(JobDetail jobDetail, Trigger trigger) {
		try {
            scheduler.scheduleJob(jobDetail, trigger);

        } catch (SchedulerException e) {
        	throw new CreateJobException(ERROR_MESSAGE_OF_CREATING_PREBURNINGJOB );
        }
	}

	private void startScheduler() {
		try {
			scheduler.start();
		} catch (SchedulerException e1) {
			throw new CreateJobException(ERROR_MESSAGE_OF_CREATING_PREBURNINGJOB );
		}
	}

	public void resume(String group) {

		boolean hasSuchJobRunning = existJob(DEFAULT_JOB_NAME, group);
		if(!hasSuchJobRunning)
			throw new DeviceTestBaseException("没有对应的JOB正在运行中");
		try {
			scheduler.resumeJob(JobKey.jobKey(DEFAULT_JOB_NAME, group));
		} catch (SchedulerException e) {
			throw new BaseSchedulerException("恢复Job发生异常");
		}
	}

	public void stop(String group) {
		TriggerKey triggerKey = TriggerKey.triggerKey(DEFAULT_JOB_NAME, group);
		JobKey jobKey = JobKey.jobKey(DEFAULT_JOB_NAME, group);
		try {
			Trigger trigger = (Trigger) scheduler.getTrigger(triggerKey);
			if (trigger == null) {
				return;
			}
			scheduler.pauseTrigger(triggerKey);
			scheduler.unscheduleJob(triggerKey);
			scheduler.deleteJob(jobKey);
		} catch (Exception e) {
			throw new BaseSchedulerException("移除Job发生异常");
		}
	}

。。。。。
}

```
## 参考
### 参考项目
deviceManagement
### 参考文章地址
https://blog.csdn.net/u012907049/article/details/73801122
