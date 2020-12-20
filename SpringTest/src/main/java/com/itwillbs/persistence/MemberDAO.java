package com.itwillbs.persistence;

import com.itwillbs.domain.MemberVO;

public interface MemberDAO {
	
	// 디비를 사용해서 현제 시간정보 출력
	public String getTime();
	
	// 회원 가입 처리 메서드 
	public void insertMember(MemberVO vo);
	
	// ID에 해당하는 회원정보 모두를 가져오는 메서드
	public MemberVO getMember(String id);
	
	// ID/PW를 사용해서 본인 회원 정보를 가져오는 메서드
	public MemberVO getMemberWithIdPw(String id,String pw);
	
	// 회원 정보 수정 처리 메서드
	public void updateMember(MemberVO vo);
	
	//회원 정보 삭제 처리 메서드(서비스로 처리결과를 리턴)
	public int deleteMember(MemberVO vo);

}
