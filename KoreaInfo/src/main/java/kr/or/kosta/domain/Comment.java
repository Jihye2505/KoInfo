package kr.or.kosta.domain;

public class Comment {
	
	private int comment_id;
	private String content;
	private String writer_id;
	private int post_id;
	
	public Comment() {}
	
	public Comment(String content, String writer_id) {
		this.content = content;
		this.writer_id = writer_id;
	}
	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	
	

}
