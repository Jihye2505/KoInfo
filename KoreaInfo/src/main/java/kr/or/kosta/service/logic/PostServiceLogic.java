package kr.or.kosta.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosta.dao.PostDAO;
import kr.or.kosta.domain.Post;
import kr.or.kosta.service.PostService;


@Service
public class PostServiceLogic implements PostService {
   
   @Autowired
   private PostDAO postDAO;

   @Override
   public Post postSearch(int post_id) {
      
      return postDAO.postSearch(post_id);
   }

   @Override
   public List<Post> postAllSearch(int attraction_id) {
      return postDAO.postAllSearch(attraction_id);
   }

   @Override
   public int postCreate(Post post) {
      return postDAO.postCreate(post);
   }

   @Override
   public int postUpdate(Post post) {
      return postDAO.postUpdate(post);
   }

   @Override
   public int postDelete(int post_id) {
      return postDAO.postDelete(post_id);
   }

@Override
public double avgStarPoint(int attraction_id) {

	
	List<Double> list= postDAO.attractionStarPoint(attraction_id);

	double sum = 0;
	for(double star_point : list){
		sum += star_point;
	}

	double avgStarPoint = sum/list.size();
	
	if(Double.isNaN(avgStarPoint) == true) {
		avgStarPoint = 0;
	}
	return avgStarPoint;
}

}