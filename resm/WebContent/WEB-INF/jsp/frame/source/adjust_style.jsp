<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title>adjust source position</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu_js/context-menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu_js/drag-drop-folder-tree.js">
	/************************************************************************************************************
	(C) www.dhtmlgoodies.com, July 2006
	
	Update log:
	
	
	This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.	
	
	Terms of use:
	You are free to use this script as long as the copyright message is kept intact.
	
	For more detailed license information, see http://www.dhtmlgoodies.com/index.html?page=termsOfUse 
	
	Thank you!
	
	www.dhtmlgoodies.com
	Alf Magne Kalleland
	
	************************************************************************************************************/	
	</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tree/drag-drop-folder-tree.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tree/context-menu.css" type="text/css"></link>
</head>
<body>
<br>
	<ul id="adjustSource" class="dhtmlgoodies_tree">
		<li id="node0" noDrag="true" noSiblings="true" noDelete="true" noRename="true"><a href="#">Root node</a>
			<ul>
			<c:forEach var="source" items="${adjustSourceList}">
			<c:out value="${source.treeNodeString}" escapeXml="false"/>
			</c:forEach>
			</ul>
		</li>
	</ul>
	<script type="text/javascript">	
	treeObj = new JSDragDropTree();
	treeObj.setTreeId('adjustSource');
	treeObj.setMaximumDepth(4);
	treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
	treeObj.initTree();
	treeObj.expandAll();
	</script>	
</body>
</html>