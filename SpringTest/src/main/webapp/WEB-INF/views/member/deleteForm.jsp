<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WEB-INF/views/member/deleteForm.jsp</h1>
   
   <h1> 회원 탈퇴 </h1>
   <%
      String id = (String)session.getAttribute("userid");
      
	   if(id == null){
		  response.sendRedirect("/member/login"); 
		 
		  // 프로젝트 주소가 있을때
		  //response.sendRedirect(request.getContextPath()
		  // 	  +"/member/login"); 
	   }
   
   %>
   <!-- 
      1) 세션값 체크
      2) 비밀번호를 입력  / 아이디값을 숨겨서 이동
      3) /member/delete post  삭제
    -->
    
    <fieldset>
      <form action="/member/delete" method="post">
        <input type="hidden" name="userid" value="<%=id%>">
                비밀번호 : <input type="password" name="userpw"> <br>
        <input type="submit" value="탈퇴하기">
      </form>    
    </fieldset>
   
   
   
   
   
   
   
   
   
   

</body>
</html>