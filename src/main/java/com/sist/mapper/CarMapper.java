package com.sist.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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
   
   @Select("SELECT * FROM busan_food "
		  +"WHERE fno=#{fno}")
   public CarVO busanFoodDetailData(int fno);
   
   
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
   public int carSearchTotalPage();
   
}
