<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>123</title>
</head>
<body>


<script type="text/javascript" src="ext-all.js">
</script>
<script type="text/javascript" src="ext-lang-zh_CN.js" ></script>
<script type="text/javascript">
Ext.onReady(function(){
	var height =innerHeight;
	var con = Ext.create('Ext.panel.Panel', 
			{
				layout:{
					align: 'center'
				},
				title: '查看图书',
				height:height,
				width:window.innerWidth,
				renderTo:Ext.getBody(),
				defaults: {
					style:{
						padding: '5px'
					},
					bodyPadding: 5
				},
				items:[
					{
						title: '出版社',
						height:120,
						html: 'haahhahaha'
					}
				]
			});
});

</script>

</body>
</html>