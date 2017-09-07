package kr.or.kosta.dao.mapper;

import kr.or.kosta.domain.User;

public interface UserMapper {
	
	int userCreate(User user);
	int userUpdate(User user);
	int userDelete(String user_id);
	User userSearch(String user_id);
	boolean login(String user_id, String password_id);

}
