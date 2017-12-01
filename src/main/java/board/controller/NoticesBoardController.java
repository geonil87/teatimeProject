package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import annotation.CheckAuth;
import annotation.NoCheckLogin;
import annotation.CheckAuth.auth;
import board.dto.NoticesBoardDTO;
import board.service.NoticesBoardServiceImpl;

@Controller
public class NoticesBoardController {
	@Autowired
	NoticesBoardServiceImpl service;	
	
	//전체 조회
	@NoCheckLogin
	@RequestMapping("noticesBoard.list")
	public ModelAndView getNoticesList(@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
		ModelAndView mav = new ModelAndView();
		List<NoticesBoardDTO> list = service.getNoticesList(pageNum);
		int pageNumCount = service.getPageNum();
		List<NoticesBoardDTO> importanceList = service.getImportanceList();
		mav.addObject("importanceList",importanceList);
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("notices",list);
		mav.setViewName("noticesboard/NoticesBoardList");
		return mav;
	}
	
	//공지 추가
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="noticesBoard.insert",method=RequestMethod.GET)
	public String moveNoticesInsert(){
		return "noticesboard/NoticesBoardWrite";
	}
	//공지 추가
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="noticesBoard.insert",method=RequestMethod.POST)
	public String setNoticesInsert(NoticesBoardDTO noticesBoardDTO, HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String permission = session.getAttribute("sessionPermission").toString();
		if(user_id != null){
			if(permission.equals("0")){
				noticesBoardDTO.setUser_id(user_id);
				service.insertNoticeBoard(noticesBoardDTO);			
			}
		}		
		return "redirect:noticesBoard.list";
	}
	
	//공지 상세
	@NoCheckLogin
	@RequestMapping("noticesBoard.detail")
	public ModelAndView getNoticesDetail(int idx){
		ModelAndView mav = new ModelAndView();
		service.plusViewCount(idx);
		NoticesBoardDTO noticesDTO = service.getNoticesDetail(idx);
		mav.addObject("detail",noticesDTO);
		mav.setViewName("noticesboard/NoticesBoardDetail");
		return mav;
	}
	
	// 사진 업로드 Ajax 
	@RequestMapping(value="noticesBoard.imageUpload",method=RequestMethod.POST)
	public @ResponseBody String setImageUpload(MultipartFile uploadFile,HttpServletRequest request){	
		
		String requestURL = request.getRequestURL().toString();
		String[] urlSplit =  requestURL.split("/");
		String localPath = "http://"+urlSplit[2];			
		String url = service.setImageUpload(uploadFile);
		
		return localPath+"/img/notices/"+url;
	}
	
	//공지 수정 
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="noticesBoard.modify",method=RequestMethod.GET)
	public ModelAndView moveNoticesModity(int idx){
		ModelAndView mav = new ModelAndView();
		NoticesBoardDTO noticesDTO = service.getNoticesDetail(idx);
		mav.addObject("modify",noticesDTO);
		mav.setViewName("noticesboard/NoticesBoardModify");
		return mav;
	}
	
	//공지 수정 
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="noticesBoard.modify",method=RequestMethod.POST)
	public String setNoticesModity(NoticesBoardDTO noticesDTO,HttpSession session){
		String permission = session.getAttribute("sessionPermission").toString();			
		if(permission.equals("0")){
			service.modifyNoticesBoard(noticesDTO);
		}
		return "redirect:noticesBoard.list";
	}
	
	//공지 삭제
	@CheckAuth(value=auth.USER)
	@RequestMapping("noticesBoard.delete")
	public String setDeleteNoticesBoard(int idx, NoticesBoardDTO noticesDTO, HttpSession session){
		String permission = session.getAttribute("sessionPermission").toString();
		if(permission.equals("0")){
			service.deleteNoticesBoard(idx);
		}
		return "redirect:noticesBoard.list";
	}
		
}