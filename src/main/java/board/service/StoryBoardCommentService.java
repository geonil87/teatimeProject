package board.service;

import java.util.List;

import board.dto.MediaBoardCommentDTO;
import board.dto.StoryBoardCommentDTO;


public interface StoryBoardCommentService {
	
	//댓글불러오기
	public List<StoryBoardCommentDTO> getStoryBoardCommentList(int idx);
	
	//댓글작성
	public String insertStoryBoardComment(StoryBoardCommentDTO storyCommantDTO);
	
	//댓글 수정
	public String modifyStoryBoardComment(StoryBoardCommentDTO storyCommantDTO);
	
	//댓글삭제
	public String deleteStoryBoardComment(int idx);
	
	//대댓글작성
	public String insertStoryBoardReComment(StoryBoardCommentDTO storyCommantDTO);
	
	//댓글세기
	public int commentCount(int idx);

	//댓글의 작성자 와 로그인한 계정 비교
	public int checkCommentWriter(String user_id, int idx);
	
	//1~5위 베스트 댓글 가져오기
	public List<StoryBoardCommentDTO> getBestComment();
	
	//한 게시글의 베스트 댓글 가져오기 1~3위
	public List<StoryBoardCommentDTO> getBest(int idx);
}
 