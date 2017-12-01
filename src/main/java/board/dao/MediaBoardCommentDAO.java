package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.dto.MediaBoardCommentDTO;
import board.dto.StoryBoardCommentDTO;



@Component
public class MediaBoardCommentDAO {

	@Autowired
	SqlSession session;
	
	//�뙎湲�議고쉶
	public List<MediaBoardCommentDTO> getAllMediaBoardComment(int idx){
		
		List<MediaBoardCommentDTO> list2 = session.selectList("mediaboardcomment.all", idx);
		
		return list2;
	
	}
	
	//댓글 작성
	public int insertMediaBoardComment(MediaBoardCommentDTO mediaCommentDTO){
		
		return session.insert("mediaboardcomment.insert", mediaCommentDTO);
		
		}
	
	//댓글 수정
	public int modifyMediaBoardComment(MediaBoardCommentDTO mediaCommentDTO){

		return session.update("mediaboardcomment.modify", mediaCommentDTO);
		
		}
	
	
	//댓글 삭제(글번호로 삭제)
		public int deleteMediaBoardComment(int idx){
			
			return session.delete("mediaboardcomment.delete", idx);
		}
	
	//댓글 작성
	public int insertMediaBoardReComment(MediaBoardCommentDTO mediaCommentDTO){
		
		return session.insert("mediaboardcomment.reinsert", mediaCommentDTO);
		
		}
	
	//댓글세기
	public int getCommentCount(int idx){
	
		return session.selectOne("mediaboardcomment.commentcount", idx);
	
	}
	
	public String checkCommentWriter(int idx){
		return session.selectOne("mediaboardcomment.checkCommentWriter",idx);
	}
	
	//1~5위 댓글 가져오기
	public List<MediaBoardCommentDTO> getBestComment(){
		return session.selectList("mediaboardcomment.bestComment");
	}
	
	//한 게시글의 베스트 댓글 가져오기 1~3위
	public List<MediaBoardCommentDTO> getBest(int idx){
		return session.selectList("mediaboardcomment.best",idx);
	}
}
