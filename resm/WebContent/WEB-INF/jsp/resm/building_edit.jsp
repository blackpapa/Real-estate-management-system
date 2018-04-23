<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="buildingInfo" name="buildingInfo">
<input type="hidden" name="id" value="${buildingInfo.id }"/>
<div class="table_edit">
      <div class="heading" style="text-align: left;">
      		<span class="title">
      			<c:if test="${buildingInfo.id !=null }">修改</c:if><c:if test="${buildingInfo == null || buildingInfo.id == null }">新增</c:if>楼盘信息
      		</span>
      </div>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
			<tr>
				<th align="left">楼盘名称<font color="red">*</font></th>
				<td align="left"><input name="name" id="name" size="20" type="text" maxlength="50" value="${buildingInfo.name }" /></td>
			</tr>
			<tr>
				<th align="left">地址<font color="red">*</font></th>
				<td align="left">
					<input name="address" id="address" size="20" type="text" maxlength="300" value="${buildingInfo.address }" />
			  </td>
			</tr>	
			<tr>
				<th align="left">开盘时间<font color="red">*</font></th>
				<td align="left">
				
				<input name="openDate" id="openDate" size="20" readonly="readonly" type="text" maxlength="100" value="${buildingInfo.openDate }" onClick="WdatePicker({el:'openDate',dateFmt:'yyyyMMdd'});" />
			</td>
			</tr>	
			<tr>
				<th align="left">交房时间<font color="red">*</font></th>
				<td align="left">
				<input name="submitDate" id="submitDate" readonly="readonly" size="20" type="text" maxlength="100" value="${buildingInfo.submitDate }" onClick="WdatePicker({el:'submitDate',dateFmt:'yyyyMMdd'});" />
				</td>
			</tr>	
			<tr>
				<th width="45%" align="right">总面积</th>
				<td align="left">
					<input name="totalArea" id="totalArea" size="20" onkeyup="checkNumber(this);" type="text" maxlength="10" value="${buildingInfo.totalArea }" />
				</td>
				</tr>
			<%-- <tr>
				<th width="45%" align="right">最低价</th>
				<td align="left">
					<input name="scopeSmall" id="scopeSmall" size="20" onkeyup="checkNumber(this);" type="text" maxlength="30" value="${buildingInfo.scopeSmall }" />
				</td>
			</tr>
			<tr>
				<th width="45%" align="right">最高价</th>
				<td align="left">
					<input name="scopeBig" id="scopeBig" size="20" onkeyup="checkNumber(this);" type="text" maxlength="30" value="${buildingInfo.scopeBig }" />
				</td>
			</tr>	 --%>
			<tr>
		        <th width="45%" align="right">均价</th>
				<td align="left">
					<input name="avgPrice" id="avgPrice" size="20" onkeyup="checkNumber(this);" type="text" maxlength="30" value="${buildingInfo.avgPrice }" />
		        </td>
			</tr>
			<tr>
		        <th width="45%" align="right">绿化率</th>
				<td align="left">
					<input name="greenRatio" id="greenRatio" size="20"  type="text" maxlength="30" value="${buildingInfo.greenRatio }" />
		        </td>
			</tr>
			<tr>
		        <th width="45%" align="right">描述</th>
				<td align="left">
					<textarea name="desc" id="desc" rows="5" cols="50" wrap="physical">
						${buildingInfo.desc}
					</textarea>
					 </td>
			</tr>
		</table>
		</div>
		<div class="clear"></div>
		<div class="edit_bottom_detail" align="center">
			<input type="button" class="button" value="保存" onclick="trimForm('buildingInfo');postDataByFormName('buildingInfo','workspace');"/>
		   <input type="button" class="button" value="返回" onclick="getData('buildingManagement.do?actionMethod=query','','workspace')" />
		</div>
</form:form>
<script>
function checkNumber(obj){
	if(isNaN($(obj).val())) {
		$(obj).val('');
	}
}
</script>