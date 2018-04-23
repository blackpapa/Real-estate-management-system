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
<form:form modelAttribute="cashInfo" name="cashInfo">
<div class="table_list">
      <div class="heading">
      	<span class="title">应收款信息</span>
      	<div class="tool" align="right">
	    	&nbsp;
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
				<th>计划到款时间</th>
				<th>计划到款金额</th>
				<th>标题</th>
				<th>到款时间</th>
				<th>到款金额</th>
				<th>创建时间</th>
				<th>创建人</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		    <td>
		    	<c:out value="${obj.cashPlan.salesInfo.houseInfo.buildingInfo.name }"/>
		    </td>
			<td title="${obj.cashPlan.salesInfo.houseInfo.buildingInfo.address}">
			   <c:out value="${obj.cashPlan.salesInfo.houseInfo.buildingInfo.address }"/>
			</td>
			<td >
				<c:out value="${obj.cashPlan.salesInfo.houseInfo.no }"/>
			</td>
			<td>
			    <c:out value="${obj.cashPlan.salesInfo.customerInfo.name }"/>
			</td>
			<td>
			    <c:if test="${'1' eq obj.cashPlan.salesInfo.state }">按揭</c:if>
			    <c:if test="${'2' eq obj.cashPlan.salesInfo.state }">全款</c:if>
			</td>
			<td><c:out value="${obj.cashPlan.planType }"/></td>
			<td>
			    <fmt:formatDate value="${obj.cashPlan.planDate }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
			    <c:out value="${obj.cashPlan.planValue }"/>
			</td>
			<td>
				<c:out value="${obj.title }"/>
			</td>
			<td>
			    <fmt:formatDate value="${obj.cashDate }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
			    <c:out value="${obj.cashValue}"/>
			</td>
			<td>
			    <fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
			    <c:out value="${obj.creator }"/>
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="cashInfo" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>