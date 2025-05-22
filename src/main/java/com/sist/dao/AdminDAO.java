package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.MemberVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.admin.*;
import com.sist.mapper.*;


@Repository
public class AdminDAO {
	@Autowired
	private AdminMapper mapper;
	
	public List<NoticeVO> noticeListData(Map map)
	{
		return mapper.noticeListData(map);
	}
	public NoticeVO noticeDetailData(int no)
	{
		return mapper.noticeDetailData(no);
	}
	public void noticeInsert(NoticeVO vo)
	{
		mapper.noticeInsert(vo);
	}
	public void noticeUpdate(NoticeVO vo)
	{
		mapper.noticeUpdate(vo);
	}
	public void noticeDelete(int no)
	{
		mapper.noticeDelete(no);
	}
	public int noticeTotalPage()
	{
		return mapper.noticeTotalPage();
	}
	public List<ReplyVO>  AdminreplyListData(Map map)
	{
		return mapper.AdminreplyListData(map);
	}
	public int AdminReplyTotalPage(Map map)
	{
		return mapper.AdminReplyTotalPage(map);
	}
	public void adminReplyDelete(ReplyVO vo)
	{
		mapper.adminReplyDelete(vo);
	}
	
	public List<MemberVO> userListData(Map map)
	{
		return mapper.userListData(map);
	}
	public int userCount()
	{
		return mapper.userCount();
	}
	
	public void adminMemberSuspended(String id)
	{
		mapper.adminMemberSuspended(id);
		mapper.adminAuthoritySuspended(id);
	}
	
	public void adminMemberActivate(String id)
	{
		mapper.adminMemberActivate(id);
		mapper.adminAuthorityActivate(id);
	}
	
	//대시보드 통계
	//새 문의
	public int dashBoardCount()
	{
		return mapper.dashBoardCount();
	}
	//호텔 매출
	public int dashSalesData()
	{
		return mapper.dashSalesData();
	}
	//금일 신규 게시글
	public int dashdataBoardCount()
	{
		return mapper.dashdataBoardCount();
	}
	
	//월별 신규 회원
	public List<DashVO> dashNewMember()
	{
		return mapper.dashNewMember();
	}
	//남녀 성비
	public DashVO dashSexData()
	{
		return mapper.dashSexData();
	}
	//게시글별 방문수
	public DashVO dashBoardHitData()
	{
		return mapper.dashBoardHitData();
	}
	
	
}
