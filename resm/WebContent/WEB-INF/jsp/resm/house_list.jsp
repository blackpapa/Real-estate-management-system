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
<form:form modelAttribute="houseInfo" name="houseInfo">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">楼盘名称</th>
		<td width="160">
		<input name="ht_t.buildingInfo.name" type="text" id="ht_t_buildingInfo_name" value="${t_buildingInfo_name }" class="textbox" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">户型</th>
        <td width="160">
		<select id="ht_t_catagory" name="ht_t.catagory" class="selectbox">
				<option value="">---请选择---</option>
				<option value="一室一厅一卫" <c:if test="${t_catagory eq '一室一厅一卫' }">selected="selected"</c:if>>一室一厅一卫</option>
				<option value="两室一厅一卫" <c:if test="${t_catagory eq '两室一厅一卫' }">selected="selected"</c:if>>两室一厅一卫</option>
				<option value="三室一厅一卫" <c:if test="${t_catagory eq '三室一厅一卫' }">selected="selected"</c:if>>三室一厅一卫</option>
				<option value="三室两厅两卫" <c:if test="${t_catagory eq '三室两厅两卫' }">selected="selected"</c:if>>三室两厅两卫</option>
				<option value="四室一厅一卫" <c:if test="${t_catagory eq '四室一厅一卫' }">selected="selected"</c:if>>四室一厅一卫</option>
				<option value="四室两厅两卫" <c:if test="${t_catagory eq '四室两厅两卫' }">selected="selected"</c:if>>四室两厅两卫</option>
			</select>
        </td>
        <th width="20">&nbsp;</th>
        <th width="100">状态</th>
        <td width="160">
	        <select id="ht_t_state" name="ht_t.state" class="selectbox">
	        	<option value="">---请选择---</option>
	        	<option value="1" <c:if test="${1 eq  t_state}">selected='selected'</c:if>>待售</option>
	        	<option value="2" <c:if test="${2 eq  t_state}">selected='selected'</c:if>>已售</option>
	        </select>
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
  <input type="button" class="button" value="查询" onclick="trimForm('houseInfo');postDataByFormName('houseInfo','workspace');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('houseInfo',3);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">&nbsp;</span>
      	<div class="tool" align="right">
	         <input type="button" class="button" value="新增" onclick="editHouseInfo();"/>
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>楼盘名称</th>
				<th>地址</th>
				<th>总楼层</th>
				<th>房号</th>
				<th>面积</th>
				<th>户型</th>
				<th>状态</th>
				<th>单价</th>
				<th>总价</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		    <td>
		    	<c:out value="${obj.buildingInfo.name }"/>
		    </td>
			<td title="${obj.buildingInfo.address}">
			   <c:out value="${obj.buildingInfo.address }"/>
			</td>
			<td >
				<c:out value="${obj.high }"/>
			</td>
			<td >
				<c:out value="${obj.no }"/>
			</td>
			<td>
			    <c:out value="${obj.area }"/>
			</td>
			<td>
			    <c:out value="${obj.catagory }"/>
			</td>
			<td>
				<c:if test="${'1' eq obj.state }">
					<font color="green">待售</font>
				</c:if>
				<c:if test="${'2' eq obj.state }">
					<font color="red">已售</font>
				</c:if>
			</td>
			<td>
				<c:out value="${obj.price }"/>&nbsp;
			</td>
			<td>
				<c:out value="${obj.total }"/>&nbsp;
			</td>
			<td>
			    <c:out value="${obj.desc }"/>
			</td>
			<td>
			    <a href="#" onclick="pageEditSingleData('houseManagement.do?actionMethod=edit','queryId','${obj.id}','workspace');">修改</a>&nbsp;&nbsp;
			    <a href="#" onclick="postDataForSingleDelete('houseManagement.do?actionMethod=delete', 'id', '${obj.id}', 'workspace');">删除</a>&nbsp;&nbsp;
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="houseInfo" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
<script>
	//增加信息
	function editHouseInfo() {
		 getData('houseManagement.do?actionMethod=add','','workspace');
	}
</script>