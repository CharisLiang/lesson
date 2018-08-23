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
Ext.onReady(function(){
	Ext.create('Ext.window.Window' , {
		title:'resizer',
		width:800,
		height:400,
		items:[
			{
				xtype:'textfield',
				fieldLabel:'作者',
				padding:'10'
			},
			{
				xtype:'textfield',
				fieldLabel:'出版社'
			},
			{
				layout:'hbox',
				title:'输入时间',
				bodyPadding:5,
				items:[
					{
						xtype:''
					}
				]
			}
		]
	});
});
</script>
</body>
</html>