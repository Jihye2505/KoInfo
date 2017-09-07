package kr.or.kosta.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosta.dao.CommentDAO;
import kr.or.kosta.domain.Comment;
import kr.or.kosta.service.CommentService;

@Service
public class CommentServiceLogic implements CommentService{

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public int commentCreate(Comment comment) {
		// TODO Auto-generated method stub
		return commentDAO.commentCreate(comment);
	}

	@Override
	public int commentUpdate(Comment comment) {
		// TODO Auto-generated method stub
		return commentDAO.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int comment_id) {
		// TODO Auto-generated method stub
		return commentDAO.commentDelete(comment_id);
	}

	@Override
	public Comment commentSearch(int comment_id) {
		// TODO Auto-generated method stub
		return commentDAO.commentSearch(comment_id);
	}

	@Override
	public List<Comment> commentList(int post_id) {
		// TODO Auto-generated method stub
		return commentDAO.commentAllSearch(post_id);
	}

}
