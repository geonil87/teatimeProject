package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.PhotoBoardCommentDAO;
import board.dto.PhotoBoardCommentDTO;
import board.dto.PhotoBoardDTO;
import board.dto.StoryBoardCommentDTO;

 
@Service
public class PhotoBoardCommentServiceImpl implements PhotoBoardCommentService{



	@Autowired
	PhotoBoardCommentDAO PhotoBoardCommentDAO;
	
	//댓글불러오기
	
	public List<PhotoBoardCommentDTO> getPhotoBoardCommentList(int idx){
	return PhotoBoardCommentDAO.getAllPhotoBoardComment(idx);
	}
	
	
	//댓글 작성하기
	public String insertPhotoBoardComment(PhotoBoardCommentDTO PhotoCommentDTO) {
		int result =PhotoBoardCommentDAO.insertPhotoBoardComment(PhotoCommentDTO);
		
		String url = "";
		int detailidx = PhotoCommentDTO.getIdx();
		
		if(result == 1){
			url = "Photoboard/teatime.PhotoBoardDetail";
		}
		else{
			url = "Photoboard/PhotoBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 수정하기
	public String modifyPhotoBoardComment(PhotoBoardCommentDTO PhotoCommentDTO) {
		
		int result =PhotoBoardCommentDAO.modifyPhotoBoardComment(PhotoCommentDTO);
		
		String url = "";
		int detailidx = PhotoCommentDTO.getIdx();
		
		if(result == 1){
			url = "Photoboard/teatime.PhotoBoardDetail";
		}
		else{
			url = "Photoboard/PhotoBoardCommentWriteFail";
		}
		return url;
	}
	
	
	
	//댓글 삭제하기
	public String deletePhotoBoardComment(int idx){
		int result = PhotoBoardCommentDAO.deletePhotoBoardComment(idx);
		
		String url = "";
		if(result == 1){
			url = "Photoboard/teatime.PhotoBoardDetail";
		}else{
			url = "Photoboard/PhotoBoardCommentWriteFail";
		}
		return url;
	}
	
	//댓글 작성하기
	public String insertPhotoBoardReComment(PhotoBoardCommentDTO PhotoCommentDTO) {
		int result =PhotoBoardCommentDAO.insertPhotoBoardReComment(PhotoCommentDTO);
		
		String url = "";
		int detailidx = PhotoCommentDTO.getIdx();
		
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
		int count =PhotoBoardCommentDAO.getCommentCount(idx);
		
		return count;
	}
		
	//댓글의 작성자 와 로그인한 계정 비교
	public int checkCommentWriter(String user_id, int idx){
		String commentWriter = PhotoBoardCommentDAO.checkCommentWriter(idx);
		int result=0;
		if(user_id.equalsIgnoreCase(commentWriter)){
			result = 1;
		}else{
			result=2;
		}
		return result;
	}
	
	//1~5위 베스트 댓글 가져오기
	public List<PhotoBoardCommentDTO> getBestComment(){
		return PhotoBoardCommentDAO.getBestComment();
	}
	
	//한 게시글의 베스트 댓글 가져오기 1~3위
	public List<PhotoBoardCommentDTO> getBest(int idx){
		return PhotoBoardCommentDAO.getBest(idx);
	}
}	

