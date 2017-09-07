package kr.or.kosta.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosta.dao.UserDAO;
import kr.or.kosta.domain.User;
import kr.or.kosta.service.UserService;

@Service
public class UserServiceLogic implements UserService {
	
	@Autowired
	UserDAO userDAO;

	@Override
	public int userCreate(User user) {
		return userDAO.userCreate(user);
	}

	@Override
	public int userUpdate(User user) {
		return userDAO.userUpdate(user);
	}

	@Override
	public int userDelete(String user_id) {
		return userDAO.userDelete(user_id);
	}

	@Override
	public User userSearch(String user_id) {
		return userDAO.userSearch(user_id);
	}

	@Override
	public boolean login(String user_id, String password_id) {
		User user = userDAO.userSearch(user_id);
//		user가 있다면 id 검증, password가 동일하다면 존재하는 유저
		if(user != null && user.getPassword().equals(password_id)){
			return true;
		}
		return false;
	}

	@Override
	public boolean idCheck(String id) {
		return userDAO.idCheck(id);
	}

}
