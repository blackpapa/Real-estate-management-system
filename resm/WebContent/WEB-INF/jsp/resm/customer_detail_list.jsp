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
<form:form modelAttribute="customerInfo" name="customerInfo">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">客户姓名</th>
		<td width="160">
		<input name="ht_t.name" type="text" id="ht_t_name" value="${t_name }" class="textbox" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">电话</th>
        <td width="160">
        	<input type="text" name="ht_t.phone" id="ht_t_phone" value="${t_phone }" class="textbox" />
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
  <input type="button" class="button" value="查询" onclick="trimForm('customerInfo');postDataByFormName('customerInfo','workspace');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('customerInfo',2);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">客户信息</span>
      	<div class="tool" align="right">
	         &nbsp;
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>客户姓名</th>
				<th>电话</th>
				<th>工作单位</th>
				<th>通讯地址</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		 	<td>
		 		<input type="checkbox" name="id" value="${obj.id }" onclick="showInfo(this);"/>
		 	</td>
		    <td>
		    	<c:out value="${obj.name }"/>
		    </td>
			<td >
			   <c:out value="${obj.phone }"/>
			</td>
			<td >
				<c:out value="${obj.company }"/>
			</td>
			<td >
				<c:out value="${obj.address }"/>
			</td>
			<td>
			    <a href="#" onclick="pageEditSingleData('customerManagement.do?actionMethod=edit','queryId','${obj.id}','workspace');">修改</a>&nbsp;&nbsp;
			    <a href="#" onclick="postDataForSingleDelete('customerManagement.do?actionMethod=delete', 'id', '${obj.id}', 'workspace');">删除</a>&nbsp;&nbsp;
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="customerInfo" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
<div id="salesList"></div>
<div id="planList"></div>
<div id="moneyList"></div>
<div id="returnList"></div>
<script>
	//增加信息
	function showInfo(obj) {
		if($(obj).attr('checked') == 'checked') {
			var id = $(obj).val();
			pageEditSingleData("customerDetail.do?actionMethod=querySales","id",id,"salesList");
			pageEditSingleData("customerDetail.do?actionMethod=queryPlan","id",id,"planList");
			pageEditSingleData("customerDetail.do?actionMethod=queryMoney","id",id,"moneyList");
			pageEditSingleData("customerDetail.do?actionMethod=queryReturn","id",id,"returnList");
		}
		
	}
</script>