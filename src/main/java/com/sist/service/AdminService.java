package com.sist.service;

import java.util.*;

import com.sist.vo.admin.NoticeVO;

public interface AdminService {
	public List<NoticeVO> noticeListData(Map map);
	public NoticeVO noticeDetailData(int no);
	public void noticeInsert(NoticeVO vo);
	public void noticeUpdate(NoticeVO vo);
	public void noticeDelete(int no);
	public int noticeTotalPage();
}
