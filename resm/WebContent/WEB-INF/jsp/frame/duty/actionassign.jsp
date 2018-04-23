<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ht_frame.js"></script>
<div style="overflow:scroll;">
<center><b>Assigned duty: ${duty.name}</b></center>
<form name="myform" method="post" action="role.do?actionMethod=assign" id="myform">
<input type="hidden" name="dutyId" value="${duty.id}">

<div class="table_list">
      <div class="heading"><span class="title">列表名称</span>
      <div class="tool" align="right">
	<!--  <input type="button" class="button" value="保存" onclick="saveData('role.do')"/>-->
	<input type="button" class="button" value="保存" onclick="assignNew('role.do','myform')"/>
	<input type="button" class="button" value="返回" onclick="backMain('role.do')" />
	</div>
      </div>
      <div class="scroll">
<c:forEach var="source" items="${assignSourceList}">
	<c:if test="${source.id>1}">
		<c:out value="${source.tabString}" escapeXml="false"/>
		<c:out value="${source.name}"/>
		<ul style="width:90%; margin-left: 45px; margin-top: 10px; margin-bottom: 10px;">
		<c:forEach var="srcAction" items="${createGroupAction}">
			<c:if test="${srcAction.fwSource.id==source.id}">
				<li style="display:inline-block; width:30%; height:24px; line-height:24px;">  
				<input type="checkBox" name="srcActionId" style=" vertical-align: middle;" value="${srcAction.id}" id="${srcAction.id}" >
				<c:out value="${srcAction.name}"/>
				</li>
			</c:if>
		</c:forEach>
		</ul> 
	</c:if>
</c:forEach>
</div>
</div>
</form>
</div>
<script language="javascript">
 
<!--
<c:forEach var="selectedAction" items="${duty.fwDutyActions}">
document.getElementById(${selectedAction.fwSrcAction.id}).checked=true;
</c:forEach>
//-->
</script>