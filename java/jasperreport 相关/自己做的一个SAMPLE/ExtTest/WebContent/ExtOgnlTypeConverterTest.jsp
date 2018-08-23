<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<title></title>
</head>
<body>
<s:form action="loginPro" method="post">
<s:textfield name="jobs['one'].name" label="dasf"/>
<s:password name="pass" label="pas"/>
<s:submit/>
</s:form>

<script type="text/javascript" src="ext-all.js">
</script>
<script type="text/javascript" src="ext-lang-zh_CN.js" ></script>
<script type="text/javascript">
Ext.onReady(function(){
	Ext.create('Ext.form.Panel',{
		title:'简单的表单',
		bodyPadding:'5',
		width:350,
		url:'loginPro.action',
		method:'POST',
		layout:'anchor',
		renderTo:Ext.getBody(),
		defaults:{
			anchor:'100%'
		},
		defaultType:'textfield',
		fieldDefaults:{
			labelAlign:'left',
			labelWidth:100
		},
		items:[
			{
				fieldLabel: '用户名',
				name:'jobs[\'one\'].name',
				allowBlank: false
			},
			{
				fieldLabel: '密码',
				name:'pass',
				allowBlank:false
			}
		],
		buttons:[
			{
				text:'reset',
				handler:function()
				{
					this.up('form').getForm().reset();
				}
			},
			{
				text:'提交',
				handler: function(){
					var form = this.up("form").getForm();
					form.submit(
							{
								success:function(form,action)
								{
									Ext.Msg.alert("登陆成功宫", "登陆成功");
								},
								failure:function(form,action)
								{
									alert("haha");
								}
							});
				}
			}
		]
	});
});
</script>
</body>
</html>