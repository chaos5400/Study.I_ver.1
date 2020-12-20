<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WEB-INF/views/member/update.jsp</h1>
   
   <h1>회원 정보 수정</h1>
   <%
     // 세션 데이터 처리
     String id = (String) session.getAttribute("userid");
   
     if(id == null){
    	 response.sendRedirect("/member/login");
     }
   %>
   
   <fieldset>
     <legend>회원 수정</legend>
     <form action="/member/update" method="post">
	      아이디 : <input type="text" name="userid" value="${memberVO.userid }" readonly><br>
	      비밀번호 : <input type="password" name="userpw"><br>
	      이름 : <input type="text" name="username" value="${memberVO.username }"><br>
	      이메일 : <input type="text" name="email" value="${memberVO.email }"><br>
       <input type="submit" value="회원수정">
     </form>     
   </fieldset>
   
   
   
   
   
   
   
   
</body>
</html>