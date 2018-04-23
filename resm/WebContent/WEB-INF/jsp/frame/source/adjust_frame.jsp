<iframe width="100%" name="adjustFrame" border="0" frameborder="no" framespacing="0" height="100%" src="source.do?actionMethod=adjust">
</iframe>
<form name="saveForm" method="post" action="source.do?actionMethod=adjust">
<input type="hidden" name="saveString" id="saveString" value="">
<input type="hidden" name="baseStyle" id="baseStyle" value="01">
</form>
<script language="javascript">
<!--
function saveData(){
	document.saveForm.saveString.value = adjustFrame.treeObj.getNodeOrders();
	document.saveForm.submit();
}
//-->
</script>