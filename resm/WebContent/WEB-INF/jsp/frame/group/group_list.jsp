<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>

<br/>
<form:form modelAttribute="fwGroup" name="ec">
<form:errors path="*" cssClass="errors"></form:errors>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<spring:message code="groupForm.groupName.displayname"/>:<input type="text" value="${t_name }" name="ht_t.name">
<spring:message code="groupForm.creatorGroup.displayname"/>:<input type="text" value="${t_creatorGroup_name }" name="ht_t.creatorGroup.name">
</td></tr>
</table>
<br/>
<table width="100%" cellspacing="0" cellpadding="0" border="1">
<tr>
	<td  width="8%"><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"><spring:message code="information.choose"/></td>
    <td width="30%" >
    <spring:message code="groupForm.groupName.displayname"/> </td>
    <td>
    <spring:message code="groupForm.creatorGroup.displayname"/>
    </td>
    <td>
    <spring:message code="groupForm.status.displayname"/>
    </td>
     <td>
    <spring:message code="groupForm.describe.displayname"/>
    </td>
</tr>
<c:forEach var="group" items="${pageBean.dataList}">
  	<tr>
  		<td>
  		<input type="checkbox" value="${group.id}" name="id" >
  		</td>
	    <td>
	    	${group.name}
	    </td>
	    <td>
	    	${group.parent.name}
	   </td>
	   <td>
	    	${group.status}
	   </td>
	   <td>
	    	${group.describe}
	   </td>
  	</tr>
  </c:forEach>
</table>
</form:form>