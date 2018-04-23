<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="http://www.java.com/j2ee" %>

<form:form modelAttribute="fwCategory" name="ec">
<fieldset>
<legend>查询条件</legend>
<div class="condition_left">
<table  width="98%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
		<td width="10%" align="right">字典目录名称：</td>
		<td width="15%"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t.name" /></td>
    </tr>
</table>
</div>
<div class="clear"></div>
</fieldset>
<div class="widget">
<div class="head">
<h5 class="iFrames">字典目录信息
</h5>
</div>
<div id="tableBody2">
<table width="98.5%" id="tb_category_list1_${last_module_id}" border="1">
 <thead>
	<tr>
		<th width="60" align="center"><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"><spring:message code="information.choose"/>
		</th>
        <th>字典目录名称</th>
        <th>字典目录编码</th>
        <th>所属系统</th>
        <th>操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="category" items="${pageBean.dataList}" varStatus="s">
	<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
		<td align="center">
			<input type="checkbox" value="${category.id}" name="id" >
		</td>
		<td><c:out value="${category.name}"/></td>
		<td><c:out value="${category.code}"/></td>
		<td><c:out value="${category.fwSystem.name}"/></td>
		<td><a href="#" onclick="getData('dictionaryCategory.do?actionMethod=edit&queryId=${category.id}','','workspace');">修改</a></td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
</div>
</form:form>

