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
<form:form modelAttribute="returnCash" name="returnCash">
<div class="table_list">
      <div class="heading">
      	<span class="title">退款信息</span>
      	<div class="tool" align="right">
	         &nbsp;
	    </div>
	    <div class="clear"></div>
      </div>
      <div class="scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>到款标题</th>
				<th>到款金额</th>
				<th>到款时间</th>
				<th>退款金额</th>
				<th>退款时间</th>
				<th>创建人</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${pageBean.dataList}">
		 	<tr  align="center">
		    <td>
		    	<c:out value="${obj.cashInfo.title }"/>
		    </td>
			<td>
			   <c:out value="${obj.cashInfo.cashValue }"/>
			</td>
			<td >
				<fmt:formatDate value="${obj.cashInfo.cashDate }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
			    <c:out value="${obj.cashValue }"/>
			</td>
			<td>
			    <fmt:formatDate value="${obj.cashDate }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
			    <c:out value="${obj.creator }"/>
			</td>
		    </tr>
		 </c:forEach>
		 </tbody>
	</table>
	</div>
</div>
 <div class="pager">
  <c:if test="${pageBean!=null}">
		<ct:ajaxCutPage pageBean="${pageBean}" formName="returnCash" resultArea="returnList" offerPageSize="20,50,100" isExistForm="true"/>
 </c:if>
 </div>
</form:form>