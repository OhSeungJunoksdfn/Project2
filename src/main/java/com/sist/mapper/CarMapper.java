package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Repository;

import com.sist.vo.car.CarVO;

import java.util.*;


public interface CarMapper {
//   @Select("SELECT no,poster,name,car_class,seat,fuel,premium_ins_price,num "
//			  +"FROM (SELECT no,poster,name,car_class,seat,fuel,premium_ins_price,rownum as num "
//			  +"FROM (SELECT no,poster,name,car_class,seat,fuel,premium_ins_price "
//			  +"FROM car ORDER BY no ASC)) "
//			  +"WHERE num BETWEEN #{start} AND #{end}")
   public List<CarVO> carListData(Map map);
   
   
  // @Select("SELECT CEIL(COUNT(*)/6.0) FROM car")
   public int carTotalPage(@Param("tabVal") String tabVal);
   
   @Select("SELECT * FROM car "
		  +"WHERE no=#{no}")
   public CarVO carDetailData(int no);
   
   @Insert("INSERT INTO car_reserve ("+
	            "no,car_no,member_id,pickup_date,return_date,status,ins_price,ins_desc) "
	            + "VALUES ((SELECT NVL(MAX(no)+1,1) FROM car_reserve),"
	            + "	#{car_no},"
	            + " #{member_id},"
	            + "#{pickup_date},"
	            + "#{return_date},"
	            + "#{status},"
	            + "#{ins_price},"
	            + "#{ins_desc})")
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
   
}
