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
}
