package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.board.*;

public interface BoardMapper {
	@Select("SELECT no,name,subject,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday,hit,type,num "
			+ "FROM (SELECT no,name,subject,regdate,hit,type,rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(databoard db_no_pk) */ no,name,subject,regdate,hit,type "
			+ "FROM databoard WHERE REGEXP_LIKE(type,#{type}) AND REGEXP_LIKE(${fd},#{ss}))) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/15.0) FROM databoard "
			+ "WHERE REGEXP_LIKE(type,#{type})")
	public int boardTotalPage(Map map);
	
	@Select("SELECT NVL(MAX(no),0) from databoard ")
	public int boardMax();
	
	@Select("SELECT NVL(MIN(no),0) from databoard ")
	public int boardMin();
	
	@Select("SELECT NVL(MAX(no),0) FROM databoard WHERE no < #{no}")
	public int boardPrev(int no);
	
	@Select("SELECT NVL(MIN(no),0) FROM databoard WHERE no > #{no}")
	public int boardNext(int no);
	
	
	
	@Update("UPDATE databoard SET "
			+ "hit=hit+1 "
			+ "WHERE no=#{no}")
	public void boardHitIncrement(int no);
	
	@Select("SELECT * FROM databoard WHERE no=#{no}")
	public BoardVO boardDetailData(int no);
	
	@Insert("INSERT INTO databoard(no,id,name,subject,content,filename,filesize,filecount,type) "
				+ "VALUES(DB_NO_SEQ.nextval,#{id},#{name},#{subject},#{content},#{filename},#{filesize},#{filecount},#{type})")
	public void boardInsert(BoardVO vo);
	
	@Update("UPDATE databoard SET "
			+ "name=#{name},subject=#{subject},content=#{content},filename=#{filename},filesize=#{filesize},type=#{type}")
	public void boardUpdate(BoardVO vo);
	
	@Delete("DELETE FROM databoard "
			+ "WHERE no=#{no}")
	public void boardDelete(int no);
}
