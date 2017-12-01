package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.dto.NoticesBoardDTO;

@Component
public class NoticesBoardDAO {
	@Autowired
	SqlSession session;
	
	//전체조회
	public List<NoticesBoardDTO> getNoticesList(int pageNum){
		return session.selectList("notices.all",pageNum);
	}
	
	//게시판 페이징을 위한 게시물의 총 갯수 구하기
	public int getPageNum(){
		return session.selectOne("notices.paging");
	}
	
	//공지 추가
	public int insertNoticesBoard(NoticesBoardDTO noticesDTO){
		return session.insert("notices.insert",noticesDTO);
	}
	
	//한개 조회
	public NoticesBoardDTO getNoticesDetail(int idx){		
		return session.selectOne("notices.detail",idx);
	}
	
	//조회수 증가
	public void plusViewCount(int idx){
		session.update("notices.plus",idx);
	}
	
	//수정
  	public int modifyNoticesBoard(NoticesBoardDTO noticesDTO){
  		return session.update("notices.modify",noticesDTO);
  	}
  	
  	//삭제
  	public int deleteNoticesBoard(int idx){
  		return session.update("notices.delete",idx);
  	}
  	
  	//중요 공지 가져오기
  	public List<NoticesBoardDTO> getImportanceList(){
  		return session.selectList("notices.importance");
  	}
	
}
