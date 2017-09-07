package kr.or.kosta.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.domain.User;
import kr.or.kosta.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String main() {
		return "/Main";
	}

	@RequestMapping("/user/search")
	public String searchUserById(String id, HttpSession session) {

		User user = userService.userSearch(id);

		session.setAttribute("searchedUser", user);

		return "user/managermemberInfo";
	}

	@RequestMapping("/user/delete")
	public String memberdelete(String id, HttpSession session) {
		User user4 = (User) session.getAttribute("searchedUser");

		id = user4.getId();
		userService.userDelete(id);

		return "redirect:memSearchView";
	}

	@RequestMapping("/user/idCheck")
	public @ResponseBody String checkId(String loginId) {
		boolean result = userService.idCheck(loginId);

		if (result) {
			return "true";
		}
		return "false";
	}

	@RequestMapping("/user/join")
	public String create(User user, Model model) {
		//
		user.setRank('D');
		userService.userCreate(user);
		model.addAttribute("title", "회원가입완료");
		model.addAttribute("content", "회원가입이 완료되었습니다.");

		return "/Main";
	}

	@RequestMapping("/user/login")
	public String login(String loginId, String password, HttpSession session) {
		//
		boolean result = userService.login(loginId, password);

		if (!result) {
			return "/user/userlogin";
		}

		User user = userService.userSearch(loginId);
		session.setAttribute("loginedUser", user);
		return "/Main";
	}

	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();

		return "/Main";
	}

	@RequestMapping("/user/modify")
	public String modifyInfo(User user, HttpSession session) {
		User user2 = (User) session.getAttribute("loginedUser");
		String id = user2.getId();
		user.setId(id);
		userService.userUpdate(user);

		User user3 = userService.userSearch(id);
		session.setAttribute("loginedUser", user3);

		return "/Main";
	}

	/* 탈퇴=============================== */
	@RequestMapping("/user/secession")
	public String userDelete(String password, HttpSession session) {
		User user2 = (User) session.getAttribute("loginedUser");
		String id = user2.getId();

		if (user2.getPassword().equals(password)) {
			userService.userDelete(id);

			return "redirect:logout";
		}

		return "redirect:secessionView";
	}

	@RequestMapping("/user/loginView")
	public ModelAndView userInsert() {
		ModelAndView modelAndView = new ModelAndView("user/userlogin");
		return modelAndView;
	}

	@RequestMapping("/user/joinView")
	public ModelAndView userJoin() {
		ModelAndView modelAndView = new ModelAndView("user/userjoin");
		return modelAndView;
	}

	@RequestMapping("/user/modifyView")
	public ModelAndView userModify() {
		ModelAndView modelAndView = new ModelAndView("user/usermodify");
		return modelAndView;
	}

	@RequestMapping("/user/secessionView")
	public ModelAndView userSecession() {
		ModelAndView modelAndView = new ModelAndView("user/usersecession");
		return modelAndView;
	}

	@RequestMapping("/user/favoriteView")
	public ModelAndView myAttr() {
		ModelAndView modelAndView = new ModelAndView("user/userfavoriteList");
		return modelAndView;
	}

	@RequestMapping("/user/memSearchView")
	public ModelAndView memberSearch() {
		ModelAndView modelAndView = new ModelAndView("user/managerSearch");
		return modelAndView;
	}

}
