<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="fwSource" id="source">
<form:hidden path="id"/>
<form:hidden path="level"/>
<form:hidden path="style"/>
<div class="table_edit">
      <div class="heading"><span class="title">栏目名称</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
  <tr>
    <th align="left">
      <spring:message code="sourceForm.sourceName.displayname"/>
    </th>
    <td align="left">
      <form:input path="name" size="30" /><form:errors path="name" cssClass="errors"/>
    </td>
  </tr>
  <tr>
    <th align="left">
      <spring:message code="sourceForm.codeName.displayname"/>
    </th>
    <td align="left">
      <form:input path="sourceCode" /><form:errors path="sourceCode" cssClass="errors"/>
    </td>
  </tr>
   <tr>
    <th align="left">
     <spring:message code="sourceForm.icon.displayname"/>
    </th>
    <td align="left">
      <form:input path="icon" /><form:errors path="icon" cssClass="errors"/>
    </td>
  </tr>
   <tr>
    <th align="left">
     <spring:message code="sourceForm.isMenu.displayname"/>
    </th>
    <td align="left">
      <form:radiobutton path="isMenu" value="1" />显示<form:radiobutton path="isMenu" value="0"/>不显示<form:errors path="isMenu" cssClass="errors"/>
    </td>
  </tr>
  <tr>
    <th align="left">
      <spring:message code="sourceForm.super.displayname"/>
    </th>
    <td align="left">
       <select name="parent" >
        <option  value="">--Select--</option>
       <c:forEach var="source" items="${parentList}">
       	<c:if test="${source.isMenu==1}">
       		<option value="${source.id}" <c:if test="${source.id==fwSource.parent.id}"> selected</c:if>>${source.tabString}${source.name}</option>
      	</c:if>
      </c:forEach>
      </select><form:errors path="parent" cssClass="errors"/>
    </td>
  </tr>
  <tr>
    <th align="left">
      <spring:message code="sourceForm.status.displayname"/>
    </th>
    <td align="left">
       <form:select path="status" >
        <form:option value="A">active</form:option>
        <form:option value="D">Dormancy</form:option>
       </form:select><form:errors path="status" cssClass="errors"/>
    </td>
  </tr>
   <tr>
    <th align="left">
      <spring:message code="sourceForm.describe.displayname"/>
    </th>
    <td align="left">
     <form:textarea path="description" rows="10" cols="30"/><form:errors path="description" cssClass="errors"/>
    </td>
  </tr>
</table>
<div class="edit_bottom" align="center">
<!--  <input type="button" class="button" value="保存" onclick="saveData()"/> -->
<input type="button" class="button" value="保存" onclick="saveDataNew('source.do','source')"/>
<input type="button" class="button" value="返回" onclick="backMain('source.do')" />
</div>
</div>
</form:form>
