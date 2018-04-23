<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<form:form modelAttribute="loginForm" action="changePwd.do?actionMethod=changePassword">
<form:hidden path="accoutId"/>
<div class="table_edit">
      <div class="heading"><span class="title">栏目名称</span></div>
<font color="red"><form:errors path="*" cssClass="errors"/></font>
	<p id="error_box"></p>
<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="edit_condition">
	<tr>
    <td align="right" height="40">
                            账户
    </td>
    <td align="left">
      ${loginForm.userName}
    </td>
  </tr>
  <tr>
    <td align="right">
                                   密码
    </td>
    <td align="left" >
      <input type="text" value="" maxlength="20" name="password" />
    </td>
  </tr>
  <tr>
    <td align="right" height="40">
                                              新密码
    </td>
    <td align="left" >
      <input type="text" value="" maxlength="20" name="newPassword" />
    </td>
  </tr>
  <tr>
    <td align="right" height="40">
                                                    确认密码
    </td>
    <td align="left">
     <input type="text" value="" maxlength="20" name="confirmPassword"/>
    </td>
  </tr>
</table>
<div class="edit_bottom" align="center">
<input type="button" id="sb1" name="sb1" value="修改密码" class="button" onclick="postDataByFormName('loginForm','workspace')"/>
<input type="button" id="b1" name="b1" value="返回" class="button" onclick="window.location.href='changePwd.do?actionMethod=home'"/>
</div>
</div>
</form:form>
