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

//content.jsp에서 글수정버튼을 클릭했을때 전달받는 num, pageNum -> request영역에서 꺼내오기
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num")); //수정할 글번호
String pageNum = request.getParameter("pageNum"); //수정할 글번호가 속해 있는 페이지번호 

//글을 수정하기 전에 하나의 글정보를 검색해서 가져오기
BoardDAO dao  = new BoardDAO();
BoardBean boardBean = dao.getBoard(num);

//검색한 하나의 글정보를 얻자
int DBnum = boardBean.getNum();//글번호
String DBName = boardBean.getName(); //글작성자
String DBSubject = boardBean.getSubject();//글제목
String DBContent = ""; //글내용을 저장할 변수

if(boardBean.getContent() != null){//검색한 글내용이 있을떄
	//검색한 글내용을 얻어 엔터키 처리후 저장
	DBContent = boardBean.getContent().replace("\r\n","<br>");
}
	
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
<%--글을 수정하기 전에 글번호를 이용하여 DB에 저장된 하나의 글을 조회하여 아래의 디자인에 출력 해주고
	출력된 글을 사용자가 입력하여 글을 수정 한다.
  --%>
<article>
	<h1>글을 수정할수 있는 화면</h1>

<%--수정할 글내용을 다시 입력후  글수정버튼 클릭했을때 updatePro.jsp로 글수정 요청을 함 --%>	
<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
	
	<%--수정할 글번호 전달 --%>
	<input type="hidden" name="num" value="<%=num%>">

	<table id="notice">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=DBName%>">  </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd">  </td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="subject" value="<%=DBSubject %>"></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td>
				<textarea name="content" rows="13" cols="40"><%=DBContent %></textarea>
			</td>
		</tr>
	</table>
	<div id="table_search">
		<input type="submit" value="글수정" class="btn">
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="목록보기" class="btn" onclick="">
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





