package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.*;
import com.sist.vo.board.BoardVO;
import com.sist.dao.*;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
	@Autowired
	private BoardDAO bdao;
	@Override
	public int memberCheckData(String id) {
		// TODO Auto-generated method stub
		return dao.memberCheckData(id);
	}
	@Transactional
	@Override
	public void memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberInsert(vo);
	}
	@Override
	public MemberVO memberSessionData(String id) {
		// TODO Auto-generated method stub
		return dao.memberSessionData(id);
	}
	@Override
	public String findIdData(String email) {
		int a = dao.checkEmail(email);
		if(a!=1)
		{
			return "";
		}
		return dao.findIdData(email);
	}
	
	@Override
	public int checkMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.checkMember(vo);
	}
	@Override
	public void pwdUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.pwdUpdate(vo);
	}
	@Override
	public MemberVO memberDetailData(String id) {
		// TODO Auto-generated method stub
		return dao.memberDetailData(id);
	}
	@Override
	public int myBoardTotalPage(Map map) {
		// TODO Auto-generated method stub
		return bdao.myBoardTotalPage(map);
	}
	@Override
	public List<BoardVO> myBoardListData(Map map) {
		// TODO Auto-generated method stub
		return bdao.myBoardListData(map);
	}
	@Transactional
	@Override
	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		dao.memberDelete(id);
	}
	@Override
	public void memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberUpdate(vo);
	}

}
