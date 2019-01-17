### mybatis xml 中配置SQL语句老是提示语法错误
```xml
<select id = "selectByDeviceSnAndDate" resultMap="plantOnly">
		<bind name="pattern" value="'%' + deviceSn + '%'" />
		SELECT
		id,
		deviceSn as sn,
		repeatTimes,
		finishFlag,
		finishReason,
		startTime,
		finishTime,
		currentTimes,
		name,
		channelCount,
		FROM
		tst_device_test_plant
		<where>
		<if test="deviceSn != null">
		 (deviceSn like #{pattern})
		</if>
		<if test="beginDate != null and endDate != null">
		 AND (startTime BETWEEN #{beginDate} AND #{endDate})
		</if>
		</where>
	</select>
```

#### 原因：
select语句中，最后一个字段 channelCount后面不应该加 ','.

#### 解决：
把逗号删除即可
