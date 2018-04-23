<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="fwGroup" >
<form:hidden path="id"/>
<form:hidden path="level"/>
<form:hidden path="style"/>
<input type="hidden" name="groupType" value="1"/>
<table border="0" width="100%">
  <tr>
    <th >
      <spring:message code="groupForm.groupName.displayname"/>
    </th>
    <td >
      <form:input path="name" size="30" maxlength="30"/><form:errors path="name" cssClass="errors"/>
    </td>
  </tr>
   <tr>
    <th >
      <spring:message code="groupForm.manager.displayname"/>
    </th>
  </tr>
   <tr>
    <th>
      <spring:message code="groupForm.creatorGroup.displayname"/>
    </th>
    <td>
     <select name="parent">
			<option value="">--please choose group--</option>
			<c:forEach var="group" items="${groupList}">
				<option value="${group.id}"
					<c:if test="${group.id==fwGroup.parent.id}"> selected</c:if>>${group.tabString}${group.name}</option>
			</c:forEach>
		</select><form:errors path="parent" cssClass="errors"/>
    </td>
  </tr>
 	<tr>
   <th><spring:message code="groupForm.status.displayname"/></th>
   <td>
       <form:select path="status" >
        <form:option value="A">active</form:option>
        <form:option value="D">Dormancy</form:option>
       </form:select><form:errors path="status" cssClass="errors"/>
    </td>
  </tr>
   <tr>
    <th>
      <spring:message code="groupForm.describe.displayname"/>
    </th>
    <td>
      <form:textarea path="describe" rows="10" cols="30"/><form:errors path="describe" cssClass="errors"/>
    </td>
  </tr>
</table>
</form:form>