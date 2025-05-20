package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.board.*;
@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDAO dao;

	@Override
	public void qnaboardInsert(QnaVO vo) {
		// TODO Auto-generated method stub
		dao.qnaboardInsert(vo);
	}

	@Override
	public List<QnaVO> qnaboardListData(Map map) {
		// TODO Auto-generated method stub
		return dao.qnaboardListData(map);
	}

	@Override
	public int qnaboardTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.qnaboardTotalPage(map);
	}

	@Override
	public QnaVO qnaboardDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.qnaboardDetailData(no);
	}

	@Override
	public void qnaboardDelete(int no) {
		// TODO Auto-generated method stub
		dao.qnaboardDelete(no);
	}

	@Override
	public void qnaboardAnswer(String answer) {
		// TODO Auto-generated method stub
		dao.qnaboardAnswer(answer);
	}
	
}
