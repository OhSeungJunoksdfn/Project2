package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.HotelDAO;
import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelInfoVO;
import com.sist.vo.hotel.HotelReserveVO;
import com.sist.vo.hotel.HotelRoomVO;
import com.sist.vo.hotel.HotelVO;

@Service
public class HotelServiceImpl implements HotelService {
	@Autowired
	private HotelDAO dao;
	
	@Override
	public List<HotelVO> hotelListData(Map map) {
		// TODO Auto-generated method stub
		return dao.hotelListData(map);
	}
	@Override
	public int hotelTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.hotelTotalPage(map);
	}
	@Override
	public List<HotelRoomVO> hotelDetaiListlData(int no) {
		// TODO Auto-generated method stub
		return dao.hotelDetaiListlData(no);
	}
	@Override
	public List<HotelImgVO> hotelImgListData(int no) {
		// TODO Auto-generated method stub
		return dao.hotelImgListData(no);
	}
	@Override
	public HotelVO hotelData(int no) {
		// TODO Auto-generated method stub
		return dao.hotelData(no);
	}
	@Override
	public List<HotelVO> hotelRelatedData(Map map) {
		// TODO Auto-generated method stub
		return dao.hotelRelatedData(map);
	}
	@Override
	public HotelRoomVO hotelReserveData(Map map) {
		// TODO Auto-generated method stub
		return dao.hotelReserveData(map);
	}
	@Override
	public int hotelReserveInsertData(HotelReserveVO vo) {
		// TODO Auto-generated method stub
		return dao.hotelReserveInsertData(vo);
	}
	@Override
	public List<HotelVO> hotelMainData() {
		// TODO Auto-generated method stub
		return dao.hotelMainData();
	}
	@Override
	public List<HotelReserveVO> mypageHotelReserveListData(String member_id) {
		// TODO Auto-generated method stub
		return dao.mypageHotelReserveListData(member_id);
	}
	@Override
	public HotelReserveVO hotelReserveDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.hotelReserveDetailData(no);
	}
	@Override
	public List<HotelReserveVO> adminHotelListData(Map map) {
		// TODO Auto-generated method stub
		return dao.adminHotelListData(map);
	}
	@Override
	public void hotelReserveDelete(int no) {
		// TODO Auto-generated method stub
		dao.hotelReserveDelete(no);
	}
	@Override
	public int adminHotelListTotalPage() {
		// TODO Auto-generated method stub
		return dao.adminHotelListTotalPage();
	}
	@Override
	public void adminHotelUpdate(HotelReserveVO vo) {
		// TODO Auto-generated method stub
		dao.adminHotelUpdate(vo);
	}
	@Override
	public int mypageHotelListTotalPage() {
		// TODO Auto-generated method stub
		return dao.adminHotelListTotalPage();
	}
	@Override
	public HotelInfoVO hotelInfoData(int no) {
		// TODO Auto-generated method stub
		return dao.hotelInfoData(no);
	}
}
