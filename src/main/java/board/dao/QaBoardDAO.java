package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.dto.QaBoardDTO;

@Repository
public class QaBoardDAO {
	
	@Autowired
	SqlSession session;
	
	public List<QaBoardDTO> getQaBoardListU(Map<String,Object> temp){
		return session.selectList("qaboard.getListUser", temp);
	}
	
	public int getBoardCountU(Map<String,Object> temp){
		return session.selectOne("qaboard.getCountUser", temp);
	}
	
	public int writeQuestion(QaBoardDTO qaBoardDTO){
		return session.insert("qaboard.insertQuestion", qaBoardDTO);
	}
	
	public QaBoardDTO getQuestionDetail(int idx){
		return session.selectOne("qaboard.getQuestionDetail", idx);
	}
	
	public QaBoardDTO getAnswerDetail(int qaGroup){
		return session.selectOne("qaboard.getAnswerDetail", qaGroup);
	}
	
	public int modifyQuestion(QaBoardDTO qaBoardDTO){
		return session.update("qaboard.modifyQuestionDetail", qaBoardDTO);
	}
	
	public int deleteQuestion(int idx){
		return session.update("qaboard.deleteQuestion", idx);
	}
	
	
	/*������*/
	
	public List<QaBoardDTO> getQaBoardListAOption(Map<String,Object> temp){
		return session.selectList("qaboard.getListAdminOption", temp);
	}
	
	public int getBoardCountAOption(Map<String,Object> temp){
		return session.selectOne("qaboard.getCountAdminOption", temp);
	}
	
	public int insertAnswer(QaBoardDTO qaBoardDTO){
		return session.insert("qaboard.insertAnswer", qaBoardDTO);
	}
	
	public int setQuestionCondition(int idx){
		return session.update("qaboard.setQuestionCondition", idx);
	}
	
	public int setQuestionConditionDelete(int groupIdx){
		return session.update("qaboard.setQuestionConditionDelete", groupIdx);
	}
	
	public int modifyAnswer(QaBoardDTO qaboardDTO){ 
		return session.update("qaboard.modifyAnswerDetail", qaboardDTO);
	}
	
	public int deleteAnswer(int idx){
		return session.update("qaboard.deleteAnswer", idx);
	}
}
