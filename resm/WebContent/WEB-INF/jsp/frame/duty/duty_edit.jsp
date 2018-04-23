<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
<!--
function saveDataNew(formID){
	$("#"+formID).attr("action","role.do?actionMethod=add");
	//$("#"+formID).submit();
	postDataByFormName("fwDuty","workspace");
}
function backMainPage(){
	postDataByURL("role.do","actionMethod=query","workspace");
}
//-->
</script>
<form:form modelAttribute="fwDuty" id="fwDuty">
<input type="hidden" name="dutyType" value="1"></input>
<form:hidden path="id"/>
<div class="table_edit">
      <div class="heading">
      <span class="title">
             <c:if test="${fwDuty.id ne null }">角色编辑</c:if>
             <c:if test="${fwDuty.id eq null }">新增角色</c:if>
     </span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
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
<div class="edit_bottom" align="center">
<!--  <input type="button" class="button" value="保存" onclick="saveData('role.do')"/> -->
<input type="button" class="button" value="保存" onclick="if(confirm('确定保存吗？')){trimForm('fwDuty');saveDataNew('fwDuty');};"/>
<input type="button" class="button" value="返回" onclick="backMainPage()" />
</div>
</div>
</form:form>
