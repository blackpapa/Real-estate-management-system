<%@ page contentType="text/html;charset=UTF-8"  import="com.java.framework.entity.FwAccount,com.java.framework.entity.FwSource,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
 <div class="sidebar" id="sidebar">
    <ul id="side_menu">
      <li>
        
      <ul class="menu_list">
      	<c:set var="count" value = "0"/>
        
        <c:forEach var="sourceSecond" items="${LoginAccount.userMenuTreeSecond}">
              <c:if test="${sourceSecond.parent.id == temp}"> 
                	 <li>
                     <div class="menu_header"> <span class="label user_ico">${sourceSecond.name }</span> <span class="arrow up"></span> </div>
                        <ul class="submenu_list">
                           <c:forEach var="sourceThird" items="${LoginAccount.userMenuTreeThird}">
                             <c:if test="${sourceThird.parent.id == sourceSecond.id}">
                           <li>
                           <%-- <c:if test="${sourceThird.parent.id == 241 }">
                            <a href="${sourceThird.link }" >${sourceThird.title }</a>
                            <a href="#" onclick="getData('${sourceThird.link }','','workspace');">${sourceThird.title }</a>
                           </c:if>
                           <c:if test="${sourceThird.parent.id != 241 }">
                           	<a href="#" onclick="getData('${sourceThird.link }','','workspace');">${sourceThird.title }</a>
                           </c:if> --%>
                           <a href="#" onclick="getData('${sourceThird.link }','','workspace');">${sourceThird.title }</a>
                           </li>
                           <c:set var="count" value="${count+1}"/>
                             </c:if>
                           </c:forEach>
                        </ul>
                     </li>
              </c:if> 
        </c:forEach>
      </ul>
      <input type="hidden" id = "menucount" name="menucount" value="${count }" />
        
      </li>
    </ul>
  </div>

<script>
	 $(document).ready(function(){
		var menumLength = document.getElementById('menucount');
		if(menumLength.value <= 0){
			 $('#layout').layout('collapse','west');
		}
	}); 
	 
</script>