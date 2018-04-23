<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<c:set var="bottom" value="36" />
<c:if test="${DATA_LIST!=null}">
<c:set var="bottom" value="0" />
</c:if>
<c:set var="border_top" value="54" />
<!-- if happened error  -->
<c:if test="false">
	<c:set var="isError" value="true" />
	<c:set var="border_top" value="93" />
</c:if>

<html>
<HEAD>
<title><tiles:getAsString name="title" /></title>
<link rel="Shortcut Icon" href="images/favicon.ico">
<META http-equiv=Content-Type content=text/html;charset=utf-8>
<META content="MSHTML 6.00.6000.16705" name=GENERATOR>
</HEAD>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/list_operation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu_js/context-menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu_js/drag-drop-folder-tree.js">	</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tree/drag-drop-folder-tree.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tree/context-menu.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect/demo.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ht_frame.js"></script>

<STYLE type="text/css">
.inner,
#ly_innerFooter{
	border-color:#B7D8ED;
}
#ly_xbar{
	/**background-color: #D2EAF6*/
}
#ly_sortList li a{
	color:#0958FF
}
#ly_sortList li a:hover{
	color:#670FF9;
	background-color: #efefef;
}
*{	padding:0; margin:0; }
html {height:100%; max-height:100%; background:#fff; font-size:12px; }

body {height:100%; line-height: 1.6em; max-height:100%;overflow: hidden;}
h3{	font-size: 14px;}
img{
	border-style:none;
}

#ly_footer {position:absolute;bottom:0; left:0; display:block; width:100%; height:60px; z-index: 21;}
#ly_innerFooter{	margin:12px 15px;padding:8px;border-width:1px;border-style: solid;}
#ly_sortList,
#ly_selector {position:absolute;left:15px;width:180px;}
#ly_tools,#ly_status,#ly_gird,
#ly_pages {position:absolute;left: 200px;	right: 15px;}
#ly_xbar{position: absolute; top:15px; bottom: 60px; left: 195px;width:5px; cursor: e-resize;}
#ly_sortList{top:15px;height:46px;z-index: 19;}
#ly_sortList li{}
#ly_selector{top:15px; bottom:68px;  z-index: 16;}
#ly_tools{top:15px;	z-index: 15;}

<c:if test="${isError}">
#ly_status{top:54px;	z-index: 14;}
#ly_gird{top:93px;	bottom: 120px;	z-index: 9;}
</c:if>
<c:if test="${isError}">
gird{top:54px;	bottom: 120px;	z-index: 9;}
</c:if>
#ly_pages{bottom: 60px;z-index: 12;}
#ly_selector .inner{	height: 100%;}
#ly_status .inner,
#ly_tools .inner,
#ly_pages .inner{line-height:24px;	height:24px;}
#ly_gird .inner{height: 100%;overflow: auto;}
.inner{border-width:1px;border-style: solid;padding:3px;background-color:#fff;overflow:auto;}
#ly_sortList .inner{	padding: 0px;}
* html #ly_sortList .inner{height:48px}
#ly_sortList li{
	float: left;
	width: 100%;
}
#ly_sortList li a{
	line-height: 20px;
	display: block;
	padding:3px 0 0px 25px;
	text-decoration: none;
	font-weight: bold;
	font-size: 14px;
}
.folder a{ background: url(../images/folder.gif) no-repeat 5px 3px;  }
.tags a{ background: url(../images/tags.gif) no-repeat 5px 3px;  }

#ly_pages{
	text-align: right;
}

* html #ly_selector{height:100%; top:0; bottom:0; border-top:68px solid #fff; border-bottom:60px solid #fff;}
* html #ly_gird{height:100%; top:0; bottom:0; border-top:${border_top}px solid #fff; border-bottom:${96 - bottom}px solid #fff;}
* html #ly_xbar{height:100%; top:0; bottom:0; border-top:15px solid #fff; border-bottom:60px solid #fff;}
* html #ly_tools .inner,
* html #ly_status .inner,
* html #ly_pages .inner{height:34px}
</STYLE>
<BODY>

<DIV id=ly_sortList>
<DIV class=inner align="center" >
J2EE Framework
</DIV>
</DIV>

<DIV id=ly_selector>
<DIV class=inner>
<tiles:insertAttribute name="navigation" />
</DIV>
</DIV>

<DIV id=ly_xbar></DIV>

<DIV id=ly_tools>
<DIV class=inner>
<%=com.java.framework.action.OperationButton.general(request.getContextPath())%>
</DIV>
</DIV>
<c:if test="${isError}">
<DIV id=ly_status>
<DIV class=inner>
<font color=red>
<c:out value="${errorInformation}"></c:out>
</font>
</DIV></DIV>
</c:if>
<DIV id=ly_gird>
<DIV class=inner id="mainAreal">
<tiles:insertAttribute name="body" />
</DIV>
</DIV>
<c:if test="${pageBean!=null}">
<DIV id=ly_pages>
<DIV class=inner>
<ct:cutPage pageBean="${pageBean}" formName="ec" offerPageSize="18,50,100" isExistForm="true" isOuterForm="true"/>
</DIV></DIV>
</c:if>
<DIV id=ly_footer>
<DIV id=ly_innerFooter>
<P id=copyright align="center"><tiles:insertAttribute name="footer" /></P>
</DIV>
</DIV>
<script type="text/javascript">
	treeObj = new JSDragDropTree();
	treeObj.setTreeId('menuList');
	treeObj.setMaximumDepth(7);
	treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
	treeObj.initTree();
	treeObj.expandAll();
</script>
</BODY>

</html>
