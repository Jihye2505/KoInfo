package kr.or.kosta.service;

import java.util.List;

import kr.or.kosta.domain.Comment;


public interface CommentService {

	int commentCreate(Comment comment);
	
	int commentUpdate(Comment comment);
	
	int commentDelete(int comment_id);
	
	Comment commentSearch(int comment_id);
	
	List<Comment> commentList(int post_id);
	
}