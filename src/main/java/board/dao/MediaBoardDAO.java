package board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.dto.BoardCommentRecommendDTO;
import board.dto.MediaBoardDTO;
import board.dto.PhotoBoardDTO;
import board.mapper.MediaBoardMapper;


@Component
public class MediaBoardDAO {

	@Autowired
	SqlSession session;
	
	
	
	@Autowired
	MediaBoardMapper mapper;
	
	
	   //전체조회
	   public List<MediaBoardDTO> getAllMediaBoard(int pageNum){
	      List<MediaBoardDTO> boardlist = session.selectList("mediaboard.all",pageNum);
	      Pattern pattern  =  Pattern.compile("<iframe.+?</iframe>");
	      String result= null;
	      for(MediaBoardDTO list : boardlist){
	         String content = list.getContent();
	        
	         Matcher mediaIndex = pattern.matcher(content);
	         while(mediaIndex.find()){
	        	 result = mediaIndex.group();	        	 
	        	 result = result.split("embed/")[1].substring(0, 11);
	         }  
	        	 list.setMedia(result);      
	      }

	      return boardlist;
	   
	   }
	
	   public List<MediaBoardDTO> getMediaBestList(){
		      List<MediaBoardDTO> boardlist = session.selectList("mediaboard.best");
		      
		      Pattern pattern  =  Pattern.compile("<iframe.+?</iframe>");
		      String result= null;
		      for(MediaBoardDTO list : boardlist){
		         String content = list.getContent();		         
		         Matcher mediaContent = pattern.matcher(content);
		         
		         while(mediaContent.find()){ 
		               result = mediaContent.group();
		               result = result.split("embed/")[1].substring(0, 11);
		         }		         
		         list.setMedia(result);		   
		      }
		      
		      return boardlist;
		   
		   }
	 //게시판 검색기능
	public List<MediaBoardDTO> getMediaBoardSearch(Map<String,Object> searchMap){
	      List<MediaBoardDTO> boardlist = session.selectList("mediaboard.search",searchMap);
	      
	      Pattern pattern  =  Pattern.compile("<iframe.+?</iframe>");
	      String result= null;
	      for(MediaBoardDTO list : boardlist){
	         String content = list.getContent();		         
	         Matcher mediaContent = pattern.matcher(content);
	         
	         while(mediaContent.find()){ 
	               result = mediaContent.group();
	               result = result.split("embed/")[1].substring(0, 11);
	         }		         
	         list.setMedia(result);		   
	      } 	
	 		         
	    
	    return boardlist;
	}
	//게시판 검색 페이징을 위한 게시물의 총 갯수 구하기 
	public int getSearchPageNum(Map<String,Object> searchMap){
		return session.selectOne("mediaboard.searchPaging",searchMap);
	}
	
	//글쓰기
	public int insertMediaBoard(MediaBoardDTO mediaDTO){
			
	return session.insert("mediaboard.insert", mediaDTO);
		
	}
	
	//게시글 수정
	public int modifyMediaBoard(MediaBoardDTO mediaDTO){
		
		
		
		int result = session.update("mediaboard.modify", mediaDTO);
		
		return result;
	}
	
	
	//게시글 삭제(글번호로 삭제)
	public int deleteMediaBoard(int idx){
		session.update("mediaboard.deleteComment",idx);
		return session.update("mediaboard.delete", idx);
	}
	
	//페이징
	public int getPageNum(){
		return mapper.getPageNum();
	}
	
	//조회수 증가
	public void plusViewCount(int idx){
		mapper.plusViewCount(idx);
	}
	
	//한개조회 (글번호로 조회)
	public MediaBoardDTO getDetailMediaBoard(int idx){
				
		MediaBoardDTO mediaDTO = session.selectOne("mediaboard.detail", idx);
				
				
		//System.out.println(mediaDTO.getWdate());
		return mediaDTO;
	}

	//게시글, 댓글 신고하기
	public void insertReport(Map<String,Object> map){
		session.insert("mediaboard.insertReport",map);
	}
		
	//이미 신고한 게시물,댓글인지 확인하기
	public int checkReport(Map<String,Object> map){
		return session.selectOne("mediaboard.checkReport",map);
	}
		
	//추천 및 비추천 확인 및 insert, update		
	public int checkRecommend(Map<String,Object> map){
		Map<String,Integer> resultMap = new HashMap();
		int result=0;
		resultMap = session.selectOne("mediaboard.checkRecommend",map);
		if((Integer)session.selectOne("mediaboard.checkRecommend2",map)==1){//good이거나 bad거나 하나는 누른상태
			if(map.get("good")!=null){
				if((Integer)resultMap.get("good")==1){
					result=2;
				}else{
					result=1;
					session.update("mediaboard.updateRecommend",map);
				}					
			}else if(map.get("bad")!=null){
				if((Integer)resultMap.get("bad")==1){
					result=2;
				}else{
					result=1;
					session.update("mediaboard.updateRecommend",map);
				}
			}				
				}else{
					result=0;
					session.insert("mediaboard.insertRecommend",map);
				}			
		return result;
	}
					
	//게시글 추천, 비추천 가져오기
	public Map<String,Object> selectRecommend(Map<String,Object> map){
		Map<String,Object> resultMap = new HashMap();
		int good=session.selectOne("mediaboard.selectRecommendGood",map);
		int bad= session.selectOne("mediaboard.selectRecommendBad",map);
		resultMap.put("good", good);
		resultMap.put("bad", bad);
		return resultMap;
	}

	//댓글의 추천 및 비추천 수 가져오기
	public List<BoardCommentRecommendDTO> selectCommentRecommend(int idx){					
		List<BoardCommentRecommendDTO> resultList = new ArrayList();
		List<Integer> list = session.selectList("mediaboard.selectCommentIdx",idx);
		for(Integer i : list){						
			Map<String,Object> map = new HashMap();
			map.clear();
			map.put("tableName", "comment");
			map.put("idx", i);						
			int good =session.selectOne("mediaboard.selectRecommendGood",map);
			int bad = session.selectOne("mediaboard.selectRecommendBad",map);
			resultList.add(new BoardCommentRecommendDTO(good,bad));
		}
		return resultList;
	}
					
	public String checkWriter(int idx){
		return session.selectOne("mediaboard.checkWriter",idx);
	}


}
