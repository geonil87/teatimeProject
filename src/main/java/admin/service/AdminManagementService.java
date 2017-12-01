package admin.service;

import java.util.List;
import java.util.Map;

import admin.dto.BlackListDTO;
import admin.dto.LoginLogDTO;
import admin.dto.ReportListDTO;
import admin.dto.ResignListDTO;
import member.dto.MemberDTO;

public interface AdminManagementService {
	
	public Map<String, Integer> getMemberPaging(int pageNum, String keyword, String searchOption);
	
	public List<MemberDTO> getMemberList(Map<String,Integer> pagingResult, String keyword, String searchOption);
	
	public MemberDTO getMemberInfo(String userId);
	
	public Map<String, Integer> getLoginLogPaging(String userId, int pageNum);
	
	public List<LoginLogDTO> getLoginLog(Map<String,Integer> pagingResult, String userId);
	
	public boolean modifyMemberInfo(MemberDTO memberDTO);
	
	public boolean modifyMemberStatus(String memberStatus, MemberDTO memberDTO);
	
	public Map<String, Integer> getReportCount(String userId);
	
	public Map<String,Integer> getMemberQaBoardCount(String userId);
	
	public Map<String, Integer> getBlackListPaging(int pageNum, String keyword, String searchOption);
	
	public List<BlackListDTO> getBlackList(Map<String,Integer> pagingResult, String keyword, String searchOption);
	
	public Map<String, Integer> getResignPaging(int pageNum, String keyword, String searchOption);
	
	public List<ResignListDTO> getResignList(Map<String,Integer> pagingResult, String keyword, String searchOption);
	
	public boolean resignMember(String userId);
	
	public boolean resignMemberCancel(String userId);
	
	public Map<String, Integer> getReportListPaging(int pageNum, String userId, String reportMenu);
	
	public List<ReportListDTO> getReportList(Map<String, Integer> pagingResult, String userId, String reportMenu);
	
	public Map<String,String> getReportTargetDetail(int targetIdx, String reportMenu);
	
	public Map<String,Integer> getReportCountDetail(String userId);
	
	public boolean removeMember(String userId);
	
	public boolean setSuspendCause(String suspendCause, String userId);

	public String checkSuspendCause(String userId);
	
	
}
