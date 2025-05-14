package com.sist.service;

import java.util.*;

import com.sist.vo.ReplyVO;
import com.sist.vo.board.*;

public interface BoardService {
	public List<BoardVO> boardListData(Map map);
	public int boardTotalPage(Map map);
	public BoardVO boardDetailData(int no);
	public void boardInsert(BoardVO vo);
	public void boardUpdate(BoardVO vo);
	public int boardMin();
	public int boardMax();
	public void boardDelete(int no);
	public int boardNext(int no);
	public int boardPrev(int no);
	public List<ReplyVO>  replyListData(ReplyVO vo);
	public void replyInsert(ReplyVO vo);
	public void replyUpdate(ReplyVO vo);
	public ReplyVO replyInfoData(int no);
	public void replyDelete(ReplyVO vo);
	public void replyReplyInsert(int pno,ReplyVO vo);
	public int boardReplycount(ReplyVO vo);
}
