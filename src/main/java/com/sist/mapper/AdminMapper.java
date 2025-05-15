package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.admin.*;
public interface AdminMapper {
	@Select("SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+ "FROM (SELECT no,subject,content,regdate, rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(notice notice_no_pk) */ no,subject,content,regdate "
			+ "FROM notice)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/10) FROM notice")
	public int noticeTotalPage();
	
	@Select("SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday FROM notice "
			+ "WHERE no=#{no}")
	public NoticeVO noticeDetailData(int no);
	
	@Insert("INSERT INTO notice(no,subject,content) "
			+ "VALUES(notice_no_seq.nextval,#{subject},#{content})")
	public void noticeInsert(NoticeVO vo);
	@Update("UPDATE notice SET "
			+ "subject=#{subject},content=#{content} "
			+ "WHERE no=#{no}")
	public void noticeUpdate(NoticeVO vo);
	
	@Delete("DELETE TABLE notice "
			+ "WHERE no=#{no}")
	public void noticeDelete(int no);
}
