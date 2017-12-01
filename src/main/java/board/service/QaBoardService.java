package board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import board.dto.QaBoardDTO;

public interface QaBoardService {
	
	public List<QaBoardDTO> getQaBoardListUser(String userId, int startContent, int endContent, int condition, int range, int category);
	
	public Map<String,Integer> getPagingResultUser(String userId, int pageNum, int category, int condition);
	
	public int setQaBoardQuestion(QaBoardDTO qaBoardDTO);

	public QaBoardDTO getQuestionDetail(int idx);

	public QaBoardDTO getAnswerDetail(int qaGroup);
	
	public String setImageUpload(MultipartFile uploadFile);
	
	public int modifyQuestion(QaBoardDTO qaBoardDTO);

	public int deleteQuestion(int idx);
	

	public List<QaBoardDTO> getQaBoardListAdminOption(int condition, int startContent, int endContent, int category, int range, String searchOption, String keyword,String permission);
	public Map<String,Integer> getPagingResultAdminOption(int condition, int pageNum, int category, String searchOption, String keyword,String permission);

	public boolean setAnswer(QaBoardDTO qaBoardDTO);
	
	public boolean setQuestionCondition(int idx);
	public boolean setQuestionConditionDelete(int groupIdx);
	
	public boolean modifyAnswer(QaBoardDTO qaboardDTO);
	public boolean deleteAnswer(int idx);
	
		
}
