package board.service;

import java.util.List;
import java.util.Map;

import board.dto.PhotoBoardDTO;
import board.dto.BoardCommentRecommendDTO;


public interface PhotoBoardService {

	//전체조회
	public List<PhotoBoardDTO> getPhotoBoardList(int pageNum);
	
	//베스트 글 불러오기
	public List<PhotoBoardDTO> getPhotoBestList();
	
	//게시글 추가
	public String insertPhotoBoard(PhotoBoardDTO photoDTO);
	
	//게시글 수정
	public String modifyPhotoBoard(PhotoBoardDTO photoDTO);
		
	//게시글 삭제
	public String deletePhotoBoard(int idx);
	
	
	//게시글 페이징
	public int getPageNum();
	
	//조회수
	public void plusViewCount(int idx);
	
	//게시글 한개 조회
	public PhotoBoardDTO getDetailPhotoBoard(int idx);
	
	//섬네일 이미지 리스트
	public List<String> getPhotoIndex(int idx);
	
	//게시글 신고하기
	public void insertReport(int idx,String user_id,String content, String tableName);
	
	//이미 신고한 게시물인지 확인하기
	public int checkReport(int idx,String user_id,String tableName);
	
	//추천 비추천 했는지 확인하기
	public int checkRecommend(int idx, String user_id, String recommend,String tableName);
		
	//recommend 가져오기
	public Map<String,Object> selectRecommend(int idx,String tableName);
	
	//댓글의 추천 비추천 가져오기
	public List<BoardCommentRecommendDTO> selectCommentRecommend(int idx);
	
	//게시글의 작성자와 로그인한 계정의 비교
	public int checkWriter(String user_id,int idx);
	
	//게시글 검색
	public List<PhotoBoardDTO> getPhotoBoardSearch(String searchColumn, String keyword,int pageNum);
	
	//게시글 검색 페이징
	public int getSearchPageNum(String searchColumn, String keyword);
	
	//메인화면 실시간 3개 가져오기
	public List<PhotoBoardDTO> getRealTimePhoto();
}
