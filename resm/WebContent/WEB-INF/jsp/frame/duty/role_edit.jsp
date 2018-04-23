<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="fwDuty" >
<input type="hidden" name="dutyType" value="1"></input>
<form:hidden path="id"/>
<div class="tool">
<input type="button" class="button" value="保存" onclick="saveData('role.do')"/>
<input type="button" class="button" value="返回" onclick="backMainPage('role.do?actionMethod=query')" />
</div>
<table border="0" width="100%">
  <tr>
    <th align="left">
      <spring:message code="dutyForm.dutyName.displayname"/>
    </th>
    <td align="left">
      <form:input path="name" size="30" maxlength="30" /><form:errors path="name" cssClass="errors"/>
    </td>
  </tr>
  <tr>
    <th align="left">
      <spring:message code="dutyForm.status.displayname"/>
    </th>
    <td align="left">
      <select name="status" >
      <option value="A"
				<c:if test="${fwDuty.status=='A'}"> selected </c:if>>active</option>
			<option value="D"
				<c:if test="${fwDuty.status=='D'}"> selected </c:if>>Dormancy</option>
       </select><form:errors path="status" cssClass="errors"/>
    </td>
  </tr>
   <tr>
    <th align="left">
      <spring:message code="dutyForm.describe.displayname"/>
    </th>
    <td align="left">
       <form:textarea path="describe" rows="10" cols="30"/><form:errors path="describe" cssClass="errors"/>
    </td>
  </tr>
</table>
</form:form>