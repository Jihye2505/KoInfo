package kr.or.kosta.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.domain.Attraction;
import kr.or.kosta.domain.Post;
import kr.or.kosta.domain.User;
import kr.or.kosta.service.AttractionService;
import kr.or.kosta.service.PostService;
import kr.or.kosta.service.UserService;

@Controller
public class AttractionController {
	
	@Autowired
	private AttractionService attservice;
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	ServletContext context; 
	
	@RequestMapping("/Attraction/searchByName")
	public ModelAndView AttractionSearchByName(@RequestParam("title")String title){
		List<Attraction> list = attservice.attractionSearchByName(title);
		ModelAndView modelAndView = new ModelAndView("tourist/touristList");
		modelAndView.addObject("attlist", list);
		
		return modelAndView;
		
	}
	
	@RequestMapping("/Attraction/searchById")
	public ModelAndView AttractionSearchById(@RequestParam("attraction_id")int attraction_id){
		ModelAndView modelAndView = new ModelAndView("tourist/touristDetail");
		
		modelAndView.addObject("attr", attservice.attractionSearchById(attraction_id));
		List<Post> list = postService.postAllSearch(attraction_id);
		modelAndView.addObject("postList", list);
		
		return modelAndView;
	}

	@RequestMapping("/Attraction/list")
	public ModelAndView AttractionListByState(@RequestParam("state_id")int state_id, HttpServletRequest req) {
		List<Attraction> list = attservice.attractionSearchByState(state_id);
		List<Attraction> lists = new ArrayList<Attraction>();
		for(Attraction attr: list) {
			double star = postService.avgStarPoint(attr.getAttraction_id());
			attr.setStar_point(star);
			lists.add(attr);
		}
		
		ModelAndView modelAndView = new ModelAndView("tourist/touristList");
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("loginedUser");
	      
	    modelAndView.addObject("loginedUser", loginedUser);  
		modelAndView.addObject("attlist", lists);
		modelAndView.addObject("state_id", state_id);
		
		return modelAndView;
	}
	
	@RequestMapping("/Attraction/regist")
	public ModelAndView showRegistForm(@RequestParam("state_id")int state_id) {
		ModelAndView modelAndView = new ModelAndView("tourist/toruistRegist");
		modelAndView.addObject("state_id", state_id);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Attraction/regist", method=RequestMethod.POST)
	public String AttractionRegist(Attraction attraction, HttpServletRequest req,@RequestParam("state_id")int state_id, @RequestParam("file")MultipartFile file){
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("loginedUser");
	      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy_MM_dd_hh_mm_ss", Locale.KOREA );
	      Date currentTime = new Date ( );
	      String mTime = mSimpleDateFormat.format ( currentTime );
			if(!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					
					File dir = new File("C:\\image" + File.separator);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + state_id + ".png");
					BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
					out.write(bytes);
					out.close();
					
				} catch(Exception e) {
					return "Fail : " + e.getMessage();
				}
			}
		attraction.setImage(mTime + state_id + ".png");
		attraction.setWriter_id(loginedUser.getId());
		attservice.attractionCreate(attraction);
				
		return "redirect:list?state_id=" + attraction.getState_id();
	}
	
	@RequestMapping("/Attraction/update")
	public ModelAndView showUpdateForm(@RequestParam("attraction_id")int attraction_id) {
		
		Attraction attraction = attservice.attractionSearchById(attraction_id);
		ModelAndView modelAndView = new ModelAndView("tourist/touristUpdate");
		modelAndView.addObject("attr", attraction);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/Attraction/update", method=RequestMethod.POST)
	public String AttractionUpdate(Attraction attraction, HttpServletRequest req, @RequestParam("attraction_id")int attraction_id, @RequestParam("file")MultipartFile file){
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("loginedUser");
	      
	      if (session == null || loginedUser == null) {
	         return "redirect:/user/loginView";
	      }
	      System.out.println(attraction.getAttraction_id() + "attraction");
	      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy_MM_dd_hh_mm_ss", Locale.KOREA );
	      Date currentTime = new Date ( );
	      String mTime = mSimpleDateFormat.format ( currentTime );
			if(!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					
					File dir = new File("C:\\image" + File.separator);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + attraction.getState_id() + ".png");
					BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
					out.write(bytes);
					out.close();
					
				} catch(Exception e) {
					return "Fail : " + e.getMessage();
				}
			}
		attraction.setImage(mTime + attraction.getState_id() + ".png");
		attraction.setWriter_id(loginedUser.getId());
		attservice.attractionUpdate(attraction);
				
		return "redirect:list?state_id=" + attraction.getState_id();
	}
	
	
	
	@RequestMapping("/Attraction/delete")
	public String AttractionDelete(@RequestParam("attraction_id")int attraction_id, @RequestParam("state_id")int state_id){
		attservice.attractionDelete(attraction_id);
		
		return "redirect:list?state_id=" + state_id;
	}
	
	@RequestMapping("/Attraction/image")
	public void imageRegist(@RequestParam("attraction_id")int attraction_id, HttpServletResponse resp) throws IOException{
	String recipeImage = attservice.attractionSearchById(attraction_id).getImage();
	
	InputStream in = null;
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	OutputStream out = null;

	if (recipeImage != null) {

		String imgName = recipeImage;
		String imagePath = "c:/image";

		fis = new FileInputStream(imagePath + "/" + imgName);
		in = new BufferedInputStream(fis);
	} else {
		resp.setContentType("image/png");
	}
	
	out = resp.getOutputStream();
	
	int readcnt = 0;
	byte[] buf = new byte[1024];
	
	while ((readcnt = in.read(buf)) != -1) {
		out.write(buf, 0, readcnt);
		
	}
	out.flush();
	
	if (in != null)
		in.close();
	if (out != null)
		out.close();
	}
	
}
