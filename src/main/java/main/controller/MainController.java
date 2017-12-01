package main.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import annotation.CheckAuth;
import annotation.CheckAuth.auth;
import annotation.NoCheckLogin;
import board.dto.MediaBoardCommentDTO;
import board.dto.MediaBoardDTO;
import board.dto.PhotoBoardCommentDTO;
import board.dto.PhotoBoardDTO;
import board.dto.StoryBoardCommentDTO;
import board.dto.StoryBoardDTO;
import board.service.MediaBoardCommentServiceImpl;
import board.service.MediaBoardServiceImpl;
import board.service.PhotoBoardCommentServiceImpl;
import board.service.PhotoBoardServiceImpl;
import board.service.StoryBoardCommentServiceImpl;
import board.service.StoryBoardServiceImpl;
import member.service.MemberServiceImpl;


@Controller
public class MainController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	StoryBoardServiceImpl story;
	
	@Autowired
	PhotoBoardServiceImpl photo;
	
	@Autowired
	MediaBoardServiceImpl media;
	
	@Autowired 
	StoryBoardCommentServiceImpl storyComment;
	
	@Autowired
	PhotoBoardCommentServiceImpl photoComment;
	
	@Autowired
	MediaBoardCommentServiceImpl mediaComment;
	
	@Autowired
	MemberServiceImpl member;
	
	@NoCheckLogin
	@RequestMapping(value="main")
	public ModelAndView moveMain(){
		ModelAndView mav =new ModelAndView();
		List<StoryBoardDTO> storyBest = story.getStoryBestList();
		List<MediaBoardDTO> mediaBest = media.getMediaBestList();
		List<PhotoBoardDTO> photoBest = photo.getPhotoBestList();
		List<PhotoBoardDTO> realTime = photo.getRealTimePhoto();
		List<StoryBoardCommentDTO> storyCommentBest = storyComment.getBestComment();
		List<PhotoBoardCommentDTO> photoCommentBest	= photoComment.getBestComment();
		List<MediaBoardCommentDTO> mediaCommentBest = mediaComment.getBestComment();
		mav.addObject("storyBest",storyBest);
		mav.addObject("photoBest",photoBest);
		mav.addObject("mediaBest",mediaBest);
		mav.addObject("realTime",realTime);
		mav.addObject("storyCommentBest",storyCommentBest);
		mav.addObject("photoCommentBest",photoCommentBest);
		mav.addObject("mediaCommentBest",mediaCommentBest);
		mav.setViewName("main/teatimeMain");		
		return mav;
	}
	
	@CheckAuth(value=auth.ALL)
	@RequestMapping("mypage")
	public String moveMyPage(HttpSession session){
		String referer = request.getHeader("Referer");
		
		if(session.getAttribute("sessionPermission") !=null){
			return "redirect:mycontent?board=story_board";
		}
		return "redirect:"+ referer;
	}
	
	@CheckAuth(value=auth.ADMIN)
	@RequestMapping("admin")
	public String moveAdminpage(HttpSession session){
		if(session.getAttribute("sessionPermission")==null){
			return "redirect:teatime.main";
		}
		String adminAuth = String.valueOf(session.getAttribute("sessionPermission"));
		
		if(adminAuth !=null && adminAuth.equals("0")){
			return "redirect:admin.dashBoardMain";
		}
		return "redirect:teatime.main";
	}
	
	@NoCheckLogin
	@RequestMapping(value="AuthFail", method=RequestMethod.GET)
	public ModelAndView moveAuthFail(String result, HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(result.equals("notAdmin")){
			mav.setViewName("main/adminAuthFail");
		}else if(result.equals("suspend")){
			String userId = (String)session.getAttribute("sessionId");
			mav.addObject("cause", member.getSuspendCause(userId));
			mav.setViewName("main/suspendAuthFail");
		}else if(result.equals("common")){
			mav.setViewName("main/commonAuthFail");
		}
		return mav;
	}
	
	
	
}
