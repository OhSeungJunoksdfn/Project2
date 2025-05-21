package com.sist.service;
import java.util.*; 
import com.sist.vo.*;
import com.sist.vo.board.BoardVO;
public interface MemberService {
	public int memberCheckData(String id);
	public void memberInsert(MemberVO vo);
	public MemberVO memberSessionData(String id);
	public String findIdData(String email);
	public int checkMember(MemberVO vo);
	public void pwdUpdate(MemberVO vo);
	public MemberVO memberDetailData(String id);
	public int myBoardTotalPage(Map map);
	public List<BoardVO> myBoardListData(Map map);
	 public void memberDelete(String id);
	 public void memberUpdate(MemberVO vo);
}
