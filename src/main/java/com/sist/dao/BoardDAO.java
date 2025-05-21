package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.ReplyVO;
import com.sist.vo.board.*;
@Repository
public class BoardDAO {
	@Autowired
	private BoardMapper mapper;
	
	public List<BoardVO> boardListData(Map map)
	{
		return mapper.boardListData(map);
	}
	public int boardTotalPage(Map map)
	{
		return mapper.boardTotalPage(map);
	}
	public int boardMax()
	{
		return mapper.boardMax();
	}
	public int boardMin()
	{
		return mapper.boardMin();
	}
	
	public BoardVO boardDetailData(int no) 
	{
		mapper.boardHitIncrement(no);
		return mapper.boardDetailData(no);
	}
	
	public void boardInsert(BoardVO vo)
	{
		
		mapper.boardInsert(vo);
	}
	public void boardUpdate(BoardVO vo)
	{
		mapper.boardUpdate(vo);
	}
	public void boardDelete(int no)
	{
		mapper.boardDelete(no);
		mapper.boardReplyDelete(no);
	}
	
	public int boardNext(int no)
	{
		return mapper.boardNext(no);
	}
	
	public int boardPrev(int no)
	{
		return mapper.boardPrev(no);
	}
	
	//댓글
	
	public List<ReplyVO>  replyListData(ReplyVO vo)
	{
		return mapper.replyListData(vo);
	}
	
	public void replyInsert(ReplyVO vo)
	{

		mapper.replyInsert(vo);
	}
	
	public int boardReplycount(ReplyVO vo)
	{
		return mapper.boardReplycount(vo);
	}
	
	public void replyUpdate(ReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
	public ReplyVO replyInfoData(int no)
	{
		return mapper.replyInfoData(no);
	}
	public void replyDelete(ReplyVO vo)
	{
		mapper.replyDelete(vo);
	}
	
	public void replyReplyInsert(int pno,ReplyVO vo)
	{
	ReplyVO pvo =mapper.replyParentInfoData(pno);	
	mapper.replyGroupStepIncrement(pvo);
	vo.setGroup_id(pvo.getGroup_id());
	vo.setGroup_step(pvo.getGroup_step()+1);
	vo.setGroup_tab(pvo.getGroup_tab()+1);
	mapper.replyReplyInsert(vo);
	}
	public List<BoardVO> myBoardListData(Map map)
	{
		return mapper.myBoardListData(map);
	}
	public int myBoardTotalPage(Map map)
	{
		return mapper.myBoardTotalPage(map);
	}
}
