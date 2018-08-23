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
var gridStore = Ext.create('Ext.data.Store',{
	fields:['name'],
	data:[
		{name:"name1"},
		{name:"name1"},
		{name:"name1"},
		{name:"name1"}
	]
});
var gridTable = Ext.create('Ext.grid.Panel',{
	title:'查看图书',
	width:550,
	renderTo:Ext.getBody(),
	columns:[
		{text:'书名', dataIndex:'name',flex:1 , 
			editor:{xtype:'textfield',allowPattern:false}}
		
	],
	selType: 'rowmodel' ,
	plugins:
		[
			{
				ptype:'rowediting',
				clicksToEdit:1
			}
		],
	store:gridStore
});

//表格编辑完后的处理：
gridTable.on('edit' , function(editor,e){
	var lstAddRecord=new Array();

	gridStore.each(function(record) {

	      lstAddRecord.push(record.data);

	});
	alert(Ext.encode(lstAddRecord));
});
</script>
</body>
</html>