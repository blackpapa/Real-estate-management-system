<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
Current user:&nbsp;<b>${account.acctName}</b><br/>
Current Role:&nbsp;<b>${duty.name}</b><br>
Please choose authority Group:<br/>
<form name="myform" action="user.do?actionMethod=assignGroup" method="post">
<input type="hidden" name="accountId" value="${account.id}">
<input type="hidden" name="dutyId" value="${duty.id }">
<select name="groupId" Multiple>
<option value="">-- no choose --</option>
<c:forEach var="group" items="${groupList}">
<option value="${group.id }" <c:forEach var="selectedGroup" items="${account.fwAccountDuties}"><c:if test="${group.id==selectedGroup.fwGroup.id&&duty.id== selectedGroup.fwDuty.id}"> selected</c:if></c:forEach>>${group.tabString }${group.name }</option>
</c:forEach>
</select>
</form>