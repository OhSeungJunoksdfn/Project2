package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.board.*;
import com.sist.mapper.*;
@Repository
public class CustomerDAO {
	@Autowired
	private CustomerMapper mapper;
	
	public void qnaboardInsert(QnaVO vo)
	{
		mapper.qnaboardInsert(vo);
	}
	public List<QnaVO> qnaboardListData(Map map)
	{
		return mapper.qnaboardListData(map);
	}
	
	public int qnaboardTotalPage(Map map)
	{
		return mapper.qnaboardTotalPage(map);
	}
	
	public QnaVO qnaboardDetailData(int no)
	{
		return mapper.qnaboardDetailData(no);
	}
	
	public void qnaboardDelete(int no)
	{
		mapper.qnaboardDelete(no);
	}
	public void qnaboardAnswer(String answer)
	{
		mapper.qnaboardAnswer(answer);
	}
}
