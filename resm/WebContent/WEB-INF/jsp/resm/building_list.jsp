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
<form:form modelAttribute="buildingInfo" name="buildingInfo">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">楼盘名称</th>
		<td width="160">
		<input name="ht_t.name" type="text" id="ht_t_name" value="${t_name }" class="textbox" />
		</td>
        <th width="20">&nbsp;</th>
        <th width="100">地址</th>
        <td width="160">
		<input name="ht_t.address" type="text" id="ht_t_address" value="${t_address }" class="textbox" />
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
  <input type="button" class="button" value="查询" onclick="trimForm('buildingInfo');postDataByFormName('buildingInfo','workspace');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('buildingInfo',2);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">&nbsp;</span>
      	<div class="tool" align="right">
	         <input type="button" class="button" value="新增" onclick="editBuildingInfo();"/>
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>楼盘名称</th>
				<th>地址</th>
				<th>占地面积</th>
				<th>均价</th>
				<th>开盘时间</th>
				<th>交房时间</th>
				<th>绿化率</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		    <td>
		    	<c:out value="${obj.name }"/>
		    </td>
			<td title="${obj.address}">
			   <c:out value="${obj.address }"/>
			</td>
			<td >
				<c:out value="${obj.totalArea }"/>
			</td>
			<td>
			    <c:out value="${obj.avgPrice }"/>
			</td>
			<td>
			    <c:out value="${obj.openDate }"/>
			</td>
			<td>
			    <c:out value="${obj.submitDate }"/>
			</td>
			<td>
			    <c:out value="${obj.greenRatio }"/>
			</td>
			<td>
			    <c:out value="${obj.desc }"/>
			</td>
			<td>
			    <a href="#" onclick="pageEditSingleData('buildingManagement.do?actionMethod=edit','queryId','${obj.id}','workspace');">修改</a>&nbsp;&nbsp;
			    <a href="#" onclick="postDataForSingleDelete('buildingManagement.do?actionMethod=delete', 'id', '${obj.id}', 'workspace');">删除</a>&nbsp;&nbsp;
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="buildingInfo" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
<script>
	//增加信息
	function editBuildingInfo() {
		 getData('buildingManagement.do?actionMethod=add','','workspace');
	}
</script>