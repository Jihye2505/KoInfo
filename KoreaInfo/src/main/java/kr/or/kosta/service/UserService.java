package kr.or.kosta.service;

import kr.or.kosta.domain.User;

public interface UserService {
   
   int userCreate(User user);
   
   int userUpdate(User user);
   
   int userDelete(String id);
   
   User userSearch(String id);
   
   boolean login(String id, String password);

   boolean idCheck(String id);
}