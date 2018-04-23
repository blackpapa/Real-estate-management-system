<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form modelAttribute="addressBook">
<form:hidden path="addrBookId"/>
<table border="0" width="100%">
  <tr>
    <th align="left">
      <spring:message code="addressBookForm.bkCname.displayname"  />
    </th>
    <td align="left">
      <form:input path="bkCname"/>
    </td>
  </tr>
   <tr>
    <th align="left">
      <spring:message code="addressBookForm.bkEname.displayname"  />
    </th>
    <td align="left">
      <form:input path="bkEname"/>
    </td>
  </tr>
  <tr>
    <th align="left">
      <spring:message code="addressBookForm.email.displayname"  />
    </th>
    <td align="left">
      <form:input path="bkEmail"/>
    </td>
  </tr>
   <tr>
    <th align="left">
      <spring:message code="addressBookForm.telephone.displayname" />
    </th>
    <td align="left">
      <form:input path="bkTelephone"/>
    </td>
  </tr>
   <tr>
    <th align="left">
      <spring:message code="addressBookForm.qq.displayname"  />
    </th>
    <td align="left">
      <form:input path="bkQq"/>
    </td>
  </tr>
</table>
</form:form>