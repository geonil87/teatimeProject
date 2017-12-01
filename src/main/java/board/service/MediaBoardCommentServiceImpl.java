package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.MediaBoardCommentDAO;
import board.dto.MediaBoardCommentDTO;
import board.dto.PhotoBoardCommentDTO;



 
@Service
public class MediaBoardCommentServiceImpl implements MediaBoardCommentService{



	@Autowired
	MediaBoardCommentDAO mediaCommentDAO;
	
	//댓글불러오기
	
	public List<MediaBoardCommentDTO> getMediaBoardCommentList(int idx){
	return mediaCommentDAO.getAllMediaBoardComment(idx);
	}
	
	
	//댓글 작성하기
	public String insertMediaBoardComment(MediaBoardCommentDTO mediaCommentDTO) {
		int result =mediaCommentDAO.insertMediaBoardComment(mediaCommentDTO);
		
		String url = "";
		int detailidx = mediaCommentDTO.getIdx();
		
		if(result == 1){
			url = "mediaboard/MediaBoardDetail";
		}
		else{
			url = "mediaboard/MediaBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 수정하기
	public String modifyMediaBoardComment(MediaBoardCommentDTO mediaCommentDTO) {
		
		int result =mediaCommentDAO.modifyMediaBoardComment(mediaCommentDTO);
		
		String url = "";
		int detailidx = mediaCommentDTO.getIdx();
		
		if(result == 1){
			url = "mediaboard/teatime.PhotoBoardDetail";
		}
		else{
			url = "mediaboard/MediaBoardCommentWriteFail";
		}
		return url;
	}
	
	
	
	//댓글 삭제하기
	public String deleteMediaBoardComment(int idx){
		int result = mediaCommentDAO.deleteMediaBoardComment(idx);
		
		String url = "";
		if(result == 1){
			url = "mediaboard/teatime.PhotoBoardDetail";
		}else{
			url = "Photoboard/PhotoBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 작성하기
	public String insertMediaBoardReComment(MediaBoardCommentDTO mediaCommentDTO) {
		int result =mediaCommentDAO.insertMediaBoardReComment(mediaCommentDTO);
		
		String url = "";
		int detailidx = mediaCommentDTO.getIdx();
		
		if(result == 1){
			url = "Photoboard/teatime.PhotoBoardDetail";
		}
		else{
			url = "Photoboard/PhotoBoardCommentWriteFail";
		}
		return url;
	}
		
	//댓글세기
	public int commentCount(int idx) {
		int count =mediaCommentDAO.getCommentCount(idx);
		
		return count;
	}
		
	//댓글의 작성자 와 로그인한 계정 비교
	public int checkCommentWriter(String user_id, int idx){
		String commentWriter = mediaCommentDAO.checkCommentWriter(idx);
		int result=0;
		if(user_id.equalsIgnoreCase(commentWriter)){
			result = 1;
		}else{
			result=2;
		}
		return result;
	}
	//1~5위 베스트 댓글 가져오기
	public List<MediaBoardCommentDTO> getBestComment(){
		return mediaCommentDAO.getBestComment();
	}
	
	//한 게시글의 베스트 댓글 가져오기 1~3위
	public List<MediaBoardCommentDTO> getBest(int idx){
		return mediaCommentDAO.getBest(idx);
	}
}
	

