<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<script type="text/javascript">
function addData(){
	//window.location.href = actionName+(actionName.indexOf("?")>0?"&":"?")+"actionMethod=add";
	postDataByURL("role.do","actionMethod=add","workspace");
}
function editData(idName){	
	pageEditSingleData("role.do?actionMethod=edit","queryId",getCheckValue(idName),"workspace");
}
function assignData(actionName){
	var checkName = getCheckName();
	if(checkName==''){
		return ;
	}
	var checkValue = getCheckValue(checkName);
	if(checkValue==""||checkValue=="undefine"||checkValue==null){
 		alert("请选择一条被分配的数据!");
 		return ;
 	}
	pageEditSingleData("role.do?actionMethod=assign","id",checkValue,"workspace");
}
//检查要删除的角色是否已被使用
function check(){
	$.ajax({
		type:"POST",
		url:'role.do?actionMethod=check',
		data:$('#ec_ec').serialize(),
		dataType:"html",
	    success:function(data,statuText,responseObj){
	    	if("success"==data){
	    		if(confirm("是否确认删除所选的角色？")){
	    			postDataByURL('role.do?actionMethod=delete',$('#ec_ec').serialize(),'workspace');
	    		}
	    	}else{
	    		if(confirm(data)){
	    			postDataByURL('role.do?actionMethod=delete',$('#ec_ec').serialize(),'workspace');
	    		}
	    	}
	    },
	    error:function(){
	    	alert("删除角色失败！");
	    }
		
	});
}
</script>
<form:form modelAttribute="fwDuty" name="ec" id="ec_ec">
<form:errors path="*" cssClass="errors"></form:errors>
    <div class="search_area">
      <div class="heading"><span class="title">查询条件</span></div>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100"><spring:message code="dutyForm.dutyName.displayname"/></th>
		<td width="160">
		<input name="ht_t.name" type="text" value="${t_name }" class="textbox" size="20" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">&nbsp;</th>
        <td width="160">
        &nbsp;
        </td>
        <th width="20">&nbsp;</th>
        <th width="100">&nbsp;</th>
        <td width="160">&nbsp;</td>
        <td width="5">&nbsp;</td>
	</tr>
   </table>

  <div class="search_bottom">
  <input type="button" class="button" value="查询" onclick="trimForm('ec_ec');postDataByFormName('ec_ec','workspace')"/>
  <input type="button" class="button" value="清空" onclick="clearFormById('ec_ec',1);" />
  </div>
</div>
   
<div class="table_list">
      <div class="heading"><span class="title">角色列表</span>
      
      <div class="tool" align="right">
      <!--  <input type="button" class="button" value="新增" onclick="editData('role.do')"/> -->
      <input type="button" class="button" value="新增" onclick="addData()"/>
      <input type="button" class="button" value="编辑" onclick="if(isSelectData('id')){if(isMultiSelectData('id')){editData('id')}}" />
      <input type="button" class="button" value="删除" onclick="if(isSelectData('id')){check();}" />
      <input type="button" class="button" value="分派" onclick="if(isMultiSelectData('id')){assignData('role.do')}"/>
      <!--  
      <input type="button" class="button" value="编辑" onclick="if(isSelectData('id')){if(isMultiSelectData('id')){editData('role.do')}}" />
      <input type="button" class="button" value="删除" onclick="if(isSelectData('id')){deleteInfo('role.do')}" />
      <input type="button" class="button" value="分派" onclick="assignData('role.do')"/> -->
    </div>
      </div>
       
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th ><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"></th>
				<th><spring:message code="dutyForm.dutyName.displayname"/></th>
				<th><spring:message code="dutyForm.status.displayname"/></th>
				<th><spring:message code="dutyForm.describe.displayname"/></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="duty" items="${pageBean.dataList}">
		    <tr align="center">
            <td><input type="checkbox" value="${duty.id}" name="id" ></td>
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
  <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="ec_ec" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
  </form:form>
