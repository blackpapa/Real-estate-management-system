
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="fwAccount" name="fwAccount" id="fwAccount" >
<form:hidden path="id"/>
<div class="table_edit">
      <div class="heading">
      <span class="title">
               
       <c:if test="${fwAccount.id eq null}">新增用户</c:if>
       <c:if test="${fwAccount.id ne null}">编辑用户</c:if>           
      </span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
	<tr>
		<th align="left"><spring:message code="loginForm.account.accountName.displayname" /></th>
		<td align="left"><form:input path="acctName" size="20" maxlength="20" /><form:errors path="acctName" cssClass="errors"/></td>
	</tr>
	<tr>
		<th align="left"><spring:message code="loginForm.account.userName.displayname" /></th>
		<td align="left"><form:input path="userName" size="20" maxlength="20" /><form:errors path="userName" cssClass="errors"/></td>
	</tr>
	<tr>
		<th align="left"><spring:message code="loginForm.account.password.displayname" /></th>
		<td align="left"><form:input path="acctPwd" size="20" maxlength="20" /><form:errors path="acctPwd" cssClass="errors"/></td>
	</tr>
	<tr>
		<th align="left"><spring:message code="loginForm.account.status.displayname" /></th>
		<td align="left"><select name="status">
			<option value="A"
				<c:if test="${fwAccount.status=='A'}"> selected </c:if>>active</option>
			<option value="D"
				<c:if test="${fwAccount.status=='D'}"> selected </c:if>>Dormancy</option>
		</select><form:errors path="status" cssClass="errors"/></td>
	</tr>
	<tr>
		<th align="left"><spring:message code="loginForm.account.describe.displayname" /></th>
		<td align="left"><form:textarea path="describe" rows="10" cols="30"/><form:errors path="describe" cssClass="errors"/></td>
	</tr>
</table>
<div class="edit_bottom" align="center">
<input type="button" class="button" value="保存" onclick="if(confirm('确定保存吗？')){trimForm('fwAccount');postDataByFormName('fwAccount','workspace');}"/>
<input type="button" class="button" value="返回" onclick="getData('user.do?actionMethod=query','','workspace');" />
</div>
</div>
</form:form>
