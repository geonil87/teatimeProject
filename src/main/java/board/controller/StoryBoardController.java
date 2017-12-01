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
import annotation.CheckAuth.auth;
import annotation.NoCheckLogin;
import board.dto.StoryBoardCommentDTO;
import board.dto.BoardCommentRecommendDTO;
import board.dto.StoryBoardDTO;
import board.service.StoryBoardCommentServiceImpl;
import board.service.StoryBoardServiceImpl;


@Controller
public class StoryBoardController {
	
	@Autowired
	StoryBoardServiceImpl service;
	
	@Autowired
	StoryBoardCommentServiceImpl serviceComment;
	
	
	@RequestMapping(value="teatime.main")
	public String moveStoryMain(){		
		return "storyboard/StoryBoardMain";
	}
	
	//전체조회
	@NoCheckLogin
	@RequestMapping("storyBoard.list")
    public ModelAndView getStoryList(@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		ModelAndView mav = new ModelAndView();
		List<StoryBoardDTO> list = service.getStoryBoardList(pageNum);
		int pageNumCount = service.getPageNum();
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("allstoryboardlist", list);
		mav.setViewName("storyboard/StoryBoardList");
		
		return mav;
    }
	//게시판 검색기능 
	@NoCheckLogin
		@RequestMapping("storyBoard.search")
		public ModelAndView storyBoardSearch(String searchColumn, String keyword,@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
			ModelAndView mav = new ModelAndView();			
			List<StoryBoardDTO> list = service.getStoryBoardSearch(searchColumn, keyword,pageNum);		
			int pageNumCount = service.getSearchPageNum(searchColumn, keyword);
			mav.addObject("searchColumn",searchColumn);
			mav.addObject("keyword",keyword);
			mav.addObject("pageNumCount",pageNumCount);
			mav.addObject("searchList",list);
			mav.setViewName("storyboard/StoryBoardSearch");
			return mav;
		}
	
	//게시글 한개 조회
	@NoCheckLogin
	@RequestMapping("storyBoard.detail")
	public ModelAndView getBoardDetail(int idx){
		ModelAndView mav = new ModelAndView();
		service.plusViewCount(idx);
		StoryBoardDTO storyDTO = service.getDetailStoryBoard(idx);
		List<StoryBoardCommentDTO> comment = serviceComment.getStoryBoardCommentList(idx);
		int countcomment = serviceComment.commentCount(idx);
		Map<String,Object> recommendMap = service.selectRecommend(idx,"board");
		List<BoardCommentRecommendDTO> list = service.selectCommentRecommend(idx);
		List<StoryBoardCommentDTO> bestList = serviceComment.getBest(idx);
		mav.addObject("commentRecommend",list);
		mav.addObject("recommend",recommendMap);		
		mav.addObject("detail", storyDTO); 
		mav.addObject("comment", comment);
		mav.addObject("countcomment", countcomment);
		mav.addObject("best",bestList);
		mav.setViewName("storyboard/StoryBoardDeatail");
		return mav;	
	}
	
	
	//게시글 추가
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="storyBoard.insert",method=RequestMethod.GET)
	public String moveStoryInsert(){
		return "storyboard/StoryBoardWrite";
	}
	
	//게시글 추가 후 게시판 전체조회로
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="storyBoard.insert",method=RequestMethod.POST)
	public String setStoryInsert(StoryBoardDTO storyDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		if(user_id!=null){
			storyDTO.setUser_id(user_id);
			String url = service.insertStoryBoard(storyDTO);		
		}
		return "redirect:storyBoard.list";					
	}
	
	
	
	//게시글 수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="storyBoard.modify",method=RequestMethod.GET)
	public ModelAndView moveStoryModify(int idx, HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		ModelAndView mav = new ModelAndView();
		StoryBoardDTO storyDTO = service.getDetailStoryBoard(idx);		
		mav.addObject("modify", storyDTO);
		mav.setViewName("storyboard/StoryBoardModify");
		return mav;	
		
		
	
	}
	//게시글 수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="storyBoard.modify",method=RequestMethod.POST)
	public String setModifyStoryBoard(StoryBoardDTO storyDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String permission = session.getAttribute("sessionPermission").toString();
		
			if(user_id!=null){
				String url = service.modifyStoryBoard(storyDTO);
			}
		
		return "redirect:storyBoard.list";					
	}
	
	//게시글 삭제
	@CheckAuth(value=auth.USER)
	@RequestMapping("storyBoard.delet")	
	public String setDeleteStoryBoard(int idx, StoryBoardDTO storyDTO, HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		storyDTO.setUser_id(user_id);
		String permission = session.getAttribute("sessionPermission").toString();
		
			if(user_id!=null){
				String url = service.deleteStoryBoard(idx);
			}
		
		return "redirect:storyBoard.list";
	}
	//게시글 신고 
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="storyBoard.report",method=RequestMethod.GET)
	public String reportStoryBoard(){
		return "storyboard/StoryBoardReport";
	}
	@CheckAuth(value=auth.USER)		
	@RequestMapping(value="storyBoard.report",method=RequestMethod.POST)
	public String reportStoryBoard(int idx, String content,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="board";
		service.insertReport(idx,user_id,content,tableName);		
		return "redirect:storyBoard.detail?idx="+idx;
	}
	
	//이미 신고한 게시물인지 확인하기
		@ResponseBody
		@RequestMapping("storyBoard.checkReport")
		public int checkReport(int idx, HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String tableName="board";
			return service.checkReport(idx,user_id,tableName);
		}
	
	
		//댓글입력
		@CheckAuth(value=auth.USER)
		@RequestMapping(value="storyBoard.commentInsert",method=RequestMethod.POST)
		public String setStoryCommentInsert(StoryBoardCommentDTO storyCommentDTO, HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			if(user_id!=null){
				storyCommentDTO.setUser_id(user_id);			
				String url = serviceComment.insertStoryBoardComment(storyCommentDTO);
			}
			return "redirect:storyBoard.detail?idx="+storyCommentDTO.getBoard_idx();					
		}
			
		//댓글 수정
		@CheckAuth(value=auth.USER)
		@RequestMapping(value="storyBoard.commentModify",method=RequestMethod.POST)
		public String moveStoryCommentModify(StoryBoardCommentDTO storyCommentDTO,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String permission = session.getAttribute("sessionPermission").toString();
			if(user_id!=null){
				int result = serviceComment.checkCommentWriter(user_id, storyCommentDTO.getIdx());
				if(permission.equals("0")){
					result=1;
				}
				if(result==1){
					storyCommentDTO.setUser_id(user_id);
					String url = serviceComment.modifyStoryBoardComment(storyCommentDTO);
				}
			}

			
			return "redirect:storyBoard.detail?idx="+storyCommentDTO.getBoard_idx();		
		}
		//댓글 삭제
		@CheckAuth(value=auth.USER)
		@RequestMapping(value="storyBoard.commentDelete",method=RequestMethod.GET)
		public String setStoryCommentDelete(int idx, int board_idx,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String permission = session.getAttribute("sessionPermission").toString();
			
				if(user_id!=null || permission.equals("0")){					
					String url = serviceComment.deleteStoryBoardComment(idx);
				}				
			
			
			return "redirect:storyBoard.detail?idx="+board_idx;
				
		}	
			
		//대댓글입력
		@CheckAuth(value=auth.USER)
		@RequestMapping(value="storyBoard.reCommentInsert",method=RequestMethod.POST)
		public String setStoryReCommentInsert(StoryBoardCommentDTO storyCommentDTO, HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			
			int indent = storyCommentDTO.getIndent();
			storyCommentDTO.setIndent(indent+1);
			if(user_id!=null){
				storyCommentDTO.setUser_id(user_id);
				String url = serviceComment.insertStoryBoardReComment(storyCommentDTO);
			}
			return "redirect:storyBoard.detail?idx="+storyCommentDTO.getBoard_idx();					
		}
		
		// 사진 업로드 Ajax 
		@RequestMapping(value="storyBoard.imageUpload",method=RequestMethod.POST)
		public @ResponseBody String setImageUpload(MultipartFile uploadFile,HttpServletRequest request){	
			String requestURL = request.getRequestURL().toString();
			String[] urlSplit =  requestURL.split("/");
			String localPath = "http://"+urlSplit[2];	
			String url = service.setImageUpload(uploadFile);
			return localPath+"/img/"+url;
		}
		//게시글 추천 추가 
		@CheckAuth(value=auth.USER)
		@ResponseBody
		@RequestMapping("storyBoard.recommend")
		public Map<String,Object> setRecommend(int idx,String recommend,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");			
			String tableName ="board";
			Map<String,Object> map = null;
			if(user_id!=null){
				int result = service.checkRecommend(idx,user_id,recommend,tableName);
				if(result==2){
					map = service.selectRecommend(idx,tableName);
					map.put("check", "already");
				}else{
					map = service.selectRecommend(idx,tableName);
					map.put("check", "success");
				}
			}
			
			
			return map;
			
		}
		
		//댓글의 추천 및 비추천
		@CheckAuth(value=auth.USER)
		@ResponseBody
		@RequestMapping("storyBoard.commentRecommend")
		public Map<String,Object> setCommentRecommend(int idx, String recommend,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String tableName="comment";
			Map<String,Object> map = null;
			if(user_id!=null){
				int result = service.checkRecommend(idx,user_id,recommend,tableName);
				if(result==2){
					map = service.selectRecommend(idx,tableName);
					map.put("check", "already");
				}else{
					map = service.selectRecommend(idx,tableName);
					map.put("check", "success");
				}
			}			
			
			return map;
		}
		
		//댓글 신고
		@CheckAuth(value=auth.USER)
		@RequestMapping(value="storyBoard.commentReport",method=RequestMethod.GET)
		public String commentReport(){
			return "storyboard/StoryBoardCommentReport";
		}
				
		@RequestMapping(value="storyBoard.commentReport",method=RequestMethod.POST)
		public String commentReport(int idx, String content, int board_idx,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String tableName="comment";
			if(user_id!=null){
				service.insertReport(idx,user_id,content,tableName);
			}
			return "redirect:storyBoard.detail?idx="+board_idx;
		}
		
		//이미 신고한 게시물인지 확인하기
		@CheckAuth(value=auth.USER)
		@ResponseBody
		@RequestMapping("storyBoard.checkCommentReport")
		public int checkCommentReport(int idx,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String tableName="comment";
			int result =  service.checkReport(idx,user_id,tableName);
			return result;
		}
		//게시글 작성자와 로그인한 계정 비교
		@CheckAuth(value=auth.USER)
		@ResponseBody
		@RequestMapping("storyBoard.checkWriter")
		public int checkWriter(int idx,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String permission = session.getAttribute("sessionPermission").toString();
			int result = service.checkWriter(user_id,idx);
			if(permission.equals("2")){
				result=0;
			}
			return result;
		}
		//댓글의 작성자와 로그인한 계정 비교
		@CheckAuth(value=auth.USER)
		@ResponseBody
		@RequestMapping("storyBoard.checkCommentWriter")
		public int checkCommentWriter(int idx,HttpSession session){
			String user_id = (String)session.getAttribute("sessionId");
			String permission = session.getAttribute("sessionPermission").toString();
			int result=0;
			if(permission.equals("0")){
				result=1;
			}else if(permission.equals("2")){
				result=0;
			}else{				
				if(user_id!=null){
					result = serviceComment.checkCommentWriter(user_id,idx);
				}else{
					result=0;
				}				
			}
			return result;
		}
		
}
