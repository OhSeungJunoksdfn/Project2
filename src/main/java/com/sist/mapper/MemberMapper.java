package com.sist.mapper;
import java.util.*; 

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface MemberMapper {

//  회원가입
  @Insert("INSERT INTO projectmember(id,fname,sname,pwd,sex,birthday,email,post,addr1,addr2,phone,name) "
  		+ "VALUES(#{id},#{fname},#{sname},#{pwd},#{sex},#{birthday},#{email},#{post},#{addr1},#{addr2},#{phone},#{name})")
  public void memberInsert(MemberVO vo);

  @Insert("INSERT INTO authority VALUES("
		 +"#{id},'ROLE_USER')")
  public void memberAuthorityInsert(String id);
  
  @Select("SELECT id,fname,sname,sex,email,phone,post,"
  		 +"addr1,addr2 "
		 +"FROM projectMember "
		 +"WHERE id=#{id}")
  public MemberVO memberSessionData(String id);
  
//아이디 확인
  @Select("SELECT COUNT(*) FROM projectMember WHERE id=#{id}")
  public int memberCheckData(String id);

}