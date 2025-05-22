package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Repository;

import com.sist.vo.car.CarReserveVO;
import com.sist.vo.car.CarVO;
import com.sist.vo.hotel.HotelReserveVO;

import java.util.*;


public interface CarMapper {
   public List<CarVO> carListData(Map map);
   
   
  // @Select("SELECT CEIL(COUNT(*)/6.0) FROM car")
   public int carTotalPage(@Param("tabVal") String tabVal);
   
   public CarVO carDetailData(int no);
   
   @Insert("INSERT INTO car_reserve ("+
	            "no,car_no,member_id,pickup_date,return_date,status,price,ins) "
	            + "VALUES ((SELECT NVL(MAX(no)+1,1) FROM car_reserve),"
	            + "#{car_no},"
	            + "#{member_id},"
	            + "#{pickup_date},"
	            + "#{return_date},"
	            + "#{status},"
	            + "#{price},"
	            + "#{ins})")
   @SelectKey(
	        statement = "SELECT NVL(MAX(no)+1,1) FROM car_reserve",
	        keyProperty = "no",
	        before = true,
	        resultType = Integer.class
	    )
   void insertCarReserve(Map map);
   
   
   /*
    * 
    * <select id="carSearchListData" resultType="CarVO" parameterType="hashmap">
    SELECT no,poster,name,car_class,seat,fuel,premium_ins_price,num
			  FROM (SELECT no,poster,name,car_class,seat,fuel,premium_ins_price,rownum as num
			  FROM (SELECT no,poster,name,car_class,seat,fuel,premium_ins_price 
			  FROM car
			  ORDER BY no ASC)) 
			  WHERE num BETWEEN #{start} AND #{end}
  </select>
  
  <select id="carSearchTotalPage" resultType="int" parameterType="string">
  	SELECT CEIL(COUNT(*)/6.0) FROM car 
  </select>
    */
   public List<CarVO> carSearchListData(Map map);
   public int carSearchTotalPage(Map map);
   
   @Select("SELECT * FROM car_reserve where no=#{no}")
   public CarReserveVO reserveDetailData(int no);
   
   @Select("SELECT cr.no as no, pickup_date, return_date, name as car_name, status FROM "
   		+ "car_reserve cr "
   		+ "JOIN car c ON cr.car_no = c.no"
   		+ " where member_id=#{member_id}")
   public List<CarReserveVO> reserveListData(String member_id);
   
   
   @Select("Delete FROM car_reserve where no=#{no}")
   public void carReserveDelete(int no);
   
   

	public List<HotelReserveVO> adminCarListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) "
			+ "FROM hotel_reservation rv "
			+ "JOIN hotel h ON rv.hotel_no = h.no "
			+ "JOIN hotel_room hr ON rv.room_no = hr.no")
	public int adminCarListTotalPage();
}
