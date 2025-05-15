package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.admin.*;
import com.sist.mapper.*;


@Repository
public class AdminDAO {
	@Autowired
	private AdminMapper mapper;
	
	public List<NoticeVO> noticeListData(Map map)
	{
		return mapper.noticeListData(map);
	}
	public NoticeVO noticeDetailData(int no)
	{
		return mapper.noticeDetailData(no);
	}
	public void noticeInsert(NoticeVO vo)
	{
		mapper.noticeInsert(vo);
	}
	public void noticeUpdate(NoticeVO vo)
	{
		mapper.noticeUpdate(vo);
	}
	public void noticeDelete(int no)
	{
		mapper.noticeDelete(no);
	}
	public int noticeTotalPage()
	{
		return mapper.noticeTotalPage();
	}
}
