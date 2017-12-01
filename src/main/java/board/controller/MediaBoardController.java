package board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import board.dto.BoardCommentRecommendDTO;
import board.dto.MediaBoardCommentDTO;
import board.dto.MediaBoardDTO;
import board.dto.PhotoBoardDTO;
import board.service.MediaBoardCommentServiceImpl;
import board.service.MediaBoardServiceImpl;


@Controller
public class MediaBoardController {


	
	@Autowired
	MediaBoardServiceImpl service;
	
	@Autowired
	MediaBoardCommentServiceImpl serviceComment;
	
	//리스트 불러오기
	@NoCheckLogin
	@RequestMapping("mediaBoard.list")
    public ModelAndView getMediaList(@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		ModelAndView mav = new ModelAndView();
		List<MediaBoardDTO> list = service.getMediaBoardList(pageNum);
		int pageNumCount = service.getPageNum();		
		List<MediaBoardDTO> best = service.getMediaBestList();
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("allMediaboardlist", list);
		mav.addObject("bestList", best);
		mav.setViewName("mediaboard/MediaBoardList");		
		return mav;

    }
	
	//게시판 검색기능 
	@NoCheckLogin
	@RequestMapping("mediaBoard.search")
	public ModelAndView storyBoardSearch(String searchColumn, String keyword,@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
		ModelAndView mav = new ModelAndView();			
		List<MediaBoardDTO> list = service.getMediaBoardSearch(searchColumn, keyword,pageNum);		
		int pageNumCount = service.getSearchPageNum(searchColumn, keyword);
		List<MediaBoardDTO> best = service.getMediaBestList();
		mav.addObject("bestList", best);
		mav.addObject("searchColumn",searchColumn);
		mav.addObject("keyword",keyword);
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("searchList",list);
		mav.setViewName("mediaboard/MediaBoardSearch");
		return mav;
	}

	
	//게시글 추가
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.insert",method=RequestMethod.GET)
	public String moveMediaInsert(){		
		return "mediaboard/MediaBoardWrite";
	}
	
	//게시글 추가 후 게시판 전체조회로
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.insert",method=RequestMethod.POST)
	public String setMediaInsert(MediaBoardDTO MediaDTO ,HttpSession session){
	      
		String user_id = (String)session.getAttribute("sessionId");
	      
	      if(user_id!=null){
	    	  
	    	  MediaDTO.setUser_id(user_id);
		
		String url = service.insertMediaBoard(MediaDTO);
	    	  }
		return "redirect:mediaBoard.list";					
	}
	
	//게시글 수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.modify",method=RequestMethod.GET)
	public ModelAndView moveMediaModify(int idx){
		
		ModelAndView mav = new ModelAndView();
		MediaBoardDTO MediaDTO = service.getDetailMediaBoard(idx);
		mav.addObject("modify", MediaDTO);
		mav.setViewName("mediaboard/MediaBoardModify");
		return mav;	
		
		
	
	}
	//게시글 수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.modify",method=RequestMethod.POST)
	public String setModifyMediaBoard(MediaBoardDTO MediaDTO, HttpSession session){
	      
		String user_id = (String)session.getAttribute("sessionId");
	      
	      if(user_id!=null){
	    	  
	    	  MediaDTO.setUser_id(user_id);		
		
	    	  String url = service.modifyMediaBoard(MediaDTO);
	      }
		return "redirect:mediaBoard.list";					
	}
	
	//게시글 삭제
	@CheckAuth(value=auth.USER)
	@RequestMapping("mediaBoard.delete")	
	public String setDeleteMediaBoard(int idx, MediaBoardDTO MediaDTO, HttpSession session){
	      String user_id = (String)session.getAttribute("sessionId");
	      MediaDTO.setUser_id(user_id);
	      if(user_id!=null){
	    	  	String url = service.deleteMediaBoard(idx);
	      }
		return "redirect:mediaBoard.list";
	}
	
	
	
	// 사진 업로드 Ajax 
	@RequestMapping(value="mediaBoard.imageUpload",method=RequestMethod.POST)
	 public @ResponseBody String setImageUpload(MultipartFile uploadFile,HttpServletRequest request){
		String requestURL = request.getRequestURL().toString();
		String[] urlSplit =  requestURL.split("/");
		String localPath = "http://"+urlSplit[2];
		String url = service.setImageUpload(uploadFile);
		
		return localPath+"/img/media/"+url;
	}
	
	//미디어 상세 보기
	@NoCheckLogin
	@RequestMapping("mediaBoard.detail")
	public ModelAndView getMediaDetail(int idx){
		ModelAndView mav = new ModelAndView();
		service.plusViewCount(idx);
		MediaBoardDTO MediaDTO = service.getDetailMediaBoard(idx);
		List<MediaBoardCommentDTO> comment = serviceComment.getMediaBoardCommentList(idx);
		int countcomment = serviceComment.commentCount(idx);
		Map<String,Object> map = service.selectRecommend(idx,"board");
		List<BoardCommentRecommendDTO> list = service.selectCommentRecommend(idx);
		List<MediaBoardCommentDTO> bestList = serviceComment.getBest(idx);		
		mav.addObject("commentRecommend",list);
		mav.addObject("recommend",map);
		mav.addObject("detail", MediaDTO); 
		mav.addObject("comment", comment);
		mav.addObject("countcomment", countcomment);
		mav.addObject("best",bestList);
		mav.setViewName("mediaboard/MediaBoardDetail");
		return mav;	
	}
	
	//댓글입력
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.commentInsert",method=RequestMethod.POST)
	public String setMediaCommentInsert(MediaBoardCommentDTO mediaCommentDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		if(user_id!=null){
			mediaCommentDTO.setUser_id(user_id);
			String url = serviceComment.insertMediaBoardComment(mediaCommentDTO);
		}
		return "redirect:mediaBoard.detail?idx="+mediaCommentDTO.getBoard_idx();					
	}
		
	//댓글수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.commentModify",method=RequestMethod.POST)
	public String moveMediaCommentModify(MediaBoardCommentDTO mediaCommentDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		
		
			if(user_id!=null){
				mediaCommentDTO.setUser_id(user_id);
				String url = serviceComment.modifyMediaBoardComment(mediaCommentDTO);
			}
		
		return "redirect:mediaBoard.detail?idx="+mediaCommentDTO.getBoard_idx();		
	}
	
		//댓글삭제
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.commentDelete",method=RequestMethod.GET)
	public String setMediaCommentDelete(int idx, int board_idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		if(user_id!=null){	
			String url = serviceComment.deleteMediaBoardComment(idx);
		}		
		return "redirect:mediaBoard.detail?idx="+board_idx;	
		//return "redirect:teatime.storyBoardList";
			
	}	
		
	//대댓글입력	
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.reCommentInsert",method=RequestMethod.POST)
	public String setMediaReCommentInsert(MediaBoardCommentDTO mediaCommentDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		int indent = mediaCommentDTO.getIndent();
		mediaCommentDTO.setIndent(indent+1);
		if(user_id!=null){
			mediaCommentDTO.setUser_id(user_id);
			String url = serviceComment.insertMediaBoardReComment(mediaCommentDTO);
		}
		return "redirect:mediaBoard.detail?idx="+mediaCommentDTO.getBoard_idx();					
	}
	
	//게시글 신고 
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.report",method=RequestMethod.GET)
	public String reportMediaBoard(){
		return "mediaboard/MediaBoardReport";
	}
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.report",method=RequestMethod.POST)
	public String reportMediaBoard(int idx, String content,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="board";
		service.insertReport(idx,user_id,content,tableName);		
		return "redirect:mediaBoard.detail?idx="+idx;
	}
		
	//이미 신고한 게시물인지 확인하기
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("mediaBoard.checkReport")
	public int checkReport(int idx, HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="board";
		return service.checkReport(idx,user_id,tableName);
	}
	
	//게시글 추천 추가 
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("mediaBoard.recommend")
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
	@RequestMapping("mediaBoard.commentRecommend")
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
	@RequestMapping(value="mediaBoard.commentReport",method=RequestMethod.GET)
	public String commentReport(){
		return "mediaboard/MediaBoardCommentReport";
	}
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="mediaBoard.commentReport",method=RequestMethod.POST)
	public String commentReport(int idx, String content, int board_idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="comment";
		if(user_id!=null){
			service.insertReport(idx,user_id,content,tableName);
		}
		return "redirect:mediaBoard.detail?idx="+board_idx;
	}
			
	//이미 신고한 게시물인지 확인하기
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("mediaBoard.checkCommentReport")
	public int checkCommentReport(int idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="comment";
		int result =  service.checkReport(idx,user_id,tableName);
		return result;
	}
	//게시글 작성자와 로그인한 계정 비교
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("mediaBoard.checkWriter")
	public int checkWriter(int idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		
		int result = service.checkWriter(user_id,idx);
		return result;
	}
	//댓글의 작성자와 로그인한 계정 비교
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("mediaBoard.checkCommentWriter")
	public int checkCommentWriter(int idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String permission = session.getAttribute("sessionPermission").toString();
		int result=0;
		if(permission.equals("0")){
			result=1;
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
