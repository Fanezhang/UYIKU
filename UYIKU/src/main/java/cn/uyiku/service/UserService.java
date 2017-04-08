package cn.uyiku.service;

import cn.uyiku.pojo.User;

public interface UserService {
	void save(User user);

	User findOne(String userName, String userPassword);

	User findUserByUsername(String username);
	void saveHead(String userId, String url);

	User findUserById(String userId);

}
