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
Ext.create('Ext.menu.Menu',
		{
			width: 120,
			floating: false,
			renderTo: Ext.getBody(),
			items:[
				{
					text: '菜单一',
					handler: function(item,evt)
					{
						alert(item.text + "被击中了");
					}
				}
			]
		});
</script>
</body>
</html>