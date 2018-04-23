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
<form:form modelAttribute="contractInfo" name="contractInfo">
<div class="search_area">
 <div class="heading"><span class="title">查询条件</span></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search_condition">
		<tr>
		<th width="15" height="24">&nbsp;</th>
		<th width="100">文件名</th>
		<td width="160">
		<input name="ht_t.fileName" type="text" id="ht_t_fileName" value="${t_fileName }" class="textbox" />
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
  <input type="button" class="button" value="查询" onclick="trimForm('contractInfo');postDataByFormName('contractInfo','workspace');" />
  <input type="button" class="button" value="清空" onclick="clearFormById('contractInfo',1);" />
 </div>
</div>
<div class="table_list">
      <div class="heading">
      	<span class="title">&nbsp;</span>
      	<div class="tool" align="right">
      		<input type="hidden" name="export" id="export"/>
	         <input type="button" class="button" value="导出" onclick="exportData();" />
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
				<th>客户名称</th>
				<th>签订时间</th>
				<th>文件名</th>
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
				<c:out value="${obj.buildingInfo.totalArea }"/>
			</td>
			<td>
			    <c:out value="${obj.buildingInfo.avgPrice }"/>
			</td>
			<td>
			    <c:out value="${obj.buildingInfo.openDate }"/>
			</td>
			<td>
			    <c:out value="${obj.buildingInfo.submitDate }"/>
			</td>
			<td>
			    <c:out value="${obj.buildingInfo.greenRatio }"/>
			</td>
			<td>
			    <c:out value="${obj.customerName }"/>
			</td>
			<td>
			    <c:out value="${obj.signDate }"/>
			</td>
			<td>
				<a href="common.do?actionMethod=download&queryId=${obj.id}">
			  	  <c:out value="${obj.fileName }"/>
			  	</a>
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="contractInfo" resultArea="workspace" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>
<script>
	function exportData() {
		$("#export").val('1');
		$("#contractInfo").submit();
		$("#export").val('');
	}
</script>
