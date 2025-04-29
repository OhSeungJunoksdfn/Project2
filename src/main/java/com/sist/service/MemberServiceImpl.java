package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
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

}
