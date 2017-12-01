package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.dto.BlackListDTO;
import admin.dto.LoginLogDTO;
import admin.dto.ReportListDTO;
import admin.dto.ResignListDTO;
import member.dto.MemberDTO;

@Repository
public class AdminManagementDAO {

	@Autowired
	SqlSession session;
	
	public int getMemberTotalCount(Map<String,String> temp){
		return session.selectOne("adminManage.getListTotalCount", temp);
	}
	
	public List<MemberDTO> getMemberList(Map<String,Object> temp){
		return session.selectList("adminManage.getMemberList", temp);
	}
	
	public MemberDTO getMemberInfo(String userId){
		return session.selectOne("adminManage.getMemberInfo", userId);
	}
	
	public int getLoginLogCount(String userId){
		return session.selectOne("adminManage.getLoginLogCount",userId);
	}
	
	public List<LoginLogDTO> getLoginLog(Map<String,Object> temp){
		return session.selectList("adminManage.getLoginLog",temp);
	}
	
	public int modifyMemberInfo(MemberDTO memberDTO){
		return session.update("adminManage.modifyMemberInfo", memberDTO);
	}
	
	public int modifyMemberStatus(MemberDTO memberDTO){
		return session.update("adminManage.modifyMemberStatus", memberDTO);
	}
	
	public Map<String, Integer> getReportCount(String userId){
		return session.selectOne("adminManage.getReportCount", userId);
	}
	
	public Map<String,Integer> getMemberQaBoardCount(String userId){
		return session.selectOne("adminManage.getMemberQaBoardCount", userId);
	}
	
	public int getBlackListTotalCount(Map<String,String> temp){
		return session.selectOne("adminManage.getBlackListTotalCount", temp);
	}
	
	public List<BlackListDTO> getBlackList(Map<String,Object> temp){
		return session.selectList("adminManage.getBlackList", temp);
	}
	
	public int getResignTotalCount(Map<String,String> temp){
		return session.selectOne("adminManage.getResignTotalCount", temp);
	}
	
	public List<ResignListDTO> getResignList(Map<String,Object> temp){
		return session.selectList("adminManage.getResignMemberList", temp); 
	}
	
	public int resignMember(String userId){
		return session.update("adminManage.setResignMember", userId);
	}
	
	public int resignMemberCancel(String userId){
		return session.update("adminManage.setResignMemberCancel", userId);
	}
	
	public int getReportListCount(Map<String,String> temp){
		return session.selectOne("adminManage.getReportListCount",temp);
	}
	
	public List<ReportListDTO> getReportList(Map<String,Object> temp){
		return session.selectList("adminManage.getReportList", temp);
	}
	
	public Map<String,String> getReportTargetDetail(Map<String,Object> temp){
		return session.selectOne("adminManage.getReportTargetDetail", temp);
	}
	
	public Map<String,Integer> getReportCountDetail(String userId){
		return session.selectOne("adminManage.getReportCountDetail", userId);
	}
	
	public int removeMember(String userId){
		return session.delete("adminManage.removeMember", userId);
	}
	
	public int setSuspendCause(Map<String, String> temp){
		return session.update("adminManage.setSuspendCause", temp);
	}
	
	public String getSuspendCause(String userId){
		return session.selectOne("adminManage.getSuspendCause", userId);
	}

}
