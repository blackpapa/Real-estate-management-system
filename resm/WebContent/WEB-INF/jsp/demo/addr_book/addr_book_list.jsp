<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form id="ec"  action="queryBook.do"  method="post" >
<ec:table items="DATA_LIST" var="book"
	action="queryBook.do" form="ec"
	title="Address Book List" width="100%"
	retrieveRowsCallback="limit"
	filterRowsCallback="limit"
	sortRowsCallback="limit">
	<ec:exportXls fileName="output.xls" tooltip="Export Excel"/>
	<ec:exportCsv fileName="output.txt" tooltip="Export CSV" delimiter=","/>
	<ec:row>
		<ec:column property="addrBookId" sortable="false" viewsAllowed="html" filterable="false" headerCell="selectAll">
			<input type="checkbox" name="addrBookId" value="${book.addrBookId}" />
		</ec:column>
		<ec:column property="bkCname">
			<a href="initEditBook.do?addrBookId=${book.addrBookId}">${book.bkCname}</a>
		</ec:column>
		<ec:column property="bkEname"/>
		<ec:column property="bkEmail" />
		<ec:column property="bkTelephone" />
		<ec:column property="bkQq" />
	</ec:row>
</ec:table>
</form>