package board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import board.dto.NoticesBoardDTO;

public interface NoticesBoardService {
	
	//전체 조회
	public List<NoticesBoardDTO> getNoticesList(int pageNum);
	
	//페이징 수 가져오기
	public int getPageNum();
	
	//공지 추가
	public int insertNoticeBoard(NoticesBoardDTO noticesDTO);
	
	//게시글 한개 조회
	public NoticesBoardDTO getNoticesDetail(int idx);
	
	//게시글 조회수 증가
	public void plusViewCount(int idx);
	
	public String setImageUpload(MultipartFile uploadFile);
	
	//수정
	public int modifyNoticesBoard(NoticesBoardDTO noticesDTO);
	
	//삭제
	public int deleteNoticesBoard(int idx);
	
	//중요 공지 가져오기
	public List<NoticesBoardDTO> getImportanceList();
}
