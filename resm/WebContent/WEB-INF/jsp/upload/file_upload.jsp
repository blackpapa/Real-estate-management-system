<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>测试导入</title>
<link rel="stylesheet" type="text/css" href="css/effect/easyui.css">
<link rel="stylesheet" type="text/css" href="css/effect/icon.css">
<link rel="stylesheet" type="text/css" href="css/effect/demo.css">
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body>
<div id="uploadContent" style="width: 600px; height: 180px;">
<div class="title" class="dftxt">上传文件</div>
<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0"
	frameborder="0" scrolling="yes"></iframe>
<form id="myForm" enctype="multipart/form-data"
	action="upload.do?actionMethod=uploadFile" target="uploadFrame"
	method="post" onsubmit="submitStart();">
<c:forEach  items="${params}" varStatus = "s">
    <input type="hidden" name="${s.current.key }" value="${s.current.value}">
</c:forEach>
<table border="0" width="100%" style="padding: 0px; margin: 0px">
	<tbody>
		<tr>
			<td width="90" style="width: 7em; text-align: right" class="dftxt">选择文件路径</td>
			<td><input type="hidden" name="from" value="${from}"> <input
				type="file" name="fileName" id="fileName" title="请选择上传文件" />&nbsp;<input
				type="submit" name="mysubmit" id="mysubmit" class="button"
				title="Upload file now." value=" 上   传  "></td>
		</tr>
		<tr>
			<td colspan="2"><font color="red" class="dftxt">
			注意:文件大小不能超过30M.</font></td>
		</tr>
	</tbody>
</table>
<p />
</form>
</body>
</html>