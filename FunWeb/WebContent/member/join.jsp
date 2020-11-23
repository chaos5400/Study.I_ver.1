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
 
 	<script type="text/javascript">
 		//아래의 화면에서  가입할 회원의 아이디를 입력하고
 		//아이디중복체크 버튼을 클릭했을때..
 		//1. 아이디를 입력 했는지 판단
 		//2. DB와 연동하여 입력 한 아이디가 DB에 존재 하는지 판단 
 		function winopen(){
 			
 			//아이디를 입력 하지 않았다면?
 			if(document.fr.id.value == ""){
 				window.alert("아이디를 입력하세요!");
 				//아이디 입력 <input>태그에 포커스 주기
 				document.fr.id.focus();
 				return;
 			}					
 			//아이디를 입력 했다면~ 
 			//입력한  아이디를 얻어 변수에 저장	
 			var fid = document.fr.id.value;
 			//새로운 팝업창을 띄우면서 입력한 아이디를 전송함.
 			window.open("join_IDcheck.jsp?userid="+fid,"","width=400,height=200");			
 		}
 		
 		
 	</script>
 
</head>
<body>
<div id="wrap">
<!-- 헤더영역들어가는곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더영역들어가는곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
	<h1>Join Us</h1>
	
	<%--회원가입을 위해  아래의 디자인에서 가입할 회원정보를 입력받고  회원가입버튼을 클릭했을때..
		joinPro.jsp서버페이지로 회원가입 요청을 한다.
	 --%>
	<form action="joinPro.jsp" id="join"  method="post" name="fr" >
		<fieldset>
			<legend>Basic Info</legend>
			<label>User ID</label>
			<input type="text" name="id" class="id" >
			<input type="button" id="" value="아이디중복체크" class="dup" onclick="winopen();"/><br>
			<label>Password</label>
			<input type="password" name="passwd"><br>
			<label>Retype Password</label>
			<input type="password" name="passwd2"><br>
			<label>Name</label>
			<input type="text" name="name"><br>
			<label>Age</label>
			<input type="text" name="age"><br>
			<label>Gender</label>
			<input type="radio" name="gender" value="남자" checked="checked">남자
			<input type="radio" name="gender" value="여자">여자
			<br><br>
			<label>E-Mail</label>
			<input type="email" name="email"><br>
			<label>Retype E-Mail</label>
			<input type="email" name="email2"><br>
		</fieldset>
		
		<fieldset>
			<legend>Optional</legend>
			<label>Address</label>
			<input type="text" name="address"><br>
			<label>Phone Number</label>
			<input type="text" name="tel"><br>
			<label>Mobile Phone Number</label>
			<input type="text" name="mtel"><br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons">
		<input type="submit" value="회원가입" class="submit">
		<input type="reset" value="다시입력" class="cancel">
		</div>
	</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>



