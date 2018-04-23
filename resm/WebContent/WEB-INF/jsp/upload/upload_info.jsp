<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script> 

<link rel="stylesheet" type="text/css" href="css/effect/easyui.css">
<link rel="stylesheet" type="text/css" href="css/effect/icon.css">
<link rel="stylesheet" type="text/css" href="css/effect/demo.css">
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<span id="responseContent" style="overflow:auto;">
	<c:if test="${uploadInfoBean.success=='true'}">
		<p style="color:green" class="dftxt">成功</p>
	</c:if>
	<c:if test="${uploadInfoBean.success=='false'}">
		<p style="color:red" class="dftxt">失败</p>
	</c:if>

	<p class="dftxt"><c:out value="${uploadInfoBean.infoMsg}"  escapeXml="false" /></p>

	<c:if test="${uploadInfoBean.errorMsg!=''}">
		<p class="dftxt"><c:out value="${uploadInfoBean.errorMsg}" escapeXml="false" /></p>
	</c:if>

</span>
<script language="javascript">
window.onload = function(){
	parent.isSuccess = new Boolean('${uploadInfoBean.success}');
	parent.endProcess("${uploadInfoBean.success}");	
	parent.document.getElementById("showContent").innerHTML = document.getElementById("responseContent").innerHTML;
	parent.document.getElementById("showContent").style.display="block";
	parent.document.getElementById("status").innerHTML = "任务完成";
	parent.document.getElementById("percentComplete").innerHTML = "成功完成!";

};
</script>