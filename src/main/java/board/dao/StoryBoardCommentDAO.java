package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.dto.MediaBoardCommentDTO;
import board.dto.StoryBoardCommentDTO;
import board.dto.StoryBoardDTO;

@Component
public class StoryBoardCommentDAO {

	@Autowired
	SqlSession session;
	
	//�뙎湲�議고쉶
	public List<StoryBoardCommentDTO> getAllStoryBoardComment(int idx){
		
		List<StoryBoardCommentDTO> list2 = session.selectList("storyboardcomment.all", idx);
		
		return list2;
	
	}
	
	//댓글 작성
	public int insertStoryBoardComment(StoryBoardCommentDTO storyCommentDTO){
		
		return session.insert("storyboardcomment.insert", storyCommentDTO);
		
		}
	
	//댓글 수정
	public int modifyStoryBoardComment(StoryBoardCommentDTO storyCommentDTO){

		return session.update("storyboardcomment.modify", storyCommentDTO);
		
		}
	
	
	//댓글 삭제(글번호로 삭제)
		public int deleteStoryBoardComment(int idx){
			
			return session.delete("storyboardcomment.delete", idx);
		}
	
	//댓글 작성
	public int insertStoryBoardReComment(StoryBoardCommentDTO storyCommentDTO){
		
		return session.insert("storyboardcomment.reinsert", storyCommentDTO);
		
		}
	
	//댓글세기
	public int getCommentCount(int idx){		
		return session.selectOne("storyboardcomment.commentcount", idx);
		
		}
	
	public String checkCommentWriter(int idx){
		return session.selectOne("storyboardcomment.checkCommentWriter",idx);
	}
	
	//1~5위 댓글 가져오기
	public List<StoryBoardCommentDTO> getBestComment(){
		return session.selectList("storyboardcomment.bestComment");
	}
	
	//한 게시글의 베스트 댓글 가져오기 1~3위
	public List<StoryBoardCommentDTO> getBest(int idx){
		return session.selectList("storyboardcomment.best",idx);
	}
}