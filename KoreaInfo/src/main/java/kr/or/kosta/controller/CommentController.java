package kr.or.kosta.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.kosta.domain.Comment;
import kr.or.kosta.domain.User;
import kr.or.kosta.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String commentCreate(Comment comment,HttpSession session){
		
		User loginedUser = (User) session.getAttribute("loginedUser");
		comment.setWriter_id(loginedUser.getId());
		commentService.commentCreate(comment);
		
		return "redirect:/post/detail?post_id=" + comment.getPost_id();	
		// http://localhost:9090/kosta/post/detail?post_id=1
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String commentUpdate(int comment_id, HttpSession session, Model model) {

		
		User loginedUser = (User) session.getAttribute("loginedUser");
		Comment comment = commentService.commentSearch(comment_id);
		
		comment.setWriter_id(loginedUser.getId());
		
		System.out.println("comment_id :" + comment.getComment_id());
		System.out.println("content :" + comment.getContent());
		System.out.println("post id :" + comment.getPost_id());
		System.out.println("writer :" + comment.getWriter_id());
		
		model.addAttribute("searchCmt", comment);
		
		//commentService.commentUpdate(comment);
		
		
		return "redirect:/post/detail";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String commentDelete(int comment_id, int post_id, HttpSession session) {

		System.out.println("comment id = " + comment_id);
		System.out.println("post id = " + post_id);
		commentService.commentDelete(comment_id);
		
		
		return "redirect:/post/detail?post_id=" + post_id ;
	}

	
}
