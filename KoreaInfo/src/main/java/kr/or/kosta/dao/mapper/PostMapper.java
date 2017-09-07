package kr.or.kosta.dao.mapper;

import java.util.List;

import kr.or.kosta.domain.Post;

public interface PostMapper {

   //후기검색
   Post postSearch(int post_id);
   //관광지별 후기 전체검색
   List<Post> postAllSearch(int attraction_id);
   //후기 작성
   int postCreate(Post post);
   //후기 수정
   int postUpdate(Post post);
   //후기삭제
   int postDelete(int post_id);
   
   List<Double> attractionStarPoint(int attraction_id);
   
}