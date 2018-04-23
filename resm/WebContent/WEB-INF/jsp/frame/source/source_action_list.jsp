<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<form:form modelAttribute="fwSrcAction" name="ec" id="ec">
<form:errors path="*" cssClass="errors"></form:errors>
 <div class="tool" align="right">
      <input type="button" class="button" value="新增" onclick="editData('operation.do')"/>
      <input type="button" class="button" value="编辑" onclick="if(isSelectData('id')){if(isMultiSelectData('id')){editData('operation.do')}}"/>
      <input type="button" class="button" value="删除" onclick="if(isSelectData('id')){deleteData('operation.do')}" />
 </div>
<div class="table_list">
      <div class="heading"><span class="title">${fwSource.name }</span></div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
<thead>
<tr>
	<th><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"></th>
    <th>
    <spring:message code="actionForm.actionName.displayname"/> </th>
    <th>
    <spring:message code="actionForm.actionMethod.displayname"/>
    </th>
    <th>
    <spring:message code="actionForm.actionPath.displayname"/>
    </th>
     <th>
    <spring:message code="actionForm.logLevel.displayname"/>
    </th>
     <th>
    <spring:message code="actionForm.actionOrder.displayname"/>
    </th>
</tr>
</thead>
<tbody>
<c:forEach var="operation" items="${pageBean.dataList}">
  	<tr>
  		<td align="center">
  			<input type="checkbox" value="${operation.id}" name="id" >
  		</td>
	    <td>
	    	${operation.name}
	    </td>
	    <td>
	    	${operation.methodName}
	   </td>
	   <td>
	    	${operation.actionMethods}
	   </td>
	   <td>
	    	${operation.logLevel}
	   </td>
	    <td>
	    	${operation.actionOrder}
	   </td>
  	</tr>
  </c:forEach>
</tbody>
</table>
</div>
</div>
</form:form>
<script language="javascript">
<!--
function editData(actionName){
	var checkName = getCheckName();
	if(checkName==''){
		return ;
	}
	var checkValue = getCheckValue(checkName);
	if(!checkValue){
		pageEditSingleData(actionName+"?actionMethod=add","sourceId","${sourceId}","workspace");
		//window.location.href = actionName+(actionName.indexOf("?")>0?"&":"?")+"actionMethod=add&sourceId="+${sourceId};
	}else{
		//window.location.href = actionName+(actionName.indexOf("?")>0?"&":"?")+"actionMethod=edit&queryId="+checkValue+"&sourceId="+${sourceId};
		pageEditSingleData(actionName+"?actionMethod=edit","queryId",checkValue+"&sourceId=${sourceId}","workspace");
	}

}
function deleteData(actionName){
	var checkName = getCheckName();
	if(checkName==''){
		return ;
	}
	var checkValue = getCheckValue(checkName);
	if(!checkValue){
		alert('请选择要删除的数据!');
		return;
	}
	alert('here');
	if(confirm('确定要删除这些数据吗？')){
		document.forms.ec.action = actionName+(actionName.indexOf("?")>0?"&":"?")+"actionMethod=delete&sourceId="+${sourceId};
		//document.forms.ec.submit();
		postDataByFormName('ec','workspace');
	}
}
//-->
</script>