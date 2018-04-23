<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="cashPlan" name="cashPlan">
<input type="hidden" name="id" value="${cashPlan.id }"/>
<div class="table_edit">
      <div class="heading" style="text-align: left;">
      		<span class="title">
      			<c:if test="${cashPlan.id !=null }">修改</c:if><c:if test="${cashPlan == null || cashPlan.id == null }">新增</c:if>款项计划
      		</span>
      </div>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
			<tr>
				<th align="left">标题<font color="red">*</font></th>
				<td align="left">
					<input type="text" id="title" name="title" value="${cashPlan.title }" class="textbox" />
				</td>
			</tr>
			<tr>
				<th align="left">款项类型<font color="red">*</font></th>
				<td align="left">
					<select id="planType" name="planType" class="selectbox">
						<option value="">---请选择---</option>
						<option value="定金" <c:if test="${'定金' eq cashPlan.planType}">selected="selected"</c:if>>定金</option>
						<option value="首付" <c:if test="${'首付' eq cashPlan.planType}">selected="selected"</c:if>>首付</option>
						<option value="全额款项" <c:if test="${'全额款项' eq cashPlan.planType}">selected="selected"</c:if>>全额款项</option>
					</select>
				</td>
			</tr>
			<tr>
				<th align="left">订购信息<font color="red">*</font></th>
				<td align="left">
					<select id="sales" name="sales" class="selectbox">
						<option value="">---请选择---</option>
						<c:forEach items="${salesList }" var="obj">
							<option value="${obj.id }" <c:if test="${cashPlan.salesInfo.id eq obj.id }">selected="selected"</c:if>>${obj.houseInfo.buildingInfo.name }${obj.houseInfo.no }(${obj.customerInfo.name }*${obj.customerInfo.phone})</option>
						</c:forEach>						
					</select>
			  </td>
			</tr>	
			<tr>
				<th align="left">计划到款时间<font color="red">*</font></th>
				<td align="left">
				
				<input name="plandate" id="plandate" size="20" readonly="readonly" type="text" maxlength="100" value="${cashPlan.planDate }" onClick="WdatePicker({el:'plandate',dateFmt:'yyyy-MM-dd'});" />
			</td>
			</tr>	
			<tr>
				<th align="left">计划到款金额<font color="red">*</font></th>
				<td align="left">
				<input name="planValue" id="planValue" onkeyup="checkNumber(this);"  size="20" type="text" maxlength="10" value="${cashPlan.planValue }" />
				</td>
			</tr>	
		</table>
		</div>
		<div class="clear"></div>
		<div class="edit_bottom_detail" align="center">
			<input type="button" class="button" value="保存" onclick="trimForm('cashPlan');postDataByFormName('cashPlan','workspace');"/>
		   <input type="button" class="button" value="返回" onclick="getData('cashPlan.do?actionMethod=query','','workspace')" />
		</div>
</form:form>
<script>
function checkNumber(obj){
	if(isNaN($(obj).val())) {
		$(obj).val('');
	}
}
</script>