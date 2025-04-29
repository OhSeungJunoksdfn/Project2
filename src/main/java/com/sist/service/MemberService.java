package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface MemberService {
	public int memberCheckData(String id);
	public void memberInsert(MemberVO vo);
	public MemberVO memberSessionData(String id);
}
