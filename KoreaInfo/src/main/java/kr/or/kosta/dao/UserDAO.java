package kr.or.kosta.dao;

import kr.or.kosta.domain.User;

public interface UserDAO {
   
   //회원가입
   int userCreate(User user);
   //회원정보 수정
   int userUpdate(User user);
   //회원삭제
   int userDelete(String id);
   //회원정보검색(id)
   User userSearch(String id);
   
   boolean idCheck(String id);
   
}