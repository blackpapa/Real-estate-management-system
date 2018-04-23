<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form id="ec"  action="queryNote.do"  method="post" >
<ec:table items="DATA_LIST" var="note"
	action="queryNote.do"
	title="SysNote List" width="100%"
	retrieveRowsCallback="limit"
	filterRowsCallback="limit"
	sortRowsCallback="limit">
	<ec:exportXls fileName="output.xls" tooltip="Export Excel"/>
	<ec:exportCsv fileName="output.txt" tooltip="Export CSV" delimiter=","/>
	<ec:row>
		<ec:column property="noteId" sortable="false" viewsAllowed="html" filterable="false" headerCell="selectAll">
			<input type="checkbox" name="noteId" value="${note.noteId}" />
		</ec:column>
		<ec:column property="NoteTitle">
			<a href="initEditNote.do?noteId=${note.noteId}">${note.noteTitle}</a>
		</ec:column>
		<ec:column property="Author">
		${note.fwAccount.acctName}
		</ec:column>
		<ec:column property="NoteGroup">
		${note.creatorGroup.groupName}
		</ec:column>
	</ec:row>
</ec:table>
</form>