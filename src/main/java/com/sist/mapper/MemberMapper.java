package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface MemberMapper {

//  회원가입
  @Insert("INSERT INTO projectmember(id,fname,sname,pwd,sex,birthday,email,post,addr1,addr2,phone,name) "
  		+ "VALUES(#{id},#{fname},#{sname},#{pwd},#{sex},#{birthday},#{email},#{post},#{addr1},#{addr2},#{phone},#{name})")
  public void memberInsert(MemberVO vo);

  @Insert("INSERT INTO authority VALUES("
		 +"#{id},'ROLE_USER')")
  public void memberAuthorityInsert(String id);
  
  @Select("SELECT id,fname,sname,name,sex,email,phone,post,"
  		 +"addr1,addr2 "
		 +"FROM projectMember "
		 +"WHERE id=#{id}")
  public MemberVO memberSessionData(String id);
  
//아이디 확인
  @Select("SELECT COUNT(*) FROM projectMember WHERE id=#{id}")
  public int memberCheckData(String id);

  
  @Select("SELECT COUNT(*) FROM projectMember WHERE email=#{email}")
  public int checkEmail(String email);
  
  @Select("SELECT SUBSTR(id, 1, LENGTH(id) - 2) || '**' AS id FROM projectmember WHERE email = #{email}")
  public String findIdData(String email);
  
  @Select("SELECT COUNT(*) FROM projectmember "
  		+ "WHERE id=#{id} AND phone=#{phone}")
  public int checkMember(MemberVO vo);
  
  @Update("UPDATE projectmember SET "
  		+ "pwd=#{pwd} "
  		+ "WHERE id=#{id}")
  public void pwdUpdate(MemberVO vo);
  
  @Select("SELECT * FROM projectmember WHERE id=#{id}")
  public MemberVO memberDetailData(String id);
  
  @Update("UPDATE projectmember SET "
  		+ "content=#{content},post=#{post},addr1=#{addr1},addr2=#{addr2} "
  		+ "WHERE id=#{id}")
  public void memberUpdate(MemberVO vo);
  
  @Delete("DELETE FROM projectmember "
  		+ "WHERE id=#{id}")
  public void memberDelete(String id);
  @Delete("DELETE FROM AUTHORITY "
  		+ "WHERE id=#{id}")
  public void authorityDelete(String id);
}