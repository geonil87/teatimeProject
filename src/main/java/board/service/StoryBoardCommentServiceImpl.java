package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.StoryBoardCommentDAO;
import board.dto.MediaBoardCommentDTO;
import board.dto.StoryBoardCommentDTO;
import board.dto.StoryBoardDTO;

 
@Service
public class StoryBoardCommentServiceImpl implements StoryBoardCommentService{



	@Autowired
	StoryBoardCommentDAO storyBoardCommentDAO;
	
	//댓글불러오기
	
	public List<StoryBoardCommentDTO> getStoryBoardCommentList(int idx){
	return storyBoardCommentDAO.getAllStoryBoardComment(idx);
	}
	
	
	//댓글 작성하기
	public String insertStoryBoardComment(StoryBoardCommentDTO storyCommentDTO) {
		int result =storyBoardCommentDAO.insertStoryBoardComment(storyCommentDTO);
		
		String url = "";
		int detailidx = storyCommentDTO.getIdx();
		
		if(result == 1){
			url = "storyboard/teatime.storyBoardDetail";
		}
		else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 수정하기
	public String modifyStoryBoardComment(StoryBoardCommentDTO storyCommentDTO) {
		
		int result =storyBoardCommentDAO.modifyStoryBoardComment(storyCommentDTO);
		
		String url = "";
		int detailidx = storyCommentDTO.getIdx();
		
		if(result == 1){
			url = "storyboard/teatime.storyBoardDetail";
		}
		else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return url;
	}
	
	
	
	//댓글 삭제하기
	public String deleteStoryBoardComment(int idx){
		int result = storyBoardCommentDAO.deleteStoryBoardComment(idx);

		String url = "";
		if(result == 1 ){
			url = "storyboard/teatime.storyBoardDetail";
		}else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 작성하기
		public String insertStoryBoardReComment(StoryBoardCommentDTO storyCommentDTO) {
			int result =storyBoardCommentDAO.insertStoryBoardReComment(storyCommentDTO);
			
			String url = "";
			int detailidx = storyCommentDTO.getIdx();
			
			if(result == 1){
				url = "storyboard/teatime.storyBoardDetail";
			}
			else{
				url = "storyboard/StoryBoardCommentWriteFail";
			}
			return url;
		}
		
		//댓글세기
		public int commentCount(int idx) {
			int count =storyBoardCommentDAO.getCommentCount(idx);
			
			return count;
		}
		
		//댓글의 작성자 와 로그인한 계정 비교
		public int checkCommentWriter(String user_id, int idx){
			String commentWriter = storyBoardCommentDAO.checkCommentWriter(idx);
			int result=0;
			if(user_id.equalsIgnoreCase(commentWriter)){
				result = 1;
			}else{
				result=2;
			}
			return result;
		}
		
		//1~5위 베스트 댓글 가져오기
		public List<StoryBoardCommentDTO> getBestComment(){
			return storyBoardCommentDAO.getBestComment();
		}
		
		//한 게시글의 베스트 댓글 가져오기 1~3위
		public List<StoryBoardCommentDTO> getBest(int idx){
			return storyBoardCommentDAO.getBest(idx);
		}
	
	
}
	

