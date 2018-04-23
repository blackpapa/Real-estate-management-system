<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<br/>
<form:form modelAttribute="fwDuty" name="ec">
<form:errors path="*" cssClass="errors"></form:errors>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<spring:message code="dutyForm.dutyName.displayname"/>:<input type="text" value="${t_name }" name="ht_t.name">
</td></tr>
</table>
<br/>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableUI">
<thead>
<tr>
	<th><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"><spring:message code="information.choose"/></th>
    <th>
    <spring:message code="dutyForm.dutyName.displayname"/> </td>
    <th>
    <spring:message code="dutyForm.status.displayname"/>
    </th>
     <th>
    <spring:message code="dutyForm.describe.displayname"/>
    </th>
</tr>
</thead>
<tbody>
<c:forEach var="duty" items="${pageBean.dataList}">
  	<tr>
  		<td>
  		<input type="checkbox" value="${duty.id}" name="id" >
  		</td>
	    <td>
	    	${duty.name}
	    </td>
	   <td>
	    	${duty.status}
	   </td>
	   <td>
	    	${duty.describe}
	   </td>
  	</tr>
  </c:forEach>
</tbody>
</table>
</form:form>