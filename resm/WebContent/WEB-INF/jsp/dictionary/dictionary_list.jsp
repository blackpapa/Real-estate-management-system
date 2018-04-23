<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="http://www.java.com/j2ee" %>

<form:form modelAttribute="fwDictionary" name="fwDictionary">
<input type="hidden" name="categoryId" value="${fwCategory.id }"/>
<fieldset>
<legend>查询条件</legend>
<div class="condition_left">
<table  width="98%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
		<td width="10%" align="right">字典名称：</td>
		<td width="15%"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t.name" /></td>
    </tr>
</table>
</div>
<div class="clear"></div>
</fieldset>
<div class="widget">
<div class="head"><h5 class="iFrames">字典信息
</h5>

</div>
<div id="tableBody2">
<table width="98.5%" id="tb_dic_list1_${last_module_id}">
 <thead>
	<tr>
		<th width="40" align="center">
			<input name="checkbox5" type="checkbox" class="formheader" id="checkbox5" />
		</th>
        <th>字典名称</th>
        <th>字典编码</th>
        <th>目录</th>
        <th>字典排序</th>
        <th>操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dic" items="${pageBean.dataList}" varStatus="s">
	<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
		<td align="center">
			<input type="checkbox" value="${dic.id}" name="id" >
		</td>
		<td><c:out value="${dic.name}"/></td>
		<td><c:out value="${dic.code}"/></td>
		<td><c:out value="${dic.fwCategory.name}"/></td>
		<td><c:out value="${dic.orderNum}"/></td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
</div>
</form:form>
