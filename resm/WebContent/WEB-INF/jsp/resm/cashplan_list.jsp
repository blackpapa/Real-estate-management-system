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
<form:form modelAttribute="cashPlan" name="cashPlan">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">楼号</th>
		<td width="160">
		<input name="ht_t.salesInfo.houseInfo.no" type="text" id="ht_t_salesInfo_houseInfo_no" value="${t_salesInfo_houseInfo_no }" class="textbox" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">客户名称</th>
        <td width="160">
		<input name="ht_t.salesInfo.customerInfo.name" type="text" id="ht_t_salesInfo_customerInfo_name" value="${t_salesInfo_customerInfo_name }" class="textbox" />
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
  <input type="button" class="button" value="查询" onclick="trimForm('cashPlan');postDataByFormName('cashPlan','workspace');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('cashPlan',2);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">&nbsp;</span>
      	<div class="tool" align="right">
	    	<input type="button" class="button" value="新增" onclick="editPlan();"/>
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>楼盘名称</th>
				<th>地址</th>
				<th>楼号</th>
				<th>客户名称</th>
				<th>付款方式</th>
				<th>类型</th>
				<th>标题</th>
				<th>计划到款时间</th>
				<th>计划到款金额</th>
				<th>创建时间</th>
				<th>创建人</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		    <td>
		    	<c:out value="${obj.salesInfo.houseInfo.buildingInfo.name }"/>
		    </td>
			<td title="${obj.salesInfo.houseInfo.buildingInfo.address}">
			   <c:out value="${obj.salesInfo.houseInfo.buildingInfo.address }"/>
			</td>
			<td >
				<c:out value="${obj.salesInfo.houseInfo.no }"/>
			</td>
			<td>
			    <c:out value="${obj.salesInfo.customerInfo.name }"/>
			</td>
			<td>
			    <c:if test="${'1' eq obj.salesInfo.state }">按揭</c:if>
			    <c:if test="${'2' eq obj.salesInfo.state }">全款</c:if>
			</td>
			<td><c:out value="${obj.planType }"/></td>
			<td><c:out value="${obj.title }"/></td>
			<td>
			    <fmt:formatDate value="${obj.planDate }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
			    <c:out value="${obj.planValue }"/>
			</td>
			<td>
			    <fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
			    <c:out value="${obj.creator }"/>
			</td>
			<td>
			    <a href="#" onclick="pageEditSingleData('cashPlan.do?actionMethod=edit','queryId','${obj.id}','workspace');">修改</a>&nbsp;&nbsp;
			    <a href="#" onclick="postDataForSingleDelete('cashPlan.do?actionMethod=delete', 'id', '${obj.id}', 'workspace');">删除</a>&nbsp;&nbsp;
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="cashPlan" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
<script>
	//增加信息
	function editPlan() {
		 getData('cashPlan.do?actionMethod=add','','workspace');
	}
</script>