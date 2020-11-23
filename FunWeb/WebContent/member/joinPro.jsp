<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. join.jsp에서 입력한 회원내용중 한글이 존재하면
	//   request객체 메모리에서 꺼내올때 한글이 깨지므로
	//   인코딩 방식을 UTF-8로 설정 하여 요청값을 얻을때 한글이 깨지지 않도록 방지 
	request.setCharacterEncoding("UTF-8");

	//2. 요청한 값 얻기 (join.jsp에서 입력한 회원정보를 request영역에서 꺼내오기)
	//입력한 ID얻기
	String id = request.getParameter("id");
	//입력한 비밀번호 얻기
	String passwd = request.getParameter("passwd");
	//입력한 이름 얻기
	String name = request.getParameter("name");
	//입력한 이메일주소 얻기
	String email = request.getParameter("email");
	//입력한 주소 얻기 
	String address = request.getParameter("address");
	//입력한 전화번호 얻기
	String tel =  request.getParameter("tel");
	//입력한 폰번호 얻기 
	String mtel = request.getParameter("mtel");
	//입력한 나이 얻기
	String newage = request.getParameter("age");
	int age  = Integer.parseInt(newage);//정수로 변환후 저장
	//입력한 성별 얻기
	String gender = request.getParameter("gender");
	

	//3. 입력한 회원정보들을? MemberBean객체를 생성해서 각각의 변수에 저장
	MemberBean memberBean = new MemberBean();
	
	// setter메소드들을 호출하여  입력한 정보를 매개변수로 전달하여 MemberBean의 각변수에 저장
	memberBean.setId(id); //setter메소드를 호출하여 입력한 아이디를 MemberBean의 id변수에 저장
	memberBean.setPasswd(passwd);
	memberBean.setName(name);//입력한 이름을 MemberBean의  name변수에 저장
	memberBean.setEmail(email);
	memberBean.setAddress(address);//입력한 주소를 MemberBean의  address변수에 저장
	memberBean.setTel(tel);//입력한 전화번호를? MemberBean의 tel변수에 저장
	memberBean.setMtel(mtel);//입력한 핸드폰번호를? MemberBean의 mtel변수에 저장
	memberBean.setAge(age);//입력한 나이를?MemberBean의 age변수에 저장
	memberBean.setGender(gender);//입력한 성별을 ? MemberBean의  gender변수에 저장		
			
			
	//4. DB와 연동하여  입력한 회원정보를 DB의 테이블에 추가 시키는 역할을 하는 DAO객체 생성 후 메소드 호출하여
	//   insert작업을 명령 해야 함.
	MemberDAO memberDAO = new MemberDAO();
			  memberDAO.insertMember(memberBean); //메소드 호출시 위의 MemerBean객체 전달 
	
	//5. 회원가입에 성공 하면  login.jsp를 재요청(포워딩)하여 보여 주기 
	response.sendRedirect("login.jsp");
	
%>






