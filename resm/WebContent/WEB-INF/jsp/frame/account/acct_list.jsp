
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<script type="text/javascript">
function updateUser(type){
	//alert(type);
	if(jqchk()){
		if(confirm('确认更新吗 ？')){
			$("#statustype").val(type);
			postDataByURL('user.do?actionMethod=editStatus',$('#fwAccount').serialize(),'workspace',alert('操作成功！'));
			}
	
	}
}
function editStatus(status){
	$("#status").val(status);
	$("#ec_ec").attr('action','user.do?actionMethod=editStatus');
	$("#ec_ec").submit();
}
function addData(actionName){
	window.location.href = actionName+(actionName.indexOf("?")>0?"&":"?")+"actionMethod=add";
}
function resertPassword(){
	$.ajax({
		type: "POST",
		url: 'user.do?actionMethod=resertPassword',
		data: $('#fwAccount').serialize(),
		dataType: "html",
		  success: function(data,statuText,responseObj) {			   
			   if("success"==data){
				   alert("所选用户密码重置成功！"); 
			   }else{
				   alert(data+"所选用户密码重置失败！"); 
			   }
			   
		  },
		  error : function(msg) {
			  alert("所选用户密码重置失败！");
		  }
		});
}
function assignDataNew(actionUrl){
	if(jqchk()){
		var checkValue;
		var isfalse;
		$('input[name="id"]:checked').each(function(){
			if(checkValue!=null){
				checkValue = null;
				alert('每次只能选择一条数据进行操作.');
				isfalse = true;
				return false;
			}
			checkValue = $(this).val();
		});
		if(checkValue!=null){
			getData(actionUrl,'id='+checkValue,'workspace');
		}else if(!isfalse){
			alert('请选择一条数据进行操作.');
		}
	}
}
</script>
<form:form modelAttribute="fwAccount" name="fwAccount" id="fwAccount">
<form:errors path="*" cssClass="errors"></form:errors>
  <div class="search_area">
      <div class="heading"><span class="title">查询条件</span></div>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr> 
		<td width="10%" class="searchName"><spring:message code="loginForm.account.accountName.displayname"/></td>
		<td width="20%">
			<input name="ht_t.acctName" class="searchText" type="text" value="${t_acctName }" class="textbox" size="20" />
		</td>
        <td width="10%" class="searchName"></td>
        <td width="20%"></td>
        <td width="10%" class="searchName"></td>
        <td width="20%"></td>
	</tr>
   </table>
    <input type="hidden" name="statustype" id="statustype"/>
  <div class="search_bottom">
  <input type="button" class="button" value="查询" onclick="trimForm('fwAccount');postDataByFormName('fwAccount','workspace')" />
  <input type="button" class="button" value="清空" onclick="clearFormById('fwAccount',1);" />
  </div>
  </div>
     
<div class="table_list">
      <div class="heading">
      	<span class="title">用户列表</span>
      	<div class="tool" align="right">
	      <input type="button" class="button" value="新增" onclick="getData('user.do?actionMethod=add','','workspace');"/>
	      <input type="button" class="button" value="编辑" onclick="if(isSelectData('id')){if(isMultiSelectData('id')){pageEditData('user.do?actionMethod=edit','queryId','id','workspace');}};" />
	      <input type="button" class="button" value="删除" onclick="deleteData('user.do?actionMethod=delete','fwAccount');" />
	      <input type="button" class="button" value="分派" onclick="assignDataNew('user.do?actionMethod=assign');"/>
	      <input type="button" class="button" value="密码重置"  onclick="resertPassword();" />
	      <input type="button" class="button" value="禁用" onclick="updateUser('D');" />
	      <input type="button" class="button" value="激活" onclick="updateUser('A');" />
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th ><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"></th>
				<th><spring:message code="loginForm.account.accountName.displayname"/></th>
				<th><spring:message code="loginForm.account.userName.displayname"/></th>
				<th><spring:message code="loginForm.account.status.displayname"/></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="user" items="${pageBean.dataList}">
		    <tr  align="center">
            <td><input type="checkbox" value="${user.id}" name="id" ></td>
		    <td>
		    	${user.acctName}
		    </td>
			   <td>
			    	${user.userName}
			   </td>
			   <td>
			    <c:if test="${user.status=='A'}">active</c:if>			
				<c:if test="${user.status=='D'}">Dormancy</c:if>
			   </td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="fwAccount" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>