<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="fwSrcAction" id="fwSrcAction">
<form:hidden path="id"/>
<div class="table_edit">
      <div class="heading"><span class="title">栏目名称</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
		<tr>
			<th align="right"><spring:message code="actionForm.actionName.displayname" /></th>
			<td align="left"><form:input path="name" size="30" maxlength="30" /><form:errors path="name" cssClass="errors"/></td>
		</tr>
		<tr>
			<th align="right"><spring:message code="actionForm.actionMethod.displayname" /></th>
			<td align="left"><form:input path="methodName" size="30" maxlength="30" /><form:errors path="methodName" cssClass="errors"/></td>
		</tr>
		<tr>
			<td align="right" >访问URL：</td>
			<td align="left" ><form:input path="actionPath" /></td>
		</tr>
		<tr>
			<th align="right"><spring:message code="actionForm.actionPath.displayname" /></th>
			<td align="left"><form:input path="actionMethods" /><form:errors path="actionMethods" cssClass="errors"/></td>
		</tr>
		<tr>
			<th align="right"><spring:message code="actionForm.logLevel.displayname" />
			</th>
			<td align="left"> <form:select path="logLevel">
				<form:option value="0">not log</form:option>
				<form:option value="1">log operation</form:option>
				<form:option value="2">log business Content</form:option>
			</form:select><form:errors path="logLevel" cssClass="errors"/></td>
		</tr>
		<tr>
			<th align="right"><spring:message code="actionForm.actionOrder.displayname" />
			</th>
			<td align="left"><form:input path="actionOrder" size="30" maxlength="100" /><form:errors path="actionOrder" cssClass="errors"/></td>
		</tr>
	</table>
<div class="edit_bottom" align="center">
<!--  <input type="button" class="button" value="保存" onclick="saveData()"/>-->
<input type="button" class="button" value="保存" onclick="saveDataNew('operation.do','fwSrcAction');"/>
<input type="button" class="button" value="返回" onclick="backMainPage('operation.do')" />
</div>
</div>
</form:form>
<script language="javascript">
<!--
function saveDataNew(url,formID){
	$("#"+formID).attr("action",url+"?actionMethod=add&sourceId=${sourceId}");
	//$("#"+formID).submit();
	postDataByFormName(formID,"workspace");
}
function backMainPage(actionName){
	//window.location.href=actionName+(actionName.indexOf("?")>0?"&":"?")+"actionMethod=add&sourceId="+${sourceId};
	getData(actionName+"?actionMethod=query&sourceId=${sourceId}","","workspace");
}
//-->
</script>