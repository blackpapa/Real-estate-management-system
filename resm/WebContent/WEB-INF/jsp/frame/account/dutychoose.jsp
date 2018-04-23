<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
当前用户:&nbsp;<b>${account.acctName}</b>
<form name="myform" action="user.do?actionMethod=assign" method="post" id="myform">
<input type="hidden" name="accountId" value="${account.id}">
<div class="" align="left">
<!--  <input type="button" class="button" value="保存" onclick="saveData('user.do')"/>-->
<input type="button" class="button" value="保存" onclick="if(confirm('确定保存吗？')){postDataByURL('user.do?actionMethod=assign',$('#myform').serialize(),'workspace');}"/>
<input type="button" class="button" value="返回" onclick="getData('user.do?actionMethod=query','','workspace');" />
</div>
<div class="table_list">
      <div class="heading"><span class="title">角色列表</span></div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
<thead>
<tr>
  	<th>
   	 请选择
    </th>
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
<c:forEach var="duty" items="${dutyList}">
  	<tr>
  	<td>
  	  		<input type="checkbox" value="${duty.id}" name="dutyId"
		   <c:forEach var="accountDuty" items="${account.fwAccountDuties}">
			   <c:if test="${accountDuty.fwDuty.id==duty.id}">
			   	checked
			   </c:if>
		   </c:forEach>
		   />
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
</div>
</div>
</form>
