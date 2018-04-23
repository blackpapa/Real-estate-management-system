<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="cashInfo" name="cashInfo">
<input type="hidden" name="id" value="${cashInfo.id }"/>
<div class="table_edit">
      <div class="heading" style="text-align: left;">
      		<span class="title">
      			<c:if test="${cashInfo.id !=null }">修改</c:if><c:if test="${cashInfo == null || cashInfo.id == null }">新增</c:if>到款信息
      		</span>
      </div>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
			<tr>
				<th align="left">款项计划<font color="red">*</font></th>
				<td align="left">
					<select id="plan" name="plan" class="selectbox">
						<option value="">---请选择---</option>
						<c:forEach items="${planList }" var="obj">
							<option value="${obj.id }" <c:if test="${cashInfo.cashPlan.id eq obj.id }">selected="selected"</c:if>>${obj.title }</option>
						</c:forEach>						
					</select>
			  </td>
			</tr>	
			<tr>
				<th align="left">标题<font color="red">*</font></th>
				<td align="left">
				
				<input name="title" id="title" size="20"  type="text" maxlength="100" value="${cashInfo.title }" />
			</td>
			<tr>
				<th align="left">到款时间<font color="red">*</font></th>
				<td align="left">
				
				<input name="cashdate" id="cashdate" size="20" readonly="readonly" type="text" maxlength="100" value="${cashInfo.cashDate }" onClick="WdatePicker({el:'cashdate',dateFmt:'yyyy-MM-dd'});" />
			</td>
			</tr>	
			<tr>
				<th align="left">到款金额<font color="red">*</font></th>
				<td align="left">
				<input name="cashValue" id="cashValue" onkeyup="checkNumber(this);"  size="20" type="text" maxlength="10" value="${cashInfo.cashValue }" />
				</td>
			</tr>	
		</table>
		</div>
		<div class="clear"></div>
		<div class="edit_bottom_detail" align="center">
			<input type="button" class="button" value="保存" onclick="trimForm('cashInfo');postDataByFormName('cashInfo','workspace');"/>
		   <input type="button" class="button" value="返回" onclick="getData('cashManagement.do?actionMethod=query','','workspace')" />
		</div>
</form:form>
<script>
function checkNumber(obj){
	if(isNaN($(obj).val())) {
		$(obj).val('');
	}
}
</script>