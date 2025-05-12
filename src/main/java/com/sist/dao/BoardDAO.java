package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
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
	}
	
	public int boardNext(int no)
	{
		return mapper.boardNext(no);
	}
	
	public int boardPrev(int no)
	{
		return mapper.boardPrev(no);
	}
}
