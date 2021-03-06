package board.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import board.dao.MediaBoardDAO;
import board.dto.BoardCommentRecommendDTO;
import board.dto.MediaBoardDTO;
import board.dto.PhotoBoardDTO;


@Service
public class MediaBoardServiceImpl implements MediaBoardService{

	@Autowired
	MediaBoardDAO mediaBoardDAO;
	
	
	
	//게시글 전체조회
	public List<MediaBoardDTO> getMediaBoardList(int pageNum) {
		return mediaBoardDAO.getAllMediaBoard(pageNum);
		
	}
	
	//베스트 글 불러오기
	public List<MediaBoardDTO> getMediaBestList() {
		return mediaBoardDAO.getMediaBestList();
		
	}
		
	//게시판 검색 결과 가져오기
	public List<MediaBoardDTO> getMediaBoardSearch(String searchColumn, String keyword,int pageNum){
		Map<String,Object> searchMap = new HashMap<String,Object>();
		if(searchColumn.equals("제목")){
			searchMap.put("title", "title");
		}else if(searchColumn.equals("내용")){
			searchMap.put("content", "content");
		}else if(searchColumn.equals("작성자")){
			searchMap.put("user_nick", "user_nick");
		}else{
			searchMap.put("all", "all");			
		}
		searchMap.put("pageNum", pageNum);
		searchMap.put("keyword", "%"+keyword+"%");
		
		return mediaBoardDAO.getMediaBoardSearch(searchMap);
	}
	//게시판 검색결과 페이징
	public int getSearchPageNum(String searchColumn, String keyword){
		
		Map<String,Object> searchMap = new HashMap<String,Object>();		
		if(searchColumn.equals("제목")){
			searchMap.put("title", "title");
		}else if(searchColumn.equals("내용")){
			searchMap.put("content", "content");
		}else if(searchColumn.equals("작성자")){
			searchMap.put("user_nick", "user_nick");
		}else{
			searchMap.put("all", "all");			
		}
		searchMap.put("keyword", "%"+keyword+"%");
		int searchBoardCount = mediaBoardDAO.getSearchPageNum(searchMap);
		int onePageBoardCount = 9;
		int pageNum = searchBoardCount/onePageBoardCount;
		if(searchBoardCount%onePageBoardCount>0){
			pageNum++;
		}		
		return pageNum;
	}	
		
	
	
	//게시글 추가
	public String insertMediaBoard(MediaBoardDTO mediaDTO) {
		int result =mediaBoardDAO.insertMediaBoard(mediaDTO);
		
		String url = "";
		if(result == 1){
			url = "photoboard/PhotoBoardList";
		}
		else{
			url = "photoboard/PhotoBoardWriteFail";
		}
		return url;
	}
	
	//게시글 수정
	public String modifyMediaBoard(MediaBoardDTO mediaDTO){
		int result = mediaBoardDAO.modifyMediaBoard(mediaDTO);
		
		String url = "";
		if(result == 1){
			url = "photoboard/PhotoBoardList";
		}else{
			url = "photoboard/PhotoBoardWriteFail";
		}
		return url;
	}


	//게시글 삭제
	public String deleteMediaBoard(int idx){
		int result = mediaBoardDAO.deleteMediaBoard(idx);
		
		String url = "";
		if(result == 1){
			url = "photoboard/photoBoardDelete";
		}else{
			url = "photoboard/photoBoardWriteFail";
		}
		return url;
	}
	
	
	// 이미지 서버 업로드
    public String setImageUpload(MultipartFile uploadFile) {
       UUID uid = UUID.randomUUID();
       
       SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd-HH-mm-ss", Locale.KOREA );
       String today = formatter.format ( new Date () );
       
      // String original = uploadFile.getOriginalFilename();
       String original = uploadFile.getOriginalFilename();
       String jpg = original.substring(original.length()-4, original.length());
       String saveName = uid.toString()+"_"+today+jpg;
       String uploadPath = "C:/image/media";
       
       File target = new File(uploadPath, saveName);
       try {
    	   FileCopyUtils.copy(uploadFile.getBytes(), target);	    
	   } catch (IOException e) {
		   e.printStackTrace();
	   }
        String url = saveName;

       return url;
    }
    
    //게시판 페이지 갯수 구하기
    public int getPageNum(){
    	int allBoardCount = mediaBoardDAO.getPageNum();
    	int onePageBoardCount = 9;
    	int pageNum = allBoardCount/onePageBoardCount;
    	if(allBoardCount%onePageBoardCount>0){
    		pageNum++;
    	}		
    	return pageNum;
    }
	
  	//조회수
  	public void plusViewCount(int idx){
		mediaBoardDAO.plusViewCount(idx);
	}	
  		
  	//게시글 한개 조회
  	public MediaBoardDTO getDetailMediaBoard(int idx) {
  		return mediaBoardDAO.getDetailMediaBoard(idx);
  	}
  		
  	
	
	//게시글 신고하기
	public void insertReport(int idx,String user_id,String content,String tableName){
		Map<String,Object> map = new HashMap();
		map.put("idx", idx);
		map.put("user_id", user_id);
		map.put("content", content);
		map.put("tableName", tableName);
		mediaBoardDAO.insertReport(map);
	}
	
	//이미 신고한 게시물인지 확인하기
	public int checkReport(int idx, String user_id,String tableName){
		Map<String,Object> map = new HashMap();
		map.put("idx", idx);
		map.put("user_id", user_id);
		map.put("tableName", tableName);
		return mediaBoardDAO.checkReport(map);
	}
	
	//추천,비추천 확인하기
	public int checkRecommend(int idx, String user_id, String recommend,String tableName){
		Map<String,Object> map = new HashMap();			
		map.put("idx", idx);
		map.put("user_id",user_id);
		map.put("tableName",tableName);
		if(recommend.equals("good")){
			map.put("good", 1);
		}else if(recommend.equals("bad")){
			map.put("bad", 1);
		}
			
		return mediaBoardDAO.checkRecommend(map);
	}
	
	//추천, 비추천 가져오기
	public Map<String,Object> selectRecommend(int idx,String tableName){
		Map<String,Object> map = new HashMap();			
		map.put("idx", idx);
		map.put("tableName",tableName);
		return mediaBoardDAO.selectRecommend(map);
	}
	//댓글의 추천수
    public List<BoardCommentRecommendDTO> selectCommentRecommend(int idx){			    	 
  	 return mediaBoardDAO.selectCommentRecommend(idx);
    }
    
    public int checkWriter(String user_id,int idx){
  	  String writer = mediaBoardDAO.checkWriter(idx);
  	  int result = 0;
  	  if(user_id.equalsIgnoreCase(writer)){
  		  result=1;
  	  }else{
  		  result=2;
  	  }
  	  return result;
    }
}
