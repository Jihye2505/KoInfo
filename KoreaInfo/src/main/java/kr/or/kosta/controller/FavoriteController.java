package kr.or.kosta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.domain.Attraction;
import kr.or.kosta.domain.User;
import kr.or.kosta.service.AttractionService;

@Controller
public class FavoriteController {
	
	@Autowired
	AttractionService service;
	
	@RequestMapping("/addFavorite")
	public String addFavorite(@RequestParam("attraction_id")int attraction_id, HttpServletRequest req) {
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("loginedUser");
	      
	      if (session == null || loginedUser == null) {
	         return "redirect:/user/loginView";
	      }
		
		User user = (User) session.getAttribute("loginedUser");
		service.favoritesCreate(user.getId(), attraction_id);
		
		return "redirect:favoriteList?loginId=" + user.getId();
	}
	
	
	@RequestMapping("/favoriteList")
	public ModelAndView showFavoriteList(HttpServletRequest req) {
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("loginedUser");
	      
	      if (session == null || loginedUser == null) {
	         return new ModelAndView("redirect:/user/loginView");
	      }
		User user = (User) session.getAttribute("loginedUser");
		List<Attraction> list = service.favoritesAllSearch(user.getId());
		ModelAndView ma = new ModelAndView("user/userfavoriteList");
		ma.addObject("favoriteList", list);
		ma.addObject("user", user);
		return ma;
	}
	
	@RequestMapping("/deleteFavorite")
	public String removeFavorite(@RequestParam("attraction_id") int attraction_id, HttpServletRequest req){
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("loginedUser");
	      
	      if (session == null || loginedUser == null) {
	    	  return "redirect:/user/loginView";
	      }
		User user = (User) session.getAttribute("loginedUser");
		service.favoritesDelete(user.getId(), attraction_id);
		return "redirect:favoriteList";
	}

}
