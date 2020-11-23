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
	BoardDAO boardDAO = new BoardDAO();

	//DB에 저장되어 있는 전체 글의 개수를 조회 하기 위해 
	//BoardDAO의 getBoardCount()메소드를 호출함
	int count = boardDAO.getBoardCount();
	//System.out.println(count);
	
	//하나의 페이지 마다 보여줄 글개수 5
	int pageSize = 5;
		
	//아래의쪽의 클릭한 페이지번호 얻기
	String pageNum = request.getParameter("pageNum");
	
	//아래쪽에 클릭한 페이지번호가 존재하지 않으면(현재 선택한 페이지번호가 없으면)
	//1페이지 가 화면에 보여야 하기 떄문에..
	//pageNum을 1로 저장
	if(pageNum == null){
		pageNum = "1";
	}
	
	//현재 보여질(선택한)페이지번호  "1"을  -> 기본정수 1로 변경
	int currentPage = Integer.parseInt(pageNum);
	
	//각페이지 마다 첫번째로 보여질 시작 글번호 구하기
	//(현재 보여질 페이지번호  - 1) * 한페이지당 보여줄 글개수 5
	int startRow = (currentPage - 1) * pageSize;
	
	//board테이블에 존재하는 모든 글을 조회하여 저장할 용도의 ArrayList배열객체를 담을 변수 선언
	List<BoardBean> list = null;
	
	//만약 board테이블에 글이 있다면
	if(count > 0){
		//board테이블에 존재하는 글을 검색해서 가져옴
		//				getBoardList(시작글번호,한페이지당보여줄글수)
		list = boardDAO.getBoardList(startRow,pageSize);
		System.out.println(list.size());   
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
<article>
<h1>Notice[전체글개수 : <%=count%>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%
//만약 게시판 글개수가 조회 된다면(게시판에 글이 저장 되어 있다면)
if(count > 0){
	//ArryList에 저장되어 있는 검색한 글정보들(BoardBean객체들)의 갯수 만큼 반복하는데..
	for(int i=0; i<list.size(); i++){
		//ArrayList의 각인덱스 위치에 저장 되어 있는 BoardBean객체를 ArrayList배열로부터 얻어
		//BoardBean객체의 각변수값들을getter메소드를 통해 얻어 ~ 출력~
		BoardBean bean = list.get(i);
%>
	<tr onclick="location.href='content.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'">
		<td><%=bean.getNum()%></td>
		<td class="left">
		<%
			int wid = 0; //답변글에 대한 들여쓰기 값 저장
			
			//답변글에 대한 들여쓰기 값이 0보다 크므로
			//답변글이라면? 
			if(bean.getRe_lev() > 0){
				//들여쓰기 값 처리
				wid = bean.getRe_lev() * 10;	
		%>	
		<img src="../images/center/level.gif" width="<%=wid%>" height="15">
		<img src="../images/center/re.gif">
		<%} %>
		
		<%=bean.getSubject()%>
		</td>
		<td><%=bean.getName()%></td>
		<td><%=new SimpleDateFormat("yyyy.MM.dd").format(bean.getDate())%></td>
		<td><%=bean.getReadcount()%></td>
	</tr>
<%		
	}
}else{//게시판에 글이 저장되어 있지 않다면
%>
	<tr>
		<td colspan="5">게시판 글 없음</td>
	</tr>
<%	
}
%>
</table>

<%
//각각페이지에서 로그인후 현재 페이지로 이동해 올때  session내장객체 메모리에 값이 존재하는지
//존재하지 않는디 판단하여 아래의 search버튼만 보이게 하거나 search버튼과 글쓰기버튼을 모두 보이게 처리 하기

String id = (String)session.getAttribute("id");

//session영역에 값이 저장되어 있으면  글쓰기 버튼 보이게 설정
if(id != null){
%>	
<div id="table_search">
	<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'"/>
</div>
<%}%>

<div id="table_search">
	<input type="text" name="search" class="input_box">
	<input type="button" value="검색" class="btn">
</div>



<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a>
</div>
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





