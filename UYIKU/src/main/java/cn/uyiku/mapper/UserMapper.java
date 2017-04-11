package cn.uyiku.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import cn.uyiku.pojo.User;

public interface UserMapper {

	void regist(User user);
	
	
	User findOne(@Param("userName")String userName, @Param("userPassword")String userPassword);


	void insertOne(User user);


	User findUserByUsername(String username);

	
	void save(User user);


	void saveHead(@Param("userId") String userId,@Param("url") String url);


	User findUserById(String userId);

}
