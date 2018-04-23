<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="js/artDialog/default.css" rel="stylesheet" type="text/css" />
<script src="js/artDialog/jquery.artDialog.basic.js" type="text/javascript"></script>
<form:form modelAttribute="salesInfo" name="salesInfo">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">楼号</th>
		<td width="160">
		<input name="ht_t.houseInfo.no" type="text" id="ht_t_houseInfo_no" value="${t_houseInfo_no }" class="textbox" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">客户名称</th>
        <td width="160">
		<input name="ht_t.customerInfo.name" type="text" id="ht_t_customerInfo_name" value="${t_customerInfo_name }" class="textbox" />
        </td>
        <th width="20">&nbsp;</th>
        <th width="100">&nbsp;</th>
        <td width="160">
        &nbsp;
        </td>
        <td width="5">&nbsp;</td>
        <th width="100">&nbsp;</th>
        <td width="160">
			&nbsp;
        </td>
	</tr>
	<tr>
		<td width="15" height="24">&nbsp;</td>
		<td width="100"></td>
		<td width="160">
		</td>
        <td width="20">&nbsp;</td>
        <td width="100"></td>
        <td width="160">
	    </td>
        <td width="20">&nbsp;</td>
        <td width="100"></td>
        <td width="160">
		&nbsp;
        </td>
        <td width="5">&nbsp;</td>
        <td width="100">&nbsp;</td>
        <td width="160">&nbsp;</td>
	</tr>
</table>
 <div class="search_bottom">
  <input type="button" class="button" value="查询" onclick="trimForm('salesInfo');postDataByFormName('salesInfo','workspace');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('salesInfo',2);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">&nbsp;</span>
      	<div class="tool" align="right">
	    	<input type="button" class="button" value="退房" onclick="changeHouse();"/>
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>楼盘名称</th>
				<th>地址</th>
				<th>楼号</th>
				<th>客户名称</th>
				<th>付款方式</th>
				<th>状态</th>
				<th>描述</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
				<td><input type="checkbox" name="id" value="${obj.id }" <c:if test="${'2' eq obj.saleStatus}"> disabled="disabled"</c:if> /></td>		
		    <td>
		    	<c:out value="${obj.houseInfo.buildingInfo.name }"/>
		    </td>
			<td title="${obj.houseInfo.buildingInfo.address}">
			   <c:out value="${obj.houseInfo.buildingInfo.address }"/>
			</td>
			<td >
				<c:out value="${obj.houseInfo.no }"/>
			</td>
			<td>
			    <c:out value="${obj.customerInfo.name }"/>
			</td>
			<td>
			    <c:if test="${'1' eq obj.state }">按揭</c:if>
			    <c:if test="${'2' eq obj.state }">全款</c:if>
			</td>
			<td>
			    <font color="green"><c:if test="${'1' eq obj.saleStatus }">正常</c:if></font>
			    <font color="red"><c:if test="${'2' eq obj.saleStatus }">废弃</c:if></font>
			</td>
			<td>
			    <c:out value="${obj.desc }"/>
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="salesInfo" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
	 <div style="clear:both;"></div>
	 <div id="historyList"></div>
<script>
	$(document).ready(function() {
			getData('returnHouse.do?actionMethod=edit','','historyList');
	});
	function changeHouse() {
		if(isMultiSelectData("id")) {
			var sales = $('input[name="id"]:checked').val();
			var dataString =  "&queryId=" + sales;
			postDataByURL("returnHouse.do?actionMethod=add",dataString,"historyList",'postDataByFormName("salesInfo","workspace")','');
			
		}
	}
</script>