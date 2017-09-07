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
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import kr.or.kosta.domain.Comment;
import kr.or.kosta.domain.Post;
import kr.or.kosta.domain.User;
import kr.or.kosta.service.CommentService;
import kr.or.kosta.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;

	@RequestMapping("/detail")
	public ModelAndView showPostDetail(@RequestParam("post_id") int post_id) {
		
		ModelAndView modelAndView = new ModelAndView("post/postDetail");

		List<Comment> list = commentService.commentList(post_id);
		modelAndView.addObject("post", postService.postSearch(post_id));
		modelAndView.addObject("cmtList", list);
		return modelAndView;
	}

	@RequestMapping("/create")
	public ModelAndView showPostCreateForm(@RequestParam("attraction_id") int attraction_id, HttpServletRequest req) {

		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("loginedUser");

		if (session == null || loginedUser == null) {
			return new ModelAndView("redirect:/user/loginView");
		}
		ModelAndView modelAndView = new ModelAndView("post/postRegister");
		modelAndView.addObject("attraction_id", attraction_id);
		modelAndView.addObject("writer_id", loginedUser.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postCreate(Post post, @RequestParam("file") MultipartFile file, @RequestParam("attraction_id") int attraction_id) {

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\post" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + attraction_id + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				return "Fail : " + e.getMessage();
			}
		}
		post.setImage(mTime + attraction_id + ".png");

		postService.postCreate(post);

		return "redirect:/Attraction/searchById?attraction_id=" + post.getAttraction_id();
	}

	@RequestMapping("/image")
	public void imageRegist(@RequestParam("post_id") int post_id, HttpServletResponse resp) throws IOException {
		
		String image = postService.postSearch(post_id).getImage();

		InputStream in = null;
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		OutputStream out = null;

		if (image != null) {

			String imgName = image;
			String imagePath = "c:/image/post";

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

	@RequestMapping("/update")
	public ModelAndView postUpdateForm(@RequestParam("post_id") int post_id) {

		ModelAndView modelAndView = new ModelAndView("post/postUpdate");
		modelAndView.addObject("post", postService.postSearch(post_id));

		return modelAndView;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(Post post, @RequestParam("file") MultipartFile file) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\post" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + post.getAttraction_id() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				return "Fail : " + e.getMessage();
			}
		}
		post.setImage(mTime + post.getAttraction_id() + ".png");
		postService.postUpdate(post);
		return "redirect:detail?post_id=" + post.getPost_id();
	}

	@RequestMapping("/delete")
	public String postDelete(@RequestParam("post_id") int post_id, HttpSession session) {

		Post post = postService.postSearch(post_id);
		postService.postDelete(post_id);

		return "redirect:/Attraction/searchById?attraction_id=" + post.getAttraction_id();
	}
	
}
