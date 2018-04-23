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
<form:form modelAttribute="returnHouseInfo" name="returnHouseInfo">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">客户名称</th>
		<td width="160">
		<input name="ht_t.customerName" type="text" id="ht_t_customerName" value="${t_customerName }" class="textbox" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">&nbsp;</th>
        <td width="160">
			&nbsp;
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
</table>
 <div class="search_bottom">
  <input type="button" class="button" value="查询" onclick="trimForm('returnHouseInfo');postDataByFormName('returnHouseInfo','historyList');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('returnHouseInfo',1);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">&nbsp;</span>
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
				<th>房号</th>
				<th>客户名称</th>
				<th>电话</th>
				<th>时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		    <td>
		    	<c:out value="${obj.buildingName }"/>
		    </td>
			<td>
			   <c:out value="${obj.buildingAddress }"/>
			</td>
			<td >
				<c:out value="${obj.houseNo }"/>
			</td>
			<td>
			    <c:out value="${obj.customerName }"/>
			</td>
			<td>
			    <c:out value="${obj.customerPhone }"/>
			</td>
			<td>
			    <fmt:formatDate value="${obj.changeDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="returnHouseInfo" resultArea="historyList" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
