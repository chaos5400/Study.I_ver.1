<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	//reWrite.jsp에서 입력한 답글 내용들중 한글이 존재하면 
	//우리가 request영역에서 데이터를 얻어올떄 한글이 깨진 채로 얻어 오므로
	//1.한글처리
	request.setCharacterEncoding("UTF-8");

	//2. reWrite.jsp에서 입력한 답글 내용들을 request내장객체 영역에서 얻어오기
	int num = Integer.parseInt(request.getParameter("num")); //답변글 작성시 부모글번호 전달받기
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
		
	//3.BoardBean객체를 생성하여 각변수에  입력한 답글 내용들을 각각 저장
	BoardBean bBean  = new BoardBean();
	bBean.setNum(num);
	bBean.setRe_ref(re_ref);
	bBean.setRe_lev(re_lev);
	bBean.setRe_seq(re_seq);
	bBean.setName(name);
	bBean.setPasswd(passwd);
	bBean.setSubject(subject);
	bBean.setContent(content);
	//4.추가로 답글을 작성한 사람의 IP주소, 답글을 작성한 날짜정보를 BoardBean객체의 각변수에 저장
	bBean.setIp(request.getRemoteAddr());
	bBean.setDate(new Timestamp(System.currentTimeMillis()));
	
	
	//5.입력한 답글내용을 DB에서 전송하여 INSERT추가 하기 위해 
	//BoardDAO객체 생성후  reInsertBoard(BoardBean bBean)메소드 호출시..
	//인자로 BoardBean객체를 전달함.
	BoardDAO bdao = new BoardDAO();
	bdao.reInsertBoard(bBean); 
	
	//6.DB에 답글 추가에 성공하면  notice.jsp를 재요청해 이동~
    response.sendRedirect("notice.jsp");

%>



