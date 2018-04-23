<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<div class="logo"></div>
<div class="subnav">
	您好！${LoginAccount.userName}&nbsp;|&nbsp; 今天是<span class="time"><script type="text/javascript">time()</script></span> ， 祝您工作愉快！
	<em class="separator">|</em><a href="changePwd.do?actionMethod=init" > 密码修改</a>
	<em class="separator">|</em><a href="Logout">退出登录</a>
</div>-->
<form  method="post" id="menuParameter">
<div class="topNav">
	<div class="cmsLogo"><img src="images/logo1.jpg" alt=""  title=""/></div>
    <div class="cmsNav">
        <ul>
            <li><a href="javascript:;" title=""><img src="images/1.gif" alt="" title=""/><span>用户：<c:out value="${LoginAccount.userName}" /></span></a></li>
            <li><a href="changePwd.do?actionMethod=init" title=""><img src="images/2.gif" alt="" title=""/><span>修改密码</span></a></li>
            <li><a href="Logout" title=""><img src="images/3.gif" alt="" title=""/><span>注销</span></a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="mainNav">
    <div class="middleNav">
    	<ul> 
    		<!-- <li><a target="_blank" href="#">首页</a></li>  
    		 <li><a target="_blank" href="#">订单管理</a></li>  
    		 <li><a target="_blank" href="#">分货管理</a></li>  
    		 <li><a target="_blank" href="#">流程审批</a></li>  
    		 <li><a target="_blank" href="#">信息管理</a></li>  --> 
    		 <c:forEach var="sourceFirst" items="${LoginAccount.userMenuTreeFirst}">
              <li><a href="#" onclick="menuParameter(${sourceFirst.id})">${sourceFirst.name }</a></li>
           </c:forEach>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear"></div>
</div>
</form>
<script type="text/javascript">
function menuParameter(temp){
	document.forms.menuParameter.action = "login.do?actionMethod=setMenuParameter&temp="+temp;
	document.forms.menuParameter.submit();
}

$(document).ready(function(){
	$(".middleNav li a").click(function(){
		$(this).addClass("current").parents().siblings().find("a").removeClass("current");
	});
});
</script>