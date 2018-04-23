<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type='text/javascript' src='js/jquery-1.4.4.min.js'></script>
<%=(new java.util.Date())%>
<input type="button" name="b1" value="getServerData" onclick="getServerData()">
<script type='text/javascript'>
function getServerData(id,startDate,endDate){
	var queryString = "id=1";
	$.getJSON('ajaxController.do?actionMethod=getData', queryString,
            function(data){
				alert('获取数据为：success='+data.success);
              });

}
</script>