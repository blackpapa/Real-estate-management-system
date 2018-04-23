<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<script>
</script>
<form:form modelAttribute="fwCategory" cssClass="niceform" name="fwCategory">
<form:hidden path="id"/>
<div class="widget" style="border-radius: 2px 2px 2px 2px;border:1px solid #d5d5d5;border-top:none;">
<div class="head"><h5 class="iDropper"><c:if test="${fwCategory.id == null}">新增系统信息</c:if><c:if test="${fwCategory.id != null}">修改系统信息</c:if>
</h5>
</div>
<table border="0" width="98%" cellpadding="5" cellspacing="5" style="margin:10px 0;">
	<tr>
		<td align="right"><span class="redmark">*</span>字典目录编码：</td>
		<td align="left"><form:input path="code" size="30" maxlength="30" /></td>
	</tr>
	<tr>
		<td align="right" width="10%"><span class="redmark">*</span>字典目录名称：</td>
		<td align="left" width="50%"><form:input path="name" size="30" maxlength="30" /></td>
	</tr>
	<tr>
		<td align="right">是否显示：</td>
		<td align="left">
			<input type="radio" name="display" value="A" <c:if test="${fwCategory.display eq 'A' or fwCategory.display==null}"> checked="checked"</c:if>/>是&nbsp;
			<input type="radio" name="display" value="D" <c:if test="${fwCategory.display eq 'D'}"> checked="checked"</c:if>/>否
		</td>
	</tr>
	<!--
	<tr>
			<td align="right" height="25">所属系统名称：</td>
			<td align="left">
				<select name="fwSystem" style="width:20%;">
					<option value="">--请选择--</option>
					<c:forEach var="system" items="${systemList}">
						<option value="${system.id}"
							<c:if test="${system.id == fwCategory.fwSystem.id}"> selected</c:if>>${system.name}</option>
					</c:forEach>
				</select>
			</td>
	</tr>
	-->
</table>
</div>
</form:form>