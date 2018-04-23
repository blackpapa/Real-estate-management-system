<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ht_frame.js"></script>
<br/>
<script language="javascript">
<!--
function assignData(targetUrl){
	var checkName = getCheckName();
	if(checkName==''){
		return ;
	}
	var checkValue = getCheckValue(checkName);
	if(checkValue==""||checkValue=="undefine"||checkValue==null){
 		alert("请选择一条被分配的数据!");
 		return ;
 	}
 	//window.location.href = "operation.do?actionMethod=query&sourceId="+checkValue+"&menuId=9187";
	pageEditSingleData("operation.do?actionMethod=query","sourceId",checkValue+"&menuId=9187","workspace");
}

//-->
</script>
<form:form modelAttribute="fwSource" name="ec" id="ec_ec">
<form:errors path="*" cssClass="errors"></form:errors>
 <div class="search_area">
      <div class="heading"><span class="title">查询条件</span></div>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100"><spring:message code="sourceForm.sourceName.displayname"/></th>
		<td width="160">
		<input type="text" value="${t_name }" name="ht_t.name" size="20">
		</td>
        <th width="20">&nbsp;</th>
        <th width="100"><spring:message code="sourceForm.super.displayname"/></th>
        <td width="160">
       <input type="text" value="${t_parentSource_name }" name="ht_t.parentSource.name">
        </td>
        <th width="20">&nbsp;</th>
        <th width="100">&nbsp;</th>
        <td width="160">&nbsp;</td>
        <td width="5">&nbsp;</td>
	</tr>
   </table>

  <div class="search_bottom">
  <input type="button" class="button" value="查询" onclick="trimForm('ec_ec');postDataByFormName('ec_ec','workspace')" />
  <input type="button" class="button" value="清空" onclick="clearFormById('ec_ec',2);" />
  </div>
</div> 
 
 
<div class="table_list">
      <div class="heading"><span class="title">菜单列表</span>
      <div class="tool" align="right">
      <input type="button" class="button" value="新增" onclick="addData('source.do');"/>
      <input type="button" class="button" value="编辑" onclick="if(isSelectData('id')){if(isMultiSelectData('id')){editDataNew('source.do','id')}}" />
      <input type="button" class="button" value="删除" onclick="if(isSelectData('id')){deleteData('source.do?actionMethod=delete','ec_ec');}" />
      <input type="button" class="button" value="分派" onclick="assignData('source.do')"/>
     </div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
<thead>
<tr>
	<th><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"></th>
    <th>
    <spring:message code="sourceForm.sourceName.displayname"/> </td>
    <th>
    <spring:message code="sourceForm.super.displayname"/>
    </th>
    <th>
    <spring:message code="sourceForm.status.displayname"/>
    </th>
     <th>
    <spring:message code="sourceForm.describe.displayname"/>
    </th>
</tr>
</thead>
<tbody>
<c:forEach var="source" items="${pageBean.dataList}">
  	<tr>
  		<td align="center">
  		<input type="checkbox" value="${source.id}" name="id" >
  		</td>
	    <td>
	    	${source.tabString}${source.name}&nbsp;
	    </td>
	    <td>
	    	${source.parent.name}&nbsp;
	   </td>
	   <td>
	    	${source.status}&nbsp;
	   </td>
	   <td>
	    	${source.description}&nbsp;
	   </td>
  	</tr>
  </c:forEach>
</tbody>
</table>
</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="ec_ec" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>