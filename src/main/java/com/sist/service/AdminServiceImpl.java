package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.*;
import com.sist.vo.MemberVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.admin.*;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<NoticeVO> noticeListData(Map map) {
		// TODO Auto-generated method stub
		return dao.noticeListData(map);
	}

	@Override
	public NoticeVO noticeDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.noticeDetailData(no);
	}

	@Override
	public void noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		dao.noticeInsert(vo);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		dao.noticeUpdate(vo);
	}

	@Override
	public void noticeDelete(int no) {
		// TODO Auto-generated method stub
		dao.noticeDelete(no);
	}

	@Override
	public int noticeTotalPage() {
		// TODO Auto-generated method stub
		return dao.noticeTotalPage();
	}

	@Override
	public List<ReplyVO> AdminreplyListData(Map map) {
		// TODO Auto-generated method stub
		return dao.AdminreplyListData(map);
	}

	@Override
	public int AdminReplyTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.AdminReplyTotalPage(map);
	}

	@Override
	public void adminReplyDelete(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.adminReplyDelete(vo);
	}

	@Override
	public List<MemberVO> userListData(Map map) {
		// TODO Auto-generated method stub
		return dao.userListData(map);
	}

	@Override
	public int userCount() {
		// TODO Auto-generated method stub
		return dao.userCount();
	}
	@Transactional
	@Override
	public void adminMemberSuspended(String id) {
		// TODO Auto-generated method stub
		dao.adminMemberSuspended(id);
	}
	@Transactional
	@Override
	public void adminMemberActivate(String id) {
		// TODO Auto-generated method stub
		dao.adminMemberActivate(id);
	}
	
	
}
