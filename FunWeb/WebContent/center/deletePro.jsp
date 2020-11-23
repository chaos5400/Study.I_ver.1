<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deletePro.jsp</h1>
<%
//한글 인코딩 방식 UTF-8설정
request.setCharacterEncoding("UTF-8");
	
//delete.jsp(글을삭제하기 위해 비밀번호를 입력하는화면)에서 
//입려한 삭제할 글번호, 페이지넘버, 비밀번호 얻기
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String passwd = request.getParameter("passwd");

//삭제할 글번호,입력한 비밀번호를 BoardDAO객체의 deleteBoard메소드 호출시 인수로 전달하여 삭제작업함
//글삭제에 성공하면  deleteBoard메소드로 부터 1을 반환 받고, 삭제에 실패하면 0을 반환받는다.
BoardDAO bdao = new BoardDAO();
int check = bdao.deleteBoard(num,passwd);
 
//check == 1  "삭제성공" 메세지창을 띄워주고 , notice.jsp 재요청해서 이동	
if(check == 1){
%>	
	<script type="text/javascript">
		alert("삭제성공");
		location.href="notice.jsp?pageNum=<%=pageNum%>";
	</script>
<%	
}else{//check == 0  "비밀번호 틀림" 메세지창을 띄워주고, delete.jsp(비밀번호입력화면)로 이동

%>	
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
<%			

}
%>
	




</body>
</html>
