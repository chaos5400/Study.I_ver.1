<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	//session내장객체 메모리에 접근하여
    	//session내장객체 메모리에 저장되어 있는 값들을 모두 제거 
    	session.invalidate();
   	
    	//index.jsp로 재요청(포워딩)
// 		response.sendRedirect("../index.jsp"); 
    %>
    <script>
    	 alert("로그아웃");
    	 //자바스크립트의 재요청(포워딩)
    	location.href = "../index.jsp";
//     	location.href("../index.jsp");
    </script>