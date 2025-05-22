package com.sist.mapper;
import java.util.*; 

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.admin.*;
public interface AdminMapper {
	@Select("SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+ "FROM (SELECT no,subject,content,regdate, rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(notice notice_no_pk) */ no,subject,content,regdate "
			+ "FROM notice)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/5) FROM notice")
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
	
	@Delete("DELETE FROM notice "
			+ "WHERE no=#{no}")
	public void noticeDelete(int no);
	
	@Select("SELECT no,bno,id,name,msg,TO_CHAR(regdate,'yyyy-MM-dd  HH24:MI') as dbday,group_tab,num "
			+ "FROM (SELECT no,bno,id,name,msg,regdate,group_tab,rownum as num "
			+ "FROM (SELECT no,bno,id,name,msg,regdate,group_tab "
			+ "FROM reply "
			+ "WHERE REGEXP_LIKE(type,#{type}) "
			+ "ORDER BY group_id DESC, group_step ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReplyVO>  AdminreplyListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM reply WHERE  REGEXP_LIKE(type,#{type})")
	public int AdminReplyTotalPage(Map map);
	
	@Update("UPDATE reply SET "
			+ "msg='관리자에 의해 삭제되었습니다.',id=#{id} "
			+ "WHERE no=#{no}")
	public void adminReplyDelete(ReplyVO vo);
	
	@Select("SELECT id,name,sex,email,TO_CHAR(modifydate, 'YYYY-MM-DD') as mday,"
			+ "DECODE(state,'y','일반회원','n','정지회원','d','휴면계정') as sdata,"
			+ "num "
			+ "FROM (SELECT id,name,sex,email,modifydate,state,rownum as num "
			+ "FROM (SELECT id,name,sex,email,modifydate,state "
			+ "FROM projectmember WHERE state NOT LIKE 'a' "
			+ "ORDER BY modifydate DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<MemberVO> userListData(Map map);
	
	@Select("SELECT COUNT(*) FROM projectmember WHERE state!='a'")
	public int userCount();
	
	@Update("UPDATE projectmember SET "
			+ "state='n' "
			+ "WHERE id=#{id}")
	public void adminMemberSuspended(String id);
	
	@Update("UPDATE authority SET "
			+ "authority='ROLE_BANNED' "
			+ "WHERE id=#{id}")
	public void adminAuthoritySuspended(String id);
	
	@Update("UPDATE projectmember SET "
			+ "state='y' "
			+ "WHERE id=#{id}")
	public void adminMemberActivate(String id);
	
	@Update("UPDATE authority SET "
			+ "authority='ROLE_USER' "
			+ "WHERE id=#{id}")
	public void adminAuthorityActivate(String id);
	
	
	// 새문의
	@Select("SELECT COUNT(*) FROM qnaboard WHERE isok='n'")
	public int dashBoardCount();
	
	//월 호텔 매출
	@Select("SELECT SUM(total_price) FROM hotel_reservation "
			+ "WHERE TO_CHAR(BOOKING_DATE, 'YYYYMM') = TO_CHAR(SYSDATE, 'YYYYMM') AND status='예약 확정'")
	public int dashSalesData();
	//금일 신규 게시글
	@Select("SELECT COUNT(*) FROM databoard "
			+ "WHERE TRUNC(regdate) = TRUNC(SYSDATE)")
	public int dashdataBoardCount();
	//월별 신규 회원
	@Select("SELECT  TO_CHAR(regdate, 'YYYY-MM') AS month,COUNT(*) AS cnt "
			+ "FROM projectmember "
			+ "WHERE regdate >= ADD_MONTHS(TRUNC(SYSDATE,'mm'),-5) "
			+ " AND regdate < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1) "
			+ "GROUP BY TO_CHAR(regdate, 'YYYY-MM') "
			+ "ORDER BY month")
	public List<DashVO> dashNewMember();
	//남녀 성비
	@Select("SELECT COUNT(CASE WHEN sex = '남자' THEN 1 END) AS man, "
			+ "COUNT(CASE WHEN sex = '여자' THEN 1 END) AS woman "
			+ "FROM projectmember")
	public DashVO dashSexData(); 
	
	//게시글별 작성도
	@Select("SELECT SUM(CASE WHEN type = '자유글' THEN hit ELSE 0 END) AS free, "
			+ "SUM(CASE WHEN type = '호텔' THEN hit ELSE 0 END) AS hotel, "
			+ "SUM(CASE WHEN type = '관광지' THEN hit ELSE 0 END) AS travel, "
			+ "SUM(CASE WHEN type = '맛집' THEN hit ELSE 0 END) AS food,"
			+ "SUM(CASE WHEN type = '렌트' THEN hit ELSE 0 END) AS rental, "
			+ "GREATEST( "
			+ "SUM(CASE WHEN type = '자유글' THEN hit ELSE 0 END),"
			+ "SUM(CASE WHEN type = '호텔' THEN hit ELSE 0 END), "
			+ "SUM(CASE WHEN type = '관광지' THEN hit ELSE 0 END),"
			+ "SUM(CASE WHEN type = '맛집' THEN hit ELSE 0 END), "
			+ "SUM(CASE WHEN type = '렌트' THEN hit ELSE 0 END) "
			+ ") AS bmax "
			+ "FROM databoard "
			+ "WHERE regdate >= TRUNC(SYSDATE, 'MM') "
			+ "AND regdate < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1)")
	public DashVO dashBoardHitData();
	
	
	
}
