package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.dto.PhotoBoardCommentDTO;
import board.dto.PhotoBoardDTO;
import board.dto.StoryBoardCommentDTO;

@Component
public class PhotoBoardCommentDAO {

	@Autowired
	SqlSession session;
	
	//�뙎湲�議고쉶
	public List<PhotoBoardCommentDTO> getAllPhotoBoardComment(int idx){
		
		List<PhotoBoardCommentDTO> list2 = session.selectList("photoboardcomment.all", idx);
		
		return list2;
	
	}
	
	//댓글 작성
	public int insertPhotoBoardComment(PhotoBoardCommentDTO photoCommentDTO){
		
		return session.insert("photoboardcomment.insert", photoCommentDTO);
		
		}
	
	//댓글 수정
	public int modifyPhotoBoardComment(PhotoBoardCommentDTO photoCommentDTO){

		return session.update("photoboardcomment.modify", photoCommentDTO);
		
		}
	
	
	//댓글 삭제(글번호로 삭제)
		public int deletePhotoBoardComment(int idx){
			
			return session.delete("photoboardcomment.delete", idx);
		}
	
	//댓글 작성
	public int insertPhotoBoardReComment(PhotoBoardCommentDTO PhotoCommentDTO){
		
		return session.insert("photoboardcomment.reinsert", PhotoCommentDTO);
		
		}
	
	//댓글세기
	public int getCommentCount(int idx){
	
		return session.selectOne("photoboardcomment.commentcount", idx);
	
	}
	
	public String checkCommentWriter(int idx){
		return session.selectOne("photoboardcomment.checkCommentWriter",idx);
	}
	
	//전체 게시글 1~5위 댓글 가져오기
	public List<PhotoBoardCommentDTO> getBestComment(){
		return session.selectList("photoboardcomment.bestComment");
	}
	
	//한 게시글의 베스트 댓글 가져오기 1~3위
	public List<PhotoBoardCommentDTO> getBest(int idx){
		return session.selectList("photoboardcomment.best",idx);
	}
	
}
