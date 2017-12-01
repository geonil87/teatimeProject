package board.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import board.dao.QaBoardDAO;
import board.dto.QaBoardDTO;
import board.support.Paging;

@Service("qaBoardService")
public class QaBoardServiceImpl implements QaBoardService {

	@Autowired
	Paging paging;
	
	@Autowired
	QaBoardDAO dao;

	public List<QaBoardDTO> getQaBoardListUser(String userId, int startContent, int endContent, int condition, int range, int category) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("condition", condition);
		temp.put("category", category);
		temp.put("range", range);
		temp.put("userId", userId);
		temp.put("startContent", startContent);
		temp.put("endContent", endContent);
		return dao.getQaBoardListU(temp);
	}
	
	public Map<String,Integer> getPagingResultUser(String userId, int pageNum, int category,int condition){
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("condition", condition);
		temp.put("userId", userId);
		temp.put("category", category);
		int count = dao.getBoardCountU(temp);
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String,Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}
	
	public int setQaBoardQuestion(QaBoardDTO qaBoardDTO) {
		return dao.writeQuestion(qaBoardDTO);
	}

	public QaBoardDTO getQuestionDetail(int idx) {
		return dao.getQuestionDetail(idx);
	}

	public QaBoardDTO getAnswerDetail(int qaGroup) {
		return dao.getAnswerDetail(qaGroup);
	}
	
	public String setImageUpload(MultipartFile uploadFile) {
		UUID uid = UUID.randomUUID();
		String original = uploadFile.getOriginalFilename();
		String saveName = uid.toString()+"_"+original;
		String uploadPath = "C:/image/qaboard";
		File target = new File(uploadPath, saveName);
	
		
	    try {
	    	FileCopyUtils.copy(uploadFile.getBytes(), target);
			
		    } catch (IOException e) {
				e.printStackTrace();
			}
			    String url = saveName;
		    
			return url;
		}

	public int modifyQuestion(QaBoardDTO qaBoardDTO) {
		return dao.modifyQuestion(qaBoardDTO);
	}

	public int deleteQuestion(int idx) {
		return dao.deleteQuestion(idx);
	}

	
	
	public Map<String, Integer> getPagingResultAdminOption(int condition, int pageNum, int category, String searchOption, String keyword,String permission) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("permission", permission);
		temp.put("searchOption", searchOption);
		temp.put("keyword", keyword);
		temp.put("condition", condition);
		temp.put("category", category);
		int count = dao.getBoardCountAOption(temp);
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String,Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}

	public List<QaBoardDTO> getQaBoardListAdminOption(int condition, int startContent, int endContent, int category, int range, String searchOption, String keyword,String permission) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("permission", permission);
		temp.put("searchOption", searchOption);
		temp.put("keyword", keyword);
		temp.put("condition", condition);
		temp.put("category", category);
		temp.put("range", range);
		temp.put("startContent", startContent);
		temp.put("endContent", endContent);
		return dao.getQaBoardListAOption(temp);
	}

	public boolean setAnswer(QaBoardDTO qaBoardDTO) {
		return (dao.insertAnswer(qaBoardDTO)==1) ? true:false;
	}

	public boolean setQuestionCondition(int idx) {
		return (dao.setQuestionCondition(idx)==1) ? true:false;
	}

	public boolean modifyAnswer(QaBoardDTO qaboardDTO) {
		return (dao.modifyAnswer(qaboardDTO)==1) ? true:false;
	}

	public boolean deleteAnswer(int idx) {
		return (dao.deleteAnswer(idx)==1)?true:false;
	}


	public boolean setQuestionConditionDelete(int groupIdx) {
		return (dao.setQuestionConditionDelete(groupIdx)==1)?true:false;
	}

	
}
