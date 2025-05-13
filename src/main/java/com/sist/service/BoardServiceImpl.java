package com.sist.service;

import java.util.*; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.*;
import com.sist.vo.ReplyVO;
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
	@Transactional
	@Override
	public void boardDelete(int no) {
		// TODO Auto-generated method stub
		dao.boardDelete(no);
	}
	@Override
	public int boardNext(int no) {
		// TODO Auto-generated method stub
		return dao.boardNext(no);
	}
	@Override
	public int boardPrev(int no) {
		// TODO Auto-generated method stub
		return dao.boardPrev(no);
	}
	@Override
	public List<ReplyVO> replyListData(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.replyListData(vo);
	}
	
	@Override
	public void replyInsert(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyInsert(vo);
	}
	@Override
	public void replyUpdate(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyUpdate(vo);
	}
	@Override
	public ReplyVO replyInfoData(int no) {
		// TODO Auto-generated method stub
		return dao.replyInfoData(no);
	}
	
	@Override
	public void replyDelete(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyDelete(vo);
	}
	@Override
	public ReplyVO replyParentInfoData(int no) {
		// TODO Auto-generated method stub
		return dao.replyParentInfoData(no);
	}
	@Override
	public void replyGroupStepIncrement(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyGroupStepIncrement(vo);
	}
	@Override
	public void replyReplyInsert(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyReplyInsert(vo);
	}
	@Override
	public int boardReplycount(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.boardReplycount(vo);
	}

}
