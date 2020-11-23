package member;

import java.sql.Timestamp;

//하는일
//1. join.jsp페이지에서 입력한 회원정보들을  DB에 클래스 단위로 INSERT하기 위해
//   임시로 저장 해놓는 메모리 공간
//2. DB에 저장되어 있는 한사람의 회원정보를 검색하여 임시로 저장해 놓는 메모리 공간
public class MemberBean { //VO 역할을 하는 클래스 

	//멤버변수 -> jspbeginner데이터베이스의 member테이블의 컬럼이름,타입을 동일하게 해서 선언
	private String id;     //회원아이디
	private String passwd;	//회원비밀번호
	private String name;	//회원이름
	private Timestamp reg_date; //회원가입날짜
	private int age;			//회원나이
	private String gender;		//회원성별
	private String email;		//회원 이메일주소
	private String address;		//회원 주소
	private String tel;			//회원 전화번호
	private String mtel;		//회원 핸드폰번호 
	
	//getter , setter메소드 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	
	
	
}
