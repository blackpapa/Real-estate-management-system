
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct"  uri="http://www.java.com/j2ee" %>
<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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

<html class="no-js">
<HEAD>
<title><tiles:getAsString name="title" /></title>
<link rel="Shortcut Icon" href="images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<META http-equiv=Content-Type content=text/html;charset=utf-8>
<META content="MSHTML 6.00.6000.16705" name=GENERATOR>

</HEAD>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ext/ext-theme-gray-all.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ext/example.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ext/ext-all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ext/ext-theme-gray.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/list_operation.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu_js/context-menu.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tree/context-menu.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect/demo.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ht_frame.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/artDialog/default.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/artDialog/jquery.artDialog.basic.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	//侧边菜单
	$("ul.menu_list li > div.menu_header").click(function()
	{
		var arrow = $(this).find("span.arrow");
		if(arrow.hasClass("up"))
		{
			arrow.removeClass("up");
			arrow.addClass("down");
		}
		else if(arrow.hasClass("down"))
		{
			arrow.removeClass("down");
			arrow.addClass("up");
		}

		$(this).parent().find("ul.submenu_list").slideToggle();
	});
	
	//侧边菜单高亮显示
    $("ul.submenu_list li").click(function(){ 
                       $("ul.submenu_list li").removeClass("current"); 
                       $(this).addClass("current"); 
     });
});

</script>
<body id="layout" class="easyui-layout" style="overflow:hidden">
	<div data-options="region:'north',border:false" style="height:100px;">
		  <div class="header">
		   <tiles:insertAttribute name="header" />
		  </div>
    </div>
     <div data-options="region:'west',split:true,title:'菜单栏'" style="width:225px; background:#FFF;">
			<tiles:insertAttribute name="navigation" />
	</div>
    <!--<div data-options="region:'west',split:true,title:'菜单栏'" style="width:220px; background: url(css/default/sidebar_bg.png) #CDDEE6 repeat-x;">
			<tiles:insertAttribute name="navigation" />
	</div>
--><%--

	<div data-options="region:'east',split:true,collapsed:true,title:'欢迎'" style="width:100px;padding:10px;">欢迎使用</div>
 --%>
	<div data-options="region:'south',border:false" style="">
       <div class="copyright"><tiles:insertAttribute name="footer" /></div>
    </div>
	<div data-options="region:'center',title:'	'">
	<div class="content">
		<div id="errorarea" class="demo-info" style="display:none">
			<div class="demo-tip icon-tip"></div>
			<div id="errormsg"></div>
		</div>
		<div id="workspace">
			<tiles:insertAttribute name="body" />
		</div>
	</div></div>
</body>
</html>
