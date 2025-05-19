package com.sist.service;

import java.util.*;

import com.sist.vo.*;
import com.sist.vo.admin.NoticeVO;

public interface AdminService {
	public List<NoticeVO> noticeListData(Map map);
	public NoticeVO noticeDetailData(int no);
	public void noticeInsert(NoticeVO vo);
	public void noticeUpdate(NoticeVO vo);
	public void noticeDelete(int no);
	public int noticeTotalPage();
	public List<ReplyVO>  AdminreplyListData(Map map);
	public int AdminReplyTotalPage(Map map);
	public void adminReplyDelete(ReplyVO vo);
	public List<MemberVO> userListData(Map map);
	public int userCount();
	public void adminMemberSuspended(String id);
	public void adminMemberActivate(String id);
}
