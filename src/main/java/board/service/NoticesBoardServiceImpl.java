package board.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import board.dao.NoticesBoardDAO;
import board.dto.NoticesBoardDTO;

@Service
public class NoticesBoardServiceImpl implements NoticesBoardService {
	@Autowired
	NoticesBoardDAO noticesDAO;
	//전체조회
	public List<NoticesBoardDTO> getNoticesList(int pageNum){
		return noticesDAO.getNoticesList(pageNum);
	}
	
	//게시판 페이지 구하기
	public int getPageNum(){
		int allBoardCount = noticesDAO.getPageNum();
		int onePageBoardCount = 20;
		int pageNum = allBoardCount/onePageBoardCount;
		if(allBoardCount%onePageBoardCount>0){
			pageNum++;
		}		
		return pageNum;
	}
	
	//게시글 추가
	public int insertNoticeBoard(NoticesBoardDTO noticesDTO){
		return noticesDAO.insertNoticesBoard(noticesDTO);
	}
	
	//게시글 한개 조회
	public NoticesBoardDTO getNoticesDetail(int idx){
		return noticesDAO.getNoticesDetail(idx);
	}
	
	//조회수 증가 
	public void plusViewCount(int idx){
		noticesDAO.plusViewCount(idx);
	}
	
	// 이미지 서버 업로드
    public String setImageUpload(MultipartFile uploadFile) {
       SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd-HH-mm-ss", Locale.KOREA );
       String today = formatter.format ( new Date () );
       UUID uid = UUID.randomUUID();
       String original = uploadFile.getOriginalFilename();
       String jpg = original.substring(original.length()-4, original.length());
       String saveName = uid.toString()+"_"+today+jpg;
       String uploadPath = "C:/image/notices";
       File target = new File(uploadPath, saveName);
       if(!target.exists()){
      	 target.mkdir();
       }  
	          try {
	         FileCopyUtils.copy(uploadFile.getBytes(), target);
	         
	          } catch (IOException e) {
	            e.printStackTrace();
	         }
    
        String url = saveName;
        
       return url;
    }
    
    
    //수정
  	public int modifyNoticesBoard(NoticesBoardDTO noticesDTO){
  		return noticesDAO.modifyNoticesBoard(noticesDTO);
  	}
  	
  	//삭제
  	public int deleteNoticesBoard(int idx){
  		return noticesDAO.deleteNoticesBoard(idx);
  	}
  	
  	//중요 공지 가져오기
  	public List<NoticesBoardDTO> getImportanceList(){
  		return noticesDAO.getImportanceList();
  	}
}
