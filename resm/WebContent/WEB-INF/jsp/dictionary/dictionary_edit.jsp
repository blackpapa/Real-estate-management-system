<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<script>
</script>
<form:form modelAttribute="fwDictionary" cssClass="niceform" name="fwDictionary">
<form:hidden path="id"/>
<input type="hidden" name="fwCategory" value="${categoryId}">
<div class="widget" style="border-radius: 2px 2px 2px 2px;border:1px solid #d5d5d5;border-top:none;">
<div class="head"><h5 class="iDropper"><c:if test="${fwDictionary.id == null}">新增字典信息</c:if><c:if test="${fwDictionary.id != null}">修改字典信息</c:if>
</h5>
<table border="0" cellspacing="0" cellpadding="0" class="caozuo_btn" style="padding:3px 3px 0px 0px">
        <tbody>
            <tr>
                <td>
                    <input class="seaBtn" type="button" value="保存" onclick="if(confirm('确认要保存吗？')){trimForm('fwDictionary');postDataByFormName('fwDictionary','workspace');}">&nbsp;<input class="seaBtn" type="button" value="返回" onclick="getData('property.do?actionMethod=query&id=${categoryId}','','workspace');">
                </td>
            </tr>
        </tbody>
    </table>
</div>
<table border="0" width="98%" cellpadding="5" cellspacing="5" style="margin:10px 0;">
	<tr>
		<td align="right"><span class="redmark">*</span>字典编码：</td>
		<td align="left"><form:input path="code" size="30" maxlength="30" /></td>
	</tr>
	<tr>
		<td align="right" width="10%"><span class="redmark">*</span>字典名称：</td>
		<td align="left" width="50%"><form:input path="name" size="30" maxlength="30" /></td>
	</tr>
	<tr>
		<td align="right" width="10%"><span class="redmark">*</span>字典排序：</td>
		<td align="left" width="50%"><form:input path="orderNum" size="30" maxlength="30" /></td>
	</tr>
	<tr>
		<td align="right">字典状态：</td>
		<td align="left">
			<input type="radio" name="status" value="A" <c:if test="${fwDictionary.status eq 'A' or fwDictionary.status==null}"> checked="checked"</c:if>/>是&nbsp;
			<input type="radio" name="status" value="D" <c:if test="${fwDictionary.status eq 'D'}"> checked="checked"</c:if>/>否
		</td>
	</tr>
</table>
</div>
</form:form>