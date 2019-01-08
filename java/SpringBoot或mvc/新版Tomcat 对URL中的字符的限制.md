###  问题描述
出现异常：Invalid character found in the request target. The valid characters are defined in RFC 7230 and RFC
### 原因
新版Tomcat对URL字符有所限制，有些字符不允许在URL中使用
### 解决思路
解除Tomcat的限制
### 具体办法
在Application.class 类中设置tomcat 对应的属性
```java
public static void main(String[] args) {
        SpringApplication.run(GunsApplication.class, args);
        //配置tomcat属性，允许下列符号通过url验证
        System.setProperty("tomcat.util.http.parser.HttpParser.requestTargetAllow","|*&^%$#@!~");
        logger.info("GunsApplication is success !");
    }
```
