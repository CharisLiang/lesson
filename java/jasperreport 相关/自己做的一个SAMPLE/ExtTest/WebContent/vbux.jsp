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
	Ext.create('Ext.window.Window' ,{
		title:'垂直布局与水平布局',
		width:600,
		height:220,
		items:[
			{
				xtype:'textfield',
				fieldLabel:'作者',
			},
			{
				xtype:'textfield',
				fieldLabel:'出版社',
								
			},
			{
				title:'输入要出版时间',
				layout:'hbox',
				bodyPadding:5,
				height:80,
				items:[
					{
						fieldLabel:'起始时间',
						xtype:'datefield'
					},
					{
						fieldLabel:'结束时间',
						xtype:'datefield'
					}
				],
				flex:2
			}
		],
		bbar:[
			{xtype:'tbfill'},
			{xtype:'button' , text:'搜索'},
			{xtype:'button' , text:'取消'},
			{xtype:'tbfill'}
		]
	}).show();
});
</script>
</body>
</html>