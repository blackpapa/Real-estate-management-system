<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="note">
 <form:hidden path="noteId"/>
<table border="0" width="100%">
  <tr>
    <th align="left">
      <spring:message code="noteForm.noteTitle.displayname"  />
    </th>
    <td align="left">
      <form:input path="noteTitle" size="30" maxlength="30"/>
    </td>
  </tr>
   <tr>
    <th align="left">
      <spring:message code="noteForm.noteGroup.displayname" />
    </th>
    <td align="left">
    	<select name="creatorGroup" >
      <option value="">--please choose group--</option>
      <c:forEach var="group" items="${noteForm.permitGroupList}">
       <option value="${group.groupId}" <c:if test="${group.groupId==noteForm.creatorGroup}"> selected</c:if>>${group.styleTabString}${group.groupName}</option>
      </c:forEach>
      </select> 
    </td>
  </tr>
  <tr>
    <th align="left">
      <spring:message code="noteForm.noteContent.displayname" />
    </th>
    <td align="left">
      <form:textarea path="noteContent" rows="10" cols="30"/>
    </td>
  </tr>
</table>
</form:form>