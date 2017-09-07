package kr.or.kosta.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.or.kosta.dao.PostDAO;
import kr.or.kosta.dao.SqlSessionFactoryProvider;
import kr.or.kosta.domain.Attraction;
import kr.or.kosta.domain.Post;


@Repository
public class PostDAOLogic implements PostDAO {

   private SqlSessionFactory factory;

   public PostDAOLogic() {
      factory = SqlSessionFactoryProvider.getSqlSessionFactory();
   }

   @Override
   public Post postSearch(int post_id) {
   SqlSession session = factory.openSession();
      
      try {
         
         return session.selectOne("selectPost", post_id);
      }finally {
         session.close();
      }
   }
      
   

   @Override
   public List<Post> postAllSearch(int attraction_id) {
   SqlSession session = factory.openSession();
   List<Post> list = null;
      
      try {
    	  list = session.selectList("selectAllPost", attraction_id);
      }finally {
         session.close();
      }
      return list;
   }

   @Override
   public int postCreate(Post post) {

      SqlSession session = factory.openSession();
      int result = 0;
      try {
         result = session.insert("createPost", post);
         if (result > 0) {
            session.commit();
         } else {
            session.rollback();
         }
      } finally {
         session.close();
      }
      return result;
   }


   @Override
   public int postUpdate(Post post) {

      SqlSession session = factory.openSession();
      int result = 0;
      try {
         result = session.insert("updatePost", post);
         if (result > 0) {
            session.commit();
         } else {
            session.rollback();
         }
      } finally {
         session.close();
      }
      return result;
   }

   @Override
   public int postDelete(int post_id) {
      SqlSession session = factory.openSession();
      int result = 0;
      try {
         result = session.insert("deletePost", post_id);
         if (result > 0) {
            session.commit();
         } else {
            session.rollback();
         }
      } finally {
         session.close();
      }
      return result;
   }

   @Override
   public List<Double> attractionStarPoint(int attraction_id) {
      SqlSession session = factory.openSession();
      
      try{
      return session.selectList("starPoint", attraction_id);
      }finally{
         session.close();
      }
   }





}