<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/ext-all.css" rel="stylesheet" type="text/css" />

<title></title>
</head>
<body>

<script type="text/javascript" src="ext-all.js">
</script>
<script type="text/javascript" src="ext-lang-zh_CN.js" ></script>
<script type="text/javascript">
var con = Ext.create('Ext.panel.Panel', 
		{
			layout:{
				align: 'center'
			},
			title: '查看图书',
			height: 1000,
			width: document.body.clientWidth,
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
con.show();


</script>
</body>
</html>