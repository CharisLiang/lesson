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
	<script type="text/javascript" src="ext-lang-zh_CN.js"></script>
	<script type="text/javascript">
		Ext.onReady(function() {
			Ext.create('Ext.window.Window', {
				width : 400,
				height : 250,
				title : '测试 窗口 ',
				html : '测试用 ',
				tools : [ {
					type : 'save',
					tooltip : '保存数据 ',
					handler : function(event, tiilE1, panel) {
						alert("用户保存数据");
					}
				} ],
				dockedItems : [ {
					xtype : 'toolBar',
					dock : 'bottom',
					items : [ {
						text : '按钮1'
					}, ' ', '-', '普通文本', {
						xtype : 'tbspacer'
					}, '合计 信息', {
						xtype : 'tbseparator'
					}, {
						xtype : 'tbfill'
					}, {
						text : '按钮2'
					} ]
				} ]
			}).show();
		});
	</script>
</body>
</html>