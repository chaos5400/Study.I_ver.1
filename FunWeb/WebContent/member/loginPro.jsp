<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	//2. login.jsp로 부터 입력한 아이디 비밀번호 얻기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//3. DB작업을 위해
	//   MemberDAO.java의? 로그인 처리시 사용하는 메소드 
	//   userCheck(String id, String passwd) 추가하기
			 
	//4. MemberDAO의 userCheck(String id, String passwd)메소드 호출시..
	//입력한 아이디와 비밀번호를 전달하여  DB에 존재하는지 유무를 받아옴
	MemberDAO memberdao = new MemberDAO();
	
	//5. check = 1  -> 아이디 , 비밀번호 맞음
	//           0  -> 아이디 맞음, 비밀번호 틀림
	//           -1 -> 아이디 틀림
	int check = memberdao.userCheck(id, passwd);

	//6.DB에 저장되어 있는 아이디,비밀번호 == 사용자가 입력한 아이디 , 비밀번호 
	if(check == 1){
		//로그인 처리 해야 하므로
		//로그인이 되었다 라는 판단값을 session내장객체 메모리에 저장후  index.jsp로 포워딩함.
		session.setAttribute("id", id);
		//index.jsp로 이동
		response.sendRedirect("../index.jsp");
	}else if(check == 0){
%>
		<script type="text/javascript">
			window.alert("비밀번호 틀림");
			//이전 페이지(login.jsp)로 이동
			history.back();
		</script>	
<%		
	}else{ // check == -1   아이디 틀림 
%>
	   <script>
	   		window.alert("아이디없음");
	   		//이전 페이지(login.jsp)로 이동
			history.go(-1);
	   </script>
<%			
	}
%>







