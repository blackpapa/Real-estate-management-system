<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<form:form modelAttribute="fwActionLog" name="ec" id="ec">
<script>
function validateIsSelected(){
	if($('#ht_t_actionTimeStart').val()!=""&&$('#ht_t_actionTimeEnd').val()!=""){
		return true;
	}else{
		alert('请选择开始时间与结束时间！');
		return false;
	}
}
function exportData(){
	$('#ec').attr('action','logger.do?actionMethod=query&export=1');
	$('#ec').submit();
	$('#ec').attr('action','logger.do?actionMethod=query');
}
</script>
<form:errors path="*" cssClass="errors"></form:errors>
<div class="search_area">
      <div class="heading"><span class="title">查询条件</span></div>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<%-- <th width="20">&nbsp;</th>
        <th width="100">开始时间</th>
        <td width="160">
       <input readOnly id="ht_t_actionTimeStart" name="actionTimeStart" style="width:117px;height:18px;border:1px solid #9CB8CC;"
					type="text" value="${actionTimeStart}"  size="20"
					onClick="WdatePicker({el:'ht_t_actionTimeStart',dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
        </td>
        
        <th width="20">&nbsp;</th>
        <th width="100">结束时间</th>
        <td width="160">
        <input readOnly id="ht_t_actionTimeEnd" name="actionTimeEnd" style="width:117px;height:18px;border:1px solid #9CB8CC;"
					type="text" value="${actionTimeEnd}"  size="20"
					onClick="WdatePicker({el:'ht_t_actionTimeEnd',dateFmt:'yyyy-MM-dd HH:mm:ss'});" /> 
        </td> --%>
        		
        <th width="20">&nbsp;</th>
        <th width="100">操作名称</th>
        <td width="160">
        <input type="text" value="${t_fwSrcAction_fwSource_name }" name="ht_t.fwSrcAction.fwSource.name">
        </td>
        <th width="15" height="24">&nbsp;</th>
		<th width="100">操作人</th>
		<td width="160">
		<input type="text" value="${t_fwAccount_acctName }" name="ht_t.fwAccount.acctName">
		</td>
	</tr>
   </table>

  <div class="search_bottom">
  <!-- <input type="button" class="button" value="查询" onclick="queryData('logger.do')" /> -->
  <input type="button" class="button" value="查询" onclick="trimForm('ec');postDataByURL('logger.do?actionMethod=query',$('#ec').serialize(),'workspace')" />
  <input type="button" class="button" value="清空" onclick="clearFormById('ec',4);" />
  </div>
</div>
<div class="table_list">
      <div class="heading"><span class="title">日志列表</span>
      <div class="tool" align="right">
	      <input type="button" class="button" value="下载日志" onclick="if(validateIsSelected()){exportData()}"/>
	      <input type="button" class="button" value="删除日志" onclick="if(validateIsSelected()){if(confirm('是否确认删除?')){postDataByURL('logger.do?actionMethod=delete',$('#ec').serialize(),'workspace')}}" />	      
	    </div>
	    <div class="clear"></div>
      
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
			    <th>序号</th>
			    <th>操作时间</th>
			    <th>操作名称</th>
			    <th>操作人</th>
			    <th>日志内容</th>
			    <!--  
				<th><spring:message code="loginForm.account.accountName.displayname"/></th>
				<th><spring:message code="sourceForm.sourceName.displayname"/></th>
				<th><spring:message code="actionForm.actionName.displayname"/></th>
				<th><spring:message code="logger.remote.host"/></th>
				-->
			</tr>
		</thead>
		<tbody>
		<c:forEach var="operationLog" items="${pageBean.dataList}" varStatus="status">
		    <tr>
		    <td align="center"><c:out value="${status.count }"/></td>
	    <td align="center">
	    	${operationLog.actionTime}&nbsp;
	   </td>
	   <td align="center">
	    	${operationLog.fwSrcAction.fwSource.name}
	   </td>
	    <td align="center">
	    	${operationLog.fwAccount.acctName}
	    </td>
	   
	   <td>
	    	${operationLog.fwSrcAction.fwSource.name},账户=${operationLog.fwAccount.acctName},执行${operationLog.fwSrcAction.methodName}
	   </td>
	   <%-- 
	   <td>
	    	${operationLog.clientIp}&nbsp;
	   </td>
	  --%>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
<div class="pager" id="changePage">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="ec" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>