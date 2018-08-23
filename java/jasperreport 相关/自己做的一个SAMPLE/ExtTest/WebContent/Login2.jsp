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
var con = Ext.create('Ext.container.Container',
		{
			layout:{
				align: 'center',
				type: 'vbox'
			},
			width: document.body.clientWidth,
			height:800,
			renderTo: Ext.getBody(),
			style: {
				backgroundColor: '#00F'
			},
			defaluts :{
				style:{
					padding: '5px',
				},
				bodyPadding: 5
			},
			items:[
				{
					
					xtype: 'label',
					height:100,
					width:500,
					layout:{
						align: 'center',
						type: 'vbox'
					},
					style:{
						backgroundColor: '#00f'
					}
				},
				{
					xtype: 'label',
					html: '<font size=5>字体大小</font>',
					height:100,
					width:500,
					layout:{
						align: 'center'
					},
					style:{
						align: 'center',
						backgroundColor: '#00f'
					}
				},
				{
					xtype: 'panel',
					title: '用户登录',
					width: 300,
					height:200,
					
				}
			]
		});
con.show();
</script>
</body>
</html>