<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>

<%
	//session내장객체 메모리영역에 접근하여 세션값얻기
	String id = (String)session.getAttribute("id");

	if(id == null){//session내장객체 메모리 영역에 세션값이 저장되어 있지 않다면
	//로그인 되지 않은 화면
%>		
	<div id="login">
		<a href="../member/login.jsp">login</a> | 
		<a href="../member/join.jsp">join</a>
	</div>
<%		
	}else{//session내장객체 메모리 영역에 세션값이 서장되어 있다면
%>		
	<%--로그인 된 화면 --%>
	<div id="login">
		<%=id %>님 로그인중...
		<a href="../member/logout.jsp">logout</a> 
	</div>
<%		
	}
%>
		
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../index.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>