<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="customerInfo" name="customerInfo">
<input type="hidden" name="id" value="${customerInfo.id }"/>
<div class="table_edit">
      <div class="heading" style="text-align: left;">
      		<span class="title">
      			<c:if test="${customerInfo.id !=null }">修改</c:if><c:if test="${customerInfo == null || customerInfo.id == null }">新增</c:if>客户信息
      		</span>
      </div>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
			<tr>
				<th align="left">客户名称<font color="red">*</font></th>
				<td align="left"><input name="name" id="name" size="20" type="text" maxlength="50" value="${customerInfo.name }" /></td>
			</tr>
			<tr>
				<th align="left">通讯地址<font color="red">*</font></th>
				<td align="left">
					<input name="address" id="address" size="20" type="text" maxlength="300" value="${customerInfo.address }" />
			  </td>
			</tr>	
			<tr>
		        <th width="45%" align="right">电话<font color="red">*</font></th>
				<td align="left">
					<input name="phone" id="phone" size="20"  type="text" maxlength="30" value="${customerInfo.phone }" />
		        </td>
			</tr>
			<tr>
		        <th width="45%" align="right">工作单位</th>
				<td align="left">
					<input name="company" id="company" size="20"  type="text" maxlength="30" value="${customerInfo.company }" />
		        </td>
			</tr>
		</table>
		</div>
		<div class="clear"></div>
		<div class="edit_bottom_detail" align="center">
			<input type="button" class="button" value="保存" onclick="trimForm('customerInfo');postDataByFormName('customerInfo','workspace');"/>
		   <input type="button" class="button" value="返回" onclick="getData('customerManagement.do?actionMethod=query','','workspace')" />
		</div>
</form:form>
<script>
function checkNumber(obj){
	if(isNaN($(obj).val())) {
		$(obj).val('');
	}
}
</script>