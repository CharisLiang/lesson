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
<!-- 事件定义 -->  
<script type="text/javascript">  
    // 初始化整个页面  
    function onInit() {  
        onLoadData();  
  
        onInitVar();  
        onInitColumn();  
    };  
    // 请求加载表格数据  
    function onLoadData() {  
        data = [{ 'Name': '老狼' }, { 'Name': '小羊' }];  
        gridStore.loadData(data);  
    };  
  
    // 初始化页面的变量参数  
    function onInitVar() {  
        cols = [  
            {  
                xtype: 'rownumberer',  
                text: '序号',  
                align: 'center',  
                minWidth: 50,  
                maxWidth: 50,  
            },  
            {  
                text: '姓名',  
                dataIndex: 'Name',  
                minWidth: 85,  
                maxWidth: 85,  
                sortable: false,  
                menuDisabled: true,  
            }  
        ];  
    };  
    // 初始化列  
    function onInitColumn() {  
        gridTable.reconfigure(gridStore, cols);  
    };  
  
    // 添加行  
    function onAddRow() {  
        gridStore.add({});  
    };  
  
    // 删除行  
    function onDelRow() {  
        gridStore.removeAt(gridStore.count() - 1);  
    };  
  
    // 添加列  
    function onAddColumn() {  
        cols.push({  
            text: '列',  
            dataIndex: 'col',  
            width: 120,  
            sortable: false,  
            menuDisabled: true,  
        });  
  
        gridTable.reconfigure(gridStore, cols);  
    };  
  
    // 删除列  
    function onDelColumn() {  
        cols.pop()  
        gridTable.reconfigure(gridStore, cols);  
    };  
  
</script> 
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
		{text:'书名', dataIndex:'name',flex:1}
	],
	store:gridStore
});

Ext.onReady(function(){
	var toolbar = Ext.create('Ext.form.Panel', {  
        id: 'tool-bar',  
        region: 'north',  
        bbar: [  
            {  
                xtype: 'button',  
                text: '添加行',  
                handler: onAddRow  
            },  
            {  
                xtype: 'button',  
                text: '删除行',  
                handler: onDelRow  
            },  
            {  
                xtype: 'button',  
                text: '添加列',  
                handler: onAddColumn  
            },  
            {  
                xtype: 'button',  
                text: '删除列',  
                handler: onDelColumn  
            }  
        ]  
    });  
  
	Ext.create('Ext.Viewport', {  
        id: 'iframe',  
        layout: 'border',  
        items: [  
            toolbar,  
            gridTable,  
        ]  
    });
});
</script>
</body>
</html>