package cn.uyiku.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.uyiku.mapper.UserMapper;
import cn.uyiku.pojo.User;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	
	public User findOne(String userName, String userPassword) {
		return userMapper.findOne(userName,userPassword);
	}


	public User findUserByUsername(String username) {
		return userMapper.findUserByUsername(username);
	}

	@Transactional(value="tm")
	public void save(User user) {
		System.out.println(user);
		userMapper.save(user);
	}

	@Transactional(value="tm")
	public void saveHead(String userId, String url) {
		userMapper.saveHead(userId, url);
	}


	public User findUserById(String userId) {
		return userMapper.findUserById(userId);
	}







	

}
