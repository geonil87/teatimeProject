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
import board.dto.PhotoBoardDTO;
import board.dto.StoryBoardDTO;
import board.mapper.PhotoBoardMapper;
import board.mapper.StoryBoardMapper;

@Component
public class PhotoBoardDAO {

	@Autowired
	SqlSession session;
	
	@Autowired
	StoryBoardMapper mapper;
	
	@Autowired
	PhotoBoardMapper photomapper;
	
	
	   //전체조회
	   public List<PhotoBoardDTO> getAllPhotoBoard(int pageNum){
	      List<PhotoBoardDTO> boardlist = session.selectList("photoboard.all",pageNum);
	      Pattern pattern  =  Pattern.compile("<img[^>]*[\"']?([^>\"']+)[\"']?[^>]*>");

	      for(PhotoBoardDTO list : boardlist){
	         String content = list.getContent();
	         String content2 = list.getContent();
	         Matcher photocontent = pattern.matcher(content);
	         Matcher photocontent2 = pattern.matcher(content2);
	         String imgTag = null;
	         String text = null;

	         if(photocontent.find()){ 
	               imgTag = photocontent.group().split("src")[1].split("\"")[1];	               
	            }
	         while (photocontent2.find()) {
	            text = photocontent.replaceAll("");
	         }

	          list.setPhoto(imgTag);
	          list.setText(text);
	         
	      }

	      return boardlist;
	   
	   }
	   
	   //베스트
	   public List<PhotoBoardDTO> getPhotoBestList(){
		      List<PhotoBoardDTO> boardlist = session.selectList("photoboard.best");
		      
		      Pattern pattern  =  Pattern.compile("<img[^>]*[\"']?([^>\"']+)[\"']?[^>]*>");

		      for(PhotoBoardDTO list : boardlist){
		         String content = list.getContent();
		         String content2 = list.getContent();
		         Matcher photocontent = pattern.matcher(content);
		         Matcher photocontent2 = pattern.matcher(content2);
		         String imgTag = null;
		         String text = null;

		         if(photocontent.find()){ 
		               imgTag = photocontent.group().split("src")[1].split("\"")[1];;
		            }
		         while(photocontent2.find()) {
		            text = photocontent.replaceAll("");
		         }

		          list.setPhoto(imgTag);
		          list.setText(text);
		         
		      }
		      
		      return boardlist;
		   
		   }
	   
	   
		//게시판 검색기능
		public List<PhotoBoardDTO> getPhotoBoardSearch(Map<String,Object> searchMap){
			List<PhotoBoardDTO> boardlist = session.selectList("photoboard.search",searchMap);
			Pattern pattern  =  Pattern.compile("<img[^>]*[\"']?([^>\"']+)[\"']?[^>]*>");

		      for(PhotoBoardDTO list : boardlist){
		         String content = list.getContent();
		         String content2 = list.getContent();
		         Matcher photocontent = pattern.matcher(content);
		         Matcher photocontent2 = pattern.matcher(content2);
		         String imgTag = null;
		         String text = null;

		         if(photocontent.find()){ 
		               imgTag = photocontent.group().split("src")[1].split("\"")[1];	               
		            }
		         while (photocontent2.find()) {
		            text = photocontent.replaceAll("");
		         }

		         list.setPhoto(imgTag);
		         list.setText(text);
		         
		      }
			return boardlist;
		}
		//게시판 검색 페이징을 위한 게시물의 총 갯수 구하기 
		public int getSearchPageNum(Map<String,Object> searchMap){
			return session.selectOne("photoboard.searchPaging",searchMap);
		}   
	
	
	//글쓰기
	public int insertPhotoBoard(PhotoBoardDTO photoDTO){
			
	return session.insert("photoboard.insert", photoDTO);
		
	}
	
	//게시글 수정
	public int modifyPhotoBoard(PhotoBoardDTO photoDTO){
		
		
		
		int result = session.update("photoboard.modify", photoDTO);
		
		return result;
	}
	
	
	//게시글 삭제(글번호로 삭제)
	public int deletePhotoBoard(int idx){
		session.update("photoboard.deleteComment",idx);
		return session.update("photoboard.delete", idx);
	}
	
	//페이징
	public int getPageNum(){
		return photomapper.getPhotoPageNum();
	}
	
	//조회수 증가
			public void plusViewCount(int idx){
				photomapper.plusViewCount(idx);
			}
	
	//한개조회 (글번호로 조회)
	public PhotoBoardDTO getDetailPhotoBoard(int idx){
				
		PhotoBoardDTO photoDTO = session.selectOne("photoboard.detail", idx);
				
				
		//System.out.println(photoDTO.getWdate());
		return photoDTO;
	}
	
	
	public List<String> getPhotoIndex(int idx){
		Pattern pattern  =  Pattern.compile("<img[^>]*[\'\"]?([^>\'\"]+)[\'\"]?[^>]*>");
	    //Pattern pattern2  =  Pattern.compile("\"http[^>][\'\"]?([^>\'\"]+)[\'\"]?[^>]*\"");
		List<String> photoindex = new ArrayList<String>();
	    //String imgtag = null;
	    String loadcontent = session.selectOne("photoboard.sumnail", idx);
	    
	    Matcher imgfind = pattern.matcher(loadcontent);      
	    while(imgfind.find()){
	       String imgtag = imgfind.group().split("src")[1].split("\"")[1];
	       	    	
	       photoindex.add(imgtag);   
	    }
	    for(String index : photoindex){
	    //System.out.println("index"+index);
	    }
	    return photoindex;
	}
	
	//게시글, 댓글 신고하기
	public void insertReport(Map<String,Object> map){
		session.insert("photoboard.insertReport",map);
	}
		
	//이미 신고한 게시물,댓글인지 확인하기
	public int checkReport(Map<String,Object> map){
		return session.selectOne("photoboard.checkReport",map);
	}
		
	//추천 및 비추천 확인 및 insert, update		
	public int checkRecommend(Map<String,Object> map){
		Map<String,Integer> resultMap = new HashMap();
		int result=0;
		resultMap = session.selectOne("photoboard.checkRecommend",map);
		if((Integer)session.selectOne("photoboard.checkRecommend2",map)==1){//good이거나 bad거나 하나는 누른상태
			if(map.get("good")!=null){
				if((Integer)resultMap.get("good")==1){
					result=2;
				}else{
					result=1;
					session.update("photoboard.updateRecommend",map);
				}					
			}else if(map.get("bad")!=null){
				if((Integer)resultMap.get("bad")==1){
					result=2;
				}else{
					result=1;
					session.update("photoboard.updateRecommend",map);
				}
			}				
				}else{
					result=0;
					session.insert("photoboard.insertRecommend",map);
				}			
		return result;
	}
					
	//게시글 추천, 비추천 가져오기
	public Map<String,Object> selectRecommend(Map<String,Object> map){
		Map<String,Object> resultMap = new HashMap();
		int good=session.selectOne("photoboard.selectRecommendGood",map);
		int bad= session.selectOne("photoboard.selectRecommendBad",map);
		resultMap.put("good", good);
		resultMap.put("bad", bad);
		return resultMap;
	}

	//댓글의 추천 및 비추천 수 가져오기
	public List<BoardCommentRecommendDTO> selectCommentRecommend(int idx){					
		List<BoardCommentRecommendDTO> resultList = new ArrayList();
		List<Integer> list = session.selectList("photoboard.selectCommentIdx",idx);
		for(Integer i : list){						
			Map<String,Object> map = new HashMap();
			map.clear();
			map.put("tableName", "comment");
			map.put("idx", i);						
			int good =session.selectOne("photoboard.selectRecommendGood",map);
			int bad = session.selectOne("photoboard.selectRecommendBad",map);
			resultList.add(new BoardCommentRecommendDTO(good,bad));
		}
		return resultList;
	}
					
	public String checkWriter(int idx){
		return session.selectOne("photoboard.checkWriter",idx);
	}
	
	//메인화면 실시간 3개 가져오기
	public List<PhotoBoardDTO> getRealTimePhoto(){
		List<PhotoBoardDTO> boardlist = session.selectList("photoboard.realTimePhoto");
		 Pattern pattern  =  Pattern.compile("<img[^>]*[\"']?([^>\"']+)[\"']?[^>]*>");

	      for(PhotoBoardDTO list : boardlist){
	         String content = list.getContent();
	         String content2 = list.getContent();
	         Matcher photocontent = pattern.matcher(content);
	         Matcher photocontent2 = pattern.matcher(content2);
	         String imgTag = null;
	         String text = null;

	         if(photocontent.find()){ 
	               imgTag = photocontent.group().split("src")[1].split("\"")[1];;
	            }
	         while(photocontent2.find()) {
	            text = photocontent.replaceAll("");
	         }

	          list.setPhoto(imgTag);
	          list.setText(text);
	         
	      }
	      return boardlist;
	}


}
