package kr.or.kosta.dao.mapper;

import java.util.List;

import kr.or.kosta.domain.Comment;

public interface CommentMapper {

	int commentCreate(Comment comment);
	
	int commentUpdate(Comment comment);
	
	int commentDelete(int comment_id);
	
	Comment commentSearch(int comment_id);
	
	List<Comment> commentAllSearch(int post_id);
}
