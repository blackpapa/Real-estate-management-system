<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="salesInfo" name="salesInfo">
<input type="hidden" name="id" value="${salesInfo.id }"/>
<div class="table_edit">
      <div class="heading" style="text-align: left;">
      		<span class="title">
      			<c:if test="${salesInfo.id !=null }">修改</c:if><c:if test="${salesInfo == null || salesInfo.id == null }">新增</c:if>订房信息
      		</span>
      </div>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
			<tr>
				<th align="left">房屋信息<font color="red">*</font></th>
				<td align="left">
				<c:if test="${salesInfo == null || salesInfo.id == null }">
					<select id="house" name="house" class="selectbox" style="width:150px;">
						<option value="">---请选择---</option>
						<c:forEach items="${houseList }" var="house">
							<option value="${house.id}" <c:if test="${salesInfo.houseInfo.id eq house.id }">selected="selected"</c:if>>(${house.buildingInfo.name})${house.no}</option>
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${salesInfo.id !=null }">
					<input type="text" class="textbox" readonly="readonly" value="(${salesInfo.houseInfo.buildingInfo.name })${salesInfo.houseInfo.no}"/>
					<span style="color:red;">此信息不可修改!</span>
					<input type="hidden" name="house" id="house"  value="${salesInfo.houseInfo.id }"/>
				</c:if>
				</td>
			</tr>
			<tr>
				<th align="left">客户信息<font color="red">*</font></th>
				<td align="left">
				<c:if test="${salesInfo == null || salesInfo.id == null }">
					<select id="customer" name="customer" class="selectbox" style="width:150px;">
						<option value="">---请选择---</option>
						<c:forEach items="${customerList }" var="customer">
							<option value="${customer.id}" <c:if test="${salesInfo.customerInfo.id eq customer.id }">selected="selected"</c:if>>(${customer.name})${customer.phone}</option>
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${salesInfo.id !=null }">
					<input type="text" class="textbox" readonly="readonly" value="(${salesInfo.customerInfo.name })${salesInfo.customerInfo.phone}"/>
					<span style="color:red;">此信息不可修改!</span>
					<input type="hidden" name="customer" id="customer"  value="${salesInfo.customerInfo.id }"/>
				</c:if>
			  </td>
			</tr>	
			<tr>
				<th align="left">付款方式<font color="red">*</font></th>
				<td align="left">
					<select id="state" name="state" class="selectbox" style="width:150px;">
						<option value="">---请选择---</option>
						<option value="1" <c:if test="${'1' eq salesInfo.state}">selected="selected"</c:if>>按揭</option>
						<option value="2" <c:if test="${'2' eq salesInfo.state}">selected="selected"</c:if>>全款</option>
					</select>
				
			</td>
			</tr>
			<tr>
		        <th width="45%" align="right">描述</th>
				<td align="left">
					<textarea name="desc" id="desc" rows="5" cols="50" wrap="physical">
						${salesInfo.desc}
					</textarea>
					 </td>
			</tr>
		</table>
		</div>
		<div class="clear"></div>
		<div class="edit_bottom_detail" align="center">
			<input type="button" class="button" value="保存" onclick="trimForm('salesInfo');postDataByFormName('salesInfo','workspace');"/>
		   <input type="button" class="button" value="返回" onclick="getData('buyHouse.do?actionMethod=query','','workspace')" />
		</div>
</form:form>
<script>
function checkNumber(obj){
	if(isNaN($(obj).val())) {
		$(obj).val('');
	}
}
</script>