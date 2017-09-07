package kr.or.kosta.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.or.kosta.dao.CommentDAO;
import kr.or.kosta.dao.SqlSessionFactoryProvider;
import kr.or.kosta.domain.Attraction;
import kr.or.kosta.domain.Comment;

@Repository
public class CommentDAOLogic implements CommentDAO{

	private SqlSessionFactory factory;

	public CommentDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int commentCreate(Comment comment) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.insert("createComment", comment); 
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int commentUpdate(Comment comment) {
		// TODO Auto-generated method stub
		 SqlSession session = factory.openSession();
	      int result = 0;
	      try {
	         result = session.insert("updateComment", comment);
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
	public int commentDelete(int comment_id) {
		// TODO Auto-generated method stub
	      SqlSession session = factory.openSession();
	      int result = 0;
	      try {
	         result = session.insert("deleteComment", comment_id);
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
	public Comment commentSearch(int comment_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		Comment comment = null;
		
		try {
			comment = session.selectOne("commentFindByOne", comment_id);
		} finally {
			session.close();
		}
		return comment;
	}

	@Override
	public List<Comment> commentAllSearch(int post_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<Comment> list = null;
		
		try {
			list = session.selectList("commentFindByPost", post_id);
		} finally {
			session.close();
		}
		return list;
	}
}
