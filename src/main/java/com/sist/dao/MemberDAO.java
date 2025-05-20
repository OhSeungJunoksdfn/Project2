package com.sist.dao;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class MemberDAO {
  @Autowired
  private MemberMapper mapper;
  
  public void memberInsert(MemberVO vo)
  {
	  mapper.memberInsert(vo);
	  mapper.memberAuthorityInsert(vo.getId());
  }
 
  public MemberVO memberSessionData(String id)
  {
	  return mapper.memberSessionData(id);
  }
  
  public int memberCheckData(String id)
  {
	 return mapper.memberCheckData(id);
	  
  }
  public String findIdData(String email)
  {
	  return mapper.findIdData(email);
  }
  public int checkEmail(String email)
  {
	  return mapper.checkEmail(email);
  }
  public int checkMember(MemberVO vo)
  {
	  return mapper.checkMember(vo);
  }
  public void pwdUpdate(MemberVO vo)
  {
	  mapper.pwdUpdate(vo);
  }
}