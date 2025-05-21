package com.sist.mapper;
import java.util.*; 

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReplyVO;
import com.sist.vo.board.*;

public interface BoardMapper {
	@Select("SELECT no,name,subject,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday,hit,type,num "
			+ "FROM (SELECT no,name,subject,regdate,hit,type,rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(databoard db_no_pk) */ no,name,subject,regdate,hit,type "
			+ "FROM databoard WHERE REGEXP_LIKE(type,#{type}) AND REGEXP_LIKE(${fd},#{ss}))) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM databoard "
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
			+ "subject=#{subject},content=#{content},filename=#{filename},filesize=#{filesize},type=#{type} "
			+ "WHERE no=#{no}")
	public void boardUpdate(BoardVO vo);
	
	@Delete("DELETE FROM databoard "
			+ "WHERE no=#{no}")
	public void boardDelete(int no);
	
	
	@Delete("DELETE FROM reply "
			+ "WHERE bno=#{no}")
	public void boardReplyDelete(int no);
	
	@Select("SELECT no,subject,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday,replycount,type,num "
			+ "FROM (SELECT no,subject,regdate,replycount,type,rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(databoard db_no_pk) */ no,subject,regdate,replycount,type "
			+ "FROM databoard WHERE id=#{id})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> myBoardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM databoard "
			+ "WHERE id=#{id}")
	public int myBoardTotalPage(Map map);
	
	/* 댓글 */
	@Select("SELECT no,bno,id,name,msg,TO_CHAR(regdate,'yyyy-MM-dd  HH24:MI') as dbday,group_tab"
			+ " FROM reply "
			+ "WHERE bno=#{bno} AND type=#{type} "
			+ "ORDER BY group_id DESC, group_step ASC")
	public List<ReplyVO>  replyListData(ReplyVO vo);
	
	
	@Insert("INSERT INTO reply(no,bno,id,name,msg,group_id,type) "
			+ "VALUES(reply_no_seq.nextval,#{bno},#{id},#{name},#{msg},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM reply),#{type})")
	public void replyInsert(ReplyVO vo);
	
	@Select("SELECT replycount from databoard WHERE no=#{bno}")
	public int boardReplycount(ReplyVO vo);
	
	
	@Update("UPDATE reply SET "
			+ "msg=#{msg} "
			+ "WHERE no=#{no}")
	public void replyUpdate(ReplyVO vo);
	
	@Select("SELECT no,group_id,group_step "
			+ "FROM reply WHERE no=#{no}")
	public ReplyVO replyInfoData(int no);
	
	@Delete("DELETE FROM reply "
			+ "WHERE group_id=#{group_id} AND group_step>=#{group_step}")
	public void replyDelete(ReplyVO vo);
	
	@Select("SELECT group_id,group_step,group_tab "
			+ "FROM reply "
			+ "WHERE no=#{no}")
	public ReplyVO replyParentInfoData(int no);
	@Update("UPDATE reply SET "
			+ "group_step=group_step+1 "
			+ "WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void replyGroupStepIncrement(ReplyVO vo);
	
	@Insert("INSERT INTO reply(no,bno,id,name,msg, "
			+ "group_id,group_step,group_tab,type) "
			+ "VALUES(reply_no_seq.nextval, "
			+ "#{bno},#{id},#{name},#{msg}, "
			+ "#{group_id},#{group_step},#{group_tab},#{type})")
	public void replyReplyInsert(ReplyVO vo);
	
	
	
	
	
}
