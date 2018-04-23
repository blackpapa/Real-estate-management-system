<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="houseInfo" name="houseInfo">
<input type="hidden" name="id" value="${houseInfo.id }"/>
<div class="table_edit">
      <div class="heading" style="text-align: left;">
      		<span class="title">
      			<c:if test="${houseInfo.id !=null }">修改</c:if><c:if test="${houseInfo == null || houseInfo.id == null }">新增</c:if>楼房信息
      		</span>
      </div>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
			<tr>
				<th align="left">楼盘<font color="red">*</font></th>
				<td align="left">
					<select id="buildingInfoId" name="buildingInfoId" class="selectbox">
						<option value="">---请选择---</option>
						<c:forEach items="${buildingList }" var="building">
							<option value="${building.id}" <c:if test="${houseInfo.buildingInfo.id eq building.id }">selected="selected"</c:if>>${building.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th align="left">房号<font color="red">*</font></th>
				<td align="left">
					<input name="no" id="no" size="20" type="text" maxlength="300" value="${houseInfo.no }" />
			  </td>
			</tr>	
			<tr>
				<th align="left">面积<font color="red">*</font></th>
				<td align="left">
				
				<input name="area" id="area" size="20" onkeyup="checkNumber(this)" type="text" maxlength="6" value="${houseInfo.area }"  />
			</td>
			<tr>
				<th align="left">总楼层<font color="red">*</font></th>
				<td align="left">
				
				<input name="high" id="high" size="20" onkeyup="checkNumber(this)" type="text" maxlength="2" value="${houseInfo.high }"  />
			</td>
			</tr>	
			<tr>
				<th align="left">户型<font color="red">*</font></th>
				<td align="left">
					<select id="catagory" name="catagory" class="selectbox">
						<option value="">---请选择---</option>
						<option value="一室一厅一卫" <c:if test="${houseInfo.catagory eq '一室一厅一卫' }">selected="selected"</c:if>>一室一厅一卫</option>
						<option value="两室一厅一卫" <c:if test="${houseInfo.catagory eq '两室一厅一卫' }">selected="selected"</c:if>>两室一厅一卫</option>
						<option value="三室一厅一卫" <c:if test="${houseInfo.catagory eq '三室一厅一卫' }">selected="selected"</c:if>>三室一厅一卫</option>
						<option value="三室两厅两卫" <c:if test="${houseInfo.catagory eq '三室两厅两卫' }">selected="selected"</c:if>>三室两厅两卫</option>
						<option value="四室一厅一卫" <c:if test="${houseInfo.catagory eq '四室一厅一卫' }">selected="selected"</c:if>>四室一厅一卫</option>
						<option value="四室两厅两卫" <c:if test="${houseInfo.catagory eq '四室两厅两卫' }">selected="selected"</c:if>>四室两厅两卫</option>
					</select>
				</td>
			</tr>	
			<c:if test="${'2' eq houseInfo.state }">
			<tr>
				<th width="45%" align="right">单价<font color="red">*</font></th>
				<td align="left">
					<input name="price" id="price" size="20" onkeyup="checkNumber(this);" type="text" maxlength="10" value="${houseInfo.price }" />
				</td>
				</tr>
			<tr>
				<th width="45%" align="right">总价</th>
				<td align="left">
					<input name="total" id="total" size="20" onkeyup="checkNumber(this);" type="text" maxlength="30" value="${houseInfo.total }" />
				</td>
			</tr>
			</c:if>
			<tr>
		        <th width="45%" align="right">描述</th>
				<td align="left">
					<textarea name="desc" id="desc" rows="5" cols="50" wrap="physical">
						${houseInfo.desc}
					</textarea>
					 </td>
			</tr>
		</table>
		</div>
		<div class="clear"></div>
		<div class="edit_bottom_detail" align="center">
			<input type="button" class="button" value="保存" onclick="trimForm('houseInfo');postDataByFormName('houseInfo','workspace');"/>
		   <input type="button" class="button" value="返回" onclick="getData('houseManagement.do?actionMethod=query','','workspace')" />
		</div>
</form:form>
<script>
function checkNumber(obj){
	if(isNaN($(obj).val())) {
		$(obj).val('');
	}
}
</script>