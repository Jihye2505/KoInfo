package kr.or.kosta.domain;

import org.springframework.web.multipart.MultipartFile;

public class Attraction {
	
	private int attraction_id;
	private int state_id;
	private String title;
	private String address;
	private String content;
	private String image;
	private String writer_id;
	private double star_point;

	public Attraction() {}
	
	public Attraction(int state_id, String title, String address, String content, String image, String writer_id, double star_point) {
		this.state_id = state_id;
		this.title = title;
		this.address = address;
		this.content = content;
		this.image = image;
		this.writer_id = writer_id;
		this.star_point = star_point;
	}
	
	public double getStar_point() {
		return star_point;
	}

	public void setStar_point(double star_point) {
		this.star_point = star_point;
	}

	public int getAttraction_id() {
		return attraction_id;
	}
	public void setAttraction_id(int attraction_id) {
		this.attraction_id = attraction_id;
	}
	public int getState_id() {
		return state_id;
	}
	public void setState_id(int state_id) {
		this.state_id = state_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	
	

}
