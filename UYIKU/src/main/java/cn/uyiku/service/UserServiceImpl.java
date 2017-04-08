package cn.uyiku.service;

import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.uyiku.mapper.UserMapper;
import cn.uyiku.pojo.User;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;

	

	@Override
	public User findOne(String userName, String userPassword) {
		return userMapper.findOne(userName,userPassword);
	}










	@Override
	public User findUserByUsername(String username) {
		return userMapper.findUserByUsername(username);
	}



	@Override
	public void save(User user) {
		System.out.println(user);
		userMapper.save(user);
	}







	@Override
	public void saveHead(String userId, String url) {
		userMapper.saveHead(userId, url);
	}










	@Override
	public User findUserById(String userId) {
		return userMapper.findUserById(userId);
	}







	

}
