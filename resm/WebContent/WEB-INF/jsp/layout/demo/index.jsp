<%@page import="com.java.framework.security.ThreadLocalClient"%>
<%@page import="com.java.framework.entity.FwAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
	<%@ page session="false"%>
 --%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ht_frame.js"></script>
<script type="text/javascript">
$(function(){
	var resetPasswordFlag="${resetPasswordFlag}";
	if(resetPasswordFlag=="true"){
		alert("密码修改成功！");
	}	
	<% 
	FwAccount account = ThreadLocalClient.get().getOperator();
	%>

 });


function slide(){
		$.messager.show({
			title:'欢迎进入',
			msg:'欢迎您进入房地产销售管理系统！',
			timeout:5000,
			showType:'slide'
		});
	}
</script>

<body onload="slide();" >
</body>
