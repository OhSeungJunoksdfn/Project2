package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.*;
import com.sist.vo.board.*;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	@Override
	public List<BoardVO> boardListData(Map map) {
		// TODO Auto-generated method stub
		return dao.boardListData(map);
	}
	@Override
	public int boardTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.boardTotalPage(map);
	}
	@Transactional
	@Override
	public BoardVO boardDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.boardDetailData(no);
	}
	@Override
	public void boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.boardInsert(vo);
	}
	@Override
	public void boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.boardUpdate(vo);
	}
	@Override
	public int boardMin() {
		// TODO Auto-generated method stub
		return dao.boardMin();
	}
	@Override
	public int boardMax() {
		// TODO Auto-generated method stub
		return dao.boardMax();
	}

}
