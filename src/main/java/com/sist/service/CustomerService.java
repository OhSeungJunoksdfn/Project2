package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.board.QnaVO;

public interface CustomerService {
	public void qnaboardInsert(QnaVO vo);
	public List<QnaVO> qnaboardListData(Map map);
	public int qnaboardTotalPage(Map map);
	public QnaVO qnaboardDetailData(int no);
	public void qnaboardDelete(int no);
	public void qnaboardAnswer(String answer);
}
