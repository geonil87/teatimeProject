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
import annotation.CheckAuth.auth;
import annotation.NoCheckLogin;
import board.dto.BoardCommentRecommendDTO;
import board.dto.PhotoBoardCommentDTO;
import board.dto.PhotoBoardDTO;
import board.dto.StoryBoardCommentDTO;
import board.dto.StoryBoardDTO;
import board.service.PhotoBoardCommentServiceImpl;
import board.service.StoryBoardCommentServiceImpl;
import board.service.StoryBoardServiceImpl;
import board.service.PhotoBoardServiceImpl;

@Controller
public class PhotoBoardController {


	
	@Autowired
	PhotoBoardServiceImpl photo;
	
	@Autowired
	PhotoBoardCommentServiceImpl photoComment;
	
	//리스트 불러오기
	@NoCheckLogin
	@RequestMapping("photoBoard.list")
    public ModelAndView getPhotoList(@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		ModelAndView mav = new ModelAndView();		
		List<PhotoBoardDTO> list = photo.getPhotoBoardList(pageNum);
		int pageNumCount = photo.getPageNum();
		mav.addObject("pageNumCount",pageNumCount);
		List<PhotoBoardDTO> best = photo.getPhotoBestList();
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("allPhotoboardlist", list);
		mav.addObject("bestList", best);
		mav.setViewName("photoboard/PhotoBoardList");
		
		return mav;

    }
	//게시판 검색기능 
	@NoCheckLogin
	@RequestMapping("photoBoard.search")
	public ModelAndView storyBoardSearch(String searchColumn, String keyword,@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
		ModelAndView mav = new ModelAndView();			
		List<PhotoBoardDTO> list = photo.getPhotoBoardSearch(searchColumn, keyword,pageNum);		
		int pageNumCount = photo.getSearchPageNum(searchColumn, keyword);
		List<PhotoBoardDTO> best = photo.getPhotoBestList();
		mav.addObject("bestList", best);
		mav.addObject("searchColumn",searchColumn);
		mav.addObject("keyword",keyword);
		mav.addObject("pageNumCount",pageNumCount);
		mav.addObject("searchList",list);
		mav.setViewName("photoboard/PhotoBoardSearch");
		return mav;
	}
	
	//게시글 추가
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.insert",method=RequestMethod.GET)
	public String movePhotoInsert(){
		
		return "photoboard/PhotoBoardWrite";
	}
	
	//게시글 추가 후 게시판 전체조회로
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.insert",method=RequestMethod.POST)
	public String setPhotoInsert(PhotoBoardDTO photoDTO ,HttpSession session){
	      
		String user_id = (String)session.getAttribute("sessionId");
	      
	      if(user_id!=null){
	    	  
	    	  photoDTO.setUser_id(user_id);
		
		String url = photo.insertPhotoBoard(photoDTO);
	    	  }
		return "redirect:photoBoard.list";					
	}
	
	//게시글 수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.modify",method=RequestMethod.GET)
	public ModelAndView movePhotoModify(int idx){
		
		ModelAndView mav = new ModelAndView();
		PhotoBoardDTO photoDTO = photo.getDetailPhotoBoard(idx);
		mav.addObject("modify", photoDTO);
		mav.setViewName("photoboard/PhotoBoardModify");
		return mav;	
		
		
	
	}
	//게시글 수정
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.modify",method=RequestMethod.POST)
	public String setModifyPhotoBoard(PhotoBoardDTO photoDTO, HttpSession session){
	      
		String user_id = (String)session.getAttribute("sessionId");
	      
	      if(user_id!=null){
	    	  
	    	  photoDTO.setUser_id(user_id);
		
		
		
	    	  String url = photo.modifyPhotoBoard(photoDTO);
	      }
		return "redirect:photoBoard.list";					
	}
	
	//게시글 삭제
	@CheckAuth(value=auth.USER)
	@RequestMapping("photoBoard.delet")
	
	public String setDeletePhotoBoard(int idx, PhotoBoardDTO photoDTO, HttpSession session){
	    String user_id = (String)session.getAttribute("sessionId");
	    photoDTO.setUser_id(user_id);
	    
	      if(user_id!=null){
	    	  	String url = photo.deletePhotoBoard(idx);
	      }
	
		return "redirect:photoBoard.list";
	}
	
	
	
	// 사진 업로드 Ajax 
	@RequestMapping(value="photoBoard.imageUpload",method=RequestMethod.POST)
	 public @ResponseBody String setImageUpload(MultipartFile uploadFile,HttpServletRequest request){
	
		//String localPath = request.getRequestURL().substring(0,25);
		String url = photo.setImageUpload(uploadFile);
		
		
		String requestURL = request.getRequestURL().toString();
		String[] urlSplit =  requestURL.split("/");
		String localPath = "http://"+urlSplit[2];		
		return localPath+"/img/photo/"+url;
	}
	
	//게시글 섬네일 조회
	@NoCheckLogin
	@RequestMapping("photoBoard.sumnail")
	public ModelAndView getPhotoSumanail(int idx){
		ModelAndView mav = new ModelAndView();
		photo.plusViewCount(idx);
		PhotoBoardDTO photoDTO = photo.getDetailPhotoBoard(idx);
		List<String> photoindex = photo.getPhotoIndex(idx);
		mav.addObject("detail", idx); 
		mav.addObject("sumnail", photoDTO);
		mav.addObject("photoindex", photoindex); 
		
		mav.setViewName("photoboard/PhotoBoardSumnail");
		return mav;	
	}
	
	
	//포토 상세 보기
	@NoCheckLogin
	@RequestMapping("photoBoard.detail")
	public ModelAndView getPhotoDetail(int idx){
		ModelAndView mav = new ModelAndView();
		//service.plusViewCount(idx);
		PhotoBoardDTO photoDTO = photo.getDetailPhotoBoard(idx);
		List<PhotoBoardCommentDTO> comment = photoComment.getPhotoBoardCommentList(idx);
		int countcomment = photoComment.commentCount(idx);
		Map<String,Object> map = photo.selectRecommend(idx,"board");
		List<BoardCommentRecommendDTO> list = photo.selectCommentRecommend(idx);
		List<PhotoBoardCommentDTO> bestList = photoComment.getBest(idx);
		mav.addObject("commentRecommend",list);
		mav.addObject("recommend",map);
		mav.addObject("detail", photoDTO); 
		mav.addObject("comment", comment);
		mav.addObject("countcomment", countcomment);
		mav.addObject("best",bestList);
		mav.setViewName("photoboard/PhotoBoardDetail2");
		return mav;	
	}
	
	//댓글입력
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.commentInsert",method=RequestMethod.POST)
	public String setPhotoCommentInsert(PhotoBoardCommentDTO photoCommentDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		if(user_id!=null){
			photoCommentDTO.setUser_id(user_id);
			String url = photoComment.insertPhotoBoardComment(photoCommentDTO);
		}
		return "redirect:photoBoard.detail?idx="+photoCommentDTO.getBoard_idx();					
	}
		
	//댓글수정	
	@RequestMapping(value="photoBoard.commentModify",method=RequestMethod.POST)
	public String moveStoryCommentModify(PhotoBoardCommentDTO photoCommentDTO,HttpSession session){
		
		String user_id = (String)session.getAttribute("sessionId");
		
		
			if(user_id!=null){
				photoCommentDTO.setUser_id(user_id);
				String url = photoComment.modifyPhotoBoardComment(photoCommentDTO);
			}			
		
		return "redirect:photoBoard.detail?idx="+photoCommentDTO.getBoard_idx();		
	}
	
		//댓글삭제
	
	@RequestMapping(value="photoBoard.commentDelete",method=RequestMethod.GET)
	public String setStoryCommentDelete(int idx, int board_idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		if(user_id!=null){	
			String url = photoComment.deletePhotoBoardComment(idx);
		}		
		return "redirect:photoBoard.detail?idx="+board_idx;	
		//return "redirect:teatime.storyBoardList";
			
	}	
		
	//대댓글입력	
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.reCommentInsert",method=RequestMethod.POST)
	public String setStoryReCommentInsert(PhotoBoardCommentDTO photoCommentDTO,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		int indent = photoCommentDTO.getIndent();
		photoCommentDTO.setIndent(indent+1);
		if(user_id!=null){
			photoCommentDTO.setUser_id(user_id);
			String url = photoComment.insertPhotoBoardReComment(photoCommentDTO);
		}
		return "redirect:photoBoard.detail?idx="+photoCommentDTO.getBoard_idx();					
	}
	
	//게시글 신고 
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.report",method=RequestMethod.GET)
	public String reportPhotoBoard(){
		return "photoboard/PhotoBoardReport";
	}
			
	@RequestMapping(value="photoBoard.report",method=RequestMethod.POST)
	public String reportPhotoBoard(int idx, String content,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="board";
		photo.insertReport(idx,user_id,content,tableName);		
		return "redirect:photoBoard.detail?idx="+idx;
	}
		
	//이미 신고한 게시물인지 확인하기
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("photoBoard.checkReport")
	public int checkReport(int idx, HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="board";
		return photo.checkReport(idx,user_id,tableName);
	}
	
	//게시글 추천 추가 
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("photoBoard.recommend")
	public Map<String,Object> setRecommend(int idx,String recommend,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");			
		String tableName ="board";
		Map<String,Object> map = null;
		if(user_id!=null){
			int result = photo.checkRecommend(idx,user_id,recommend,tableName);
			if(result==2){
				map = photo.selectRecommend(idx,tableName);
				map.put("check", "already");
			}else{
				map = photo.selectRecommend(idx,tableName);
				map.put("check", "success");
			}
		}
		
		return map;
				
	}
			
	//댓글의 추천 및 비추천
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("photoBoard.commentRecommend")
	public Map<String,Object> setCommentRecommend(int idx, String recommend,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="comment";
		Map<String,Object> map = null;
		if(user_id!=null){
			int result = photo.checkRecommend(idx,user_id,recommend,tableName);
			if(result==2){
				map = photo.selectRecommend(idx,tableName);
				map.put("check", "already");
			}else{
				map = photo.selectRecommend(idx,tableName);
				map.put("check", "success");
			}
		}	
		return map;
	}
		
	//댓글 신고
	@CheckAuth(value=auth.USER)
	@RequestMapping(value="photoBoard.commentReport",method=RequestMethod.GET)
	public String commentReport(){
		return "photoboard/PhotoBoardCommentReport";
	}
				
	@RequestMapping(value="photoBoard.commentReport",method=RequestMethod.POST)
	public String commentReport(int idx, String content, int board_idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="comment";
		if(user_id!=null){
			photo.insertReport(idx,user_id,content,tableName);
		}
		return "redirect:photoBoard.detail?idx="+board_idx;
	}
			
	//이미 신고한 게시물인지 확인하기
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("photoBoard.checkCommentReport")
	public int checkCommentReport(int idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		String tableName="comment";
		int result =  photo.checkReport(idx,user_id,tableName);
		return result;
	}
	//게시글 작성자와 로그인한 계정 비교
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("photoBoard.checkWriter")
	public int checkWriter(int idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");
		
		int result = photo.checkWriter(user_id,idx);
		return result;
	}
	//댓글의 작성자와 로그인한 계정 비교
	@CheckAuth(value=auth.USER)
	@ResponseBody
	@RequestMapping("photoBoard.checkCommentWriter")
	public int checkCommentWriter(int idx,HttpSession session){
		String user_id = (String)session.getAttribute("sessionId");		
		String permission = session.getAttribute("sessionPermission").toString();
		int result=0;		
		if(permission.equals("0")){
			result=1;
		}else{
			if(user_id!=null){
				result = photoComment.checkCommentWriter(user_id,idx);
			}else{
				result=0;
			}			
		}
		return result;
	}
	
	
	
}
