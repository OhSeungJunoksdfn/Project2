package com.sist.mapper;
import java.util.*; 

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface MemberMapper {

  @Insert("INSERT INTO projectMember(username,rname,password,"
		 +"sex,birthday,email,post,addr1,addr2,phone,content,enable) "
		 +"VALUES(#{username},#{name},#{password},"
		 +"#{sex},#{birthday},#{email},#{post},#{addr1},"
		 +"#{addr2},#{phone},#{content},1)")
  public void memberInsert(MemberVO vo);
  
  @Insert("INSERT INTO authority VALUES("
		 +"#{username},'ROLE_USER')")
  public void memberAuthorityInsert(String id);
  
  @Select("SELECT username,name,sex,email,phone,post,"
  		 +"addr1,addr2 "
		 +"FROM projectMember "
		 +"WHERE username=#{username}")
  public MemberVO memberSessionData(String userid);
  
}