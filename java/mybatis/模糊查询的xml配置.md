## mybatis 模糊查询的select语句
```xml
<select id="selectPersons" resultType="person" parameterType="person">
  <bind name="pattern" value="'%' + _parameter.username + '%'" />
  select id,sex,age,username,password
  from person
  where username LIKE #{pattern}
</select>
```
