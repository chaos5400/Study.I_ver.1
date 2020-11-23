<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<%
// 글 수정을 위한 글상세보기 화면

//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션값이 존재 하지 않으면 login.jsp로 가서 로그인하고 오세요
if(id == null){
	response.sendRedirect("../member/login.jsp");	
}

//content.jsp에서 답변쓰기 버튼을 클릭해서 전달 하여 넘어온 데이터 얻기
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num")); //답변글 작성시 부모글번호 전달받기
int re_ref = Integer.parseInt(request.getParameter("re_ref"));
int re_lev = Integer.parseInt(request.getParameter("re_lev"));
int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
%> 
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
	<h1>답글 작성 화면</h1>
	
<%--아래 디자인 화면에서  답글 내용을 입력후 reWritePro.jsp로 요청~ --%>	
<form action="reWritePro.jsp" method="post">
	
	<%--입력한 답글 추가 요청시 부모글 번호를 전달함. --%>
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="re_ref" value="<%=re_ref%>">
	<input type="hidden" name="re_lev" value="<%=re_lev%>" >
	<input type="hidden" name="re_seq" value="<%=re_seq%>">

	<table id="notice">
		<tr>
			<td>답글 작성자명</td>
			<td><input type="text" name="name">  </td>
		</tr>
		<tr>
			<td>답글 비밀번호</td>
			<td><input type="password" name="passwd">  </td>
		</tr>
		<tr>
			<td>답글제목</td>
			<td><input type="text" name="subject" value="[답글]"></td>
		</tr>
		<tr>
			<td>답글내용</td>
			<td>
				<textarea name="content" rows="13" cols="40"></textarea>
			</td>
		</tr>
	</table>
	<div id="table_search">
		<input type="submit" value="답글작성" class="btn">
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="목록보기" 
		       class="btn" onclick="location.href='notice.jsp'">
	</div>
</form>		
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>





