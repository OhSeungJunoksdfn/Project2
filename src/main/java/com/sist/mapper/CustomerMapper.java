package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.board.*;

public interface CustomerMapper {
	@Insert("INSERT INTO "
			+ "qnaboard(no,id,name,subject,content,type,packaged) "
			+ "VALUES(qna_no_seq.nextval,#{id},#{name},#{subject},#{content},#{type},#{packaged})")
	public void qnaboardInsert(QnaVO vo);
	@Select("SELECT no,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,type,isok,num "
			+ "FROM (SELECT no,subject,regdate,type,isok,rownum as num "
			+ "FROM (SELECT /*+INDEX_DESC(qnaboard qna_no_pk)*/ no,subject,regdate,type,isok "
			+ "FROM qnaboard WHERE id=#{id})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<QnaVO> qnaboardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM qnaboard WHERE id=#{id}")
	public int qnaboardTotalPage(Map map);
	
	@Select("SELECT subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,type,packaged,answer,TO_CHAR(answer_date,'YYYY-MM-DD') as andbday "
			+ "FROM qnaboard "
			+ "WHERE no=#{no}")
	public QnaVO qnaboardDetailData(int no);
	
	@Delete("DELETE FROM qnaboard "
			+ "WHERE no=#{no}")
	public void qnaboardDelete(int no);
	
	@Update("UPDATE qnaboard SET "
			+ "answer=#{answer},andswer_date=SYSDATE,isok='y'")
	public void qnaboardAnswer(String answer);
}
