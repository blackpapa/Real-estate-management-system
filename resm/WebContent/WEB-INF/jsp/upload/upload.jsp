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
<script language="javascript">
	var isSuccess = false;
	var isProcess = false;
	function submitStart() {
		if (isAbleSubmit()) {
			isProcess = true;
			$('#p').progressbar('setValue', 0);
			ajaxFunction();
			return true;
		} else {
			return false;
		}
	}
	function ajaxFunction() {
		if (!isProcess) {
			return;
		}
		$.ajax({
			method : "get",
			url : 'UploadProgressBarServlet?temp='+new Date().getTime(),
			dataType : 'text',
			success : function(data) {
				var jsonObj = jQuery.parseJSON(data);
				processStateChange(jsonObj);	
			}
		});
		startProcess();
	}
	function isAbleSubmit() {
		if (document.getElementById("fileName").value == '') {
			alert('请选择要导入的文件!');
			return false;
		}
		return true;
	}
	function startProcess() {
		isProcess = true;
		document.getElementById("mysubmit").disabled = true;
		document.getElementById("showContent").style.display = 'none';
	}
	function endProcess(status) {
		isProcess = false;
		document.getElementById("mysubmit").disabled = false;
		//truman_du add for 成功显示100%
		if(status=='true'){
			$('#p').progressbar('setValue', 100);
		}
		//
	}
	function processStateChange(jsonObj) {
		if (isProcess) {
			window.setTimeout("ajaxFunction();", 50);
		}
		if(jsonObj == null || jsonObj == "undefined"){
			return;
		}
		var isNotFinished = jsonObj.finished;
		var processName = jsonObj.process_name;
		if (processName != null && processName != 'null' && processName != '' && processName != 0) {
			processName += '执行进度';
			document.getElementById("status").innerHTML = processName;
		}
		var myPercent = jsonObj.percent_complete;
		// Check to see if it's even started yet
		if (isNotFinished == 0 && myPercent == 0) {
            return ;
		} else {
			document.getElementById("progressBarTable").style.visibility = "visible";
			document.getElementById("percentCompleteTable").style.visibility = "visible";
			if (myPercent != null && myPercent != 0) {
				document.getElementById("percentComplete").innerHTML = "";
				var value = $('#p').progressbar('getValue');
				if (value < 100) {
					value = myPercent;
					$('#p').progressbar('setValue', value);
				}
			}else{
				isProcess = false;
			}
		}
	}
</script>
<body>
<div id="uploadContent" style="width: 600px; height: 180px;">
<div class="title" class="dftxt">上传文件</div>
<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0"
	frameborder="0" scrolling="yes"></iframe>
<form id="myForm" enctype="multipart/form-data"
	action="upload.do?actionMethod=upload" target="uploadFrame"
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
			注意:必须是Excel文件.</font></td>
		</tr>
	</tbody>
</table>
<p />
</form>
<fieldset><legend id="status" class="dftxt"
	style="color: green">状态</legend>
<div class="space">&nbsp;</div>
<div id="progressBarTable"
	style="visibility: hidden; top: 160px; width: 100%">
<table width="90%" style="border: 1px;">
	<tr>
		<td>
		<div id="p" class="easyui-progressbar" style="width: 600px;"></div>
		</td>
	</tr>
</table>
<table width="90%" style="color: #555555">
	<tr>
		<td align="center" nowrap="nowrap"><span id="bytesRead"
			style="font-weight: bold;">&nbsp;</span></td>
	</tr>
</table>
</div>
<div id="percentCompleteTable" align="center"
	style="visibility: hidden; absolute; top: 10px; width: 100%">
	<span id="percentComplete"
					style="color: #555555 font-weight :   bold;">&nbsp;</span>
</div>
</fieldset>
</div>
<div id="showContent" style="display:none;overflow-y:auto; overflow-x:auto; width:600px; height:200px;">验证结果</div>
</body>
</html>