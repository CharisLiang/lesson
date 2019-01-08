### SpringMvc 上传文件，获取文件的MD5
```java
public String getMd5(MultipartFile file) {

       try {
           byte[] uploadBytes = file.getBytes();
           MessageDigest md5 = MessageDigest.getInstance("MD5");
           byte[] digest = md5.digest(uploadBytes);
           String hashString = new BigInteger(1, digest).toString(16);
           return hashString;
       } catch (Exception e) {
           LogUtil.writeErrorLog(e.toString(), e);  
       }
       return null;

   }
```
