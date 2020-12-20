<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>WEB-INF/views/member/memberList.jsp</h1>
   
   <%
     //세션 아이디 처리
     String id = (String)session.getAttribute("userid");
   
     if(id==null || !id.equals("admin")){
    	 response.sendRedirect("/member/login");
     }
   %>
   
   
   <!-- 전달받은 회원 목록을 출력 (JSTL-반복문)   -->
   
   <table border="1">
     <tr>
       <td>아이디</td>
       <td>비밀번호</td>
       <td>이름</td>
       <td>이메일</td>
       <td>가입일</td>
       <td>정보수정일</td>
     </tr>
     
     <c:forEach var="member" items="${memberList }">
	     <tr>
	       <td>${member.userid }</td>
	       <td>${member.userpw }</td>
	       <td>${member.username }</td>
	       <td>${member.email }</td>
	       <td>${member.regdate }</td>
	       <td>${member.updatedate }</td>
	     </tr>
     </c:forEach>
   </table>
   
   <a href="/member/main"> main 페이지로 </a>
   
   
   
   
   
   
   
   
   
   
   

</body>
</html>