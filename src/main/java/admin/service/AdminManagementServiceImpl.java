package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminManagementDAO;
import admin.dto.BlackListDTO;
import admin.dto.LoginLogDTO;
import admin.dto.ReportListDTO;
import admin.dto.ResignListDTO;
import board.support.Paging;
import member.dto.MemberDTO;

@Service("adminManagementService")
public class AdminManagementServiceImpl implements AdminManagementService{
	
	@Autowired
	AdminManagementDAO dao;

	@Autowired
	Paging paging;
	
	public Map<String, Integer> getMemberPaging(int pageNum, String keyword, String searchOption) {
		Map<String,String> temp = new HashMap<String,String>();
		temp.put("keyword", keyword);
		temp.put("searchOption", searchOption);
		int count = dao.getMemberTotalCount(temp);
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String, Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}
	
	public List<MemberDTO> getMemberList(Map<String,Integer> pagingResult, String keyword, String searchOption) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("keyword", keyword);
		temp.put("searchOption", searchOption);
		temp.put("startContent", pagingResult.get("startContent"));
		temp.put("endContent", pagingResult.get("endContent"));
		return dao.getMemberList(temp);
	}

	public MemberDTO getMemberInfo(String userId) {
		return dao.getMemberInfo(userId);
	}

	public Map<String, Integer> getLoginLogPaging(String userId, int pageNum) {
		int count = dao.getLoginLogCount(userId);
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String, Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}

	public List<LoginLogDTO> getLoginLog(Map<String, Integer> pagingResult, String userId) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("userId", userId);
		temp.put("startContent", pagingResult.get("startContent"));
		temp.put("endContent", pagingResult.get("endContent"));
		return dao.getLoginLog(temp);
	}

	public boolean modifyMemberInfo(MemberDTO memberDTO) {
		return (dao.modifyMemberInfo(memberDTO)==1 ? true:false);
	}

	public boolean modifyMemberStatus(String memberStatus, MemberDTO memberDTO) {
		if(memberStatus.equals("normal")){
			memberDTO.setUserPermission(1);
		}else if(memberStatus.equals("banned")){
			memberDTO.setUserPermission(2);
		}else if(memberStatus.equals("resign")){
			memberDTO.setUserPermission(99);
		}		
		
		return (dao.modifyMemberStatus(memberDTO)==1? true:false);
	}

	public Map<String, Integer> getReportCount(String userId) {
		return dao.getReportCount(userId);
	}

	public Map<String, Integer> getMemberQaBoardCount(String userId) {
		Map<String,Integer> result = dao.getMemberQaBoardCount(userId);
		// 퍼센트 연산
		double total = Double.parseDouble(String.valueOf(result.get("totalCount")));
		double clear = Double.parseDouble(String.valueOf(result.get("clearCount")));
		int percent = (int)Math.floor((clear/total)*100);
		result.put("percent", percent);
		return result;
	}

	public Map<String, Integer> getBlackListPaging(int pageNum, String keyword, String searchOption) {
		Map<String,String> temp = new HashMap<String,String>();
		temp.put("keyword", keyword);
		temp.put("searchOption", searchOption);
		int count = dao.getBlackListTotalCount(temp);
		
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String, Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}

	public List<BlackListDTO> getBlackList(Map<String, Integer> pagingResult, String keyword, String searchOption) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("keyword", keyword);
		temp.put("searchOption", searchOption);
		temp.put("startContent", pagingResult.get("startContent"));
		temp.put("endContent", pagingResult.get("endContent"));
		return dao.getBlackList(temp);
	}

	public Map<String, Integer> getResignPaging(int pageNum, String keyword, String searchOption) {
		Map<String,String> temp = new HashMap<String,String>();
		temp.put("keyword", keyword);
		temp.put("searchOption", searchOption);
		int count = dao.getResignTotalCount(temp);
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String, Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}

	public List<ResignListDTO> getResignList(Map<String, Integer> pagingResult, String keyword, String searchOption) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("keyword", keyword);
		temp.put("searchOption", searchOption);
		temp.put("startContent", pagingResult.get("startContent"));
		temp.put("endContent", pagingResult.get("endContent"));
		return dao.getResignList(temp);
	}
	
	public boolean resignMember(String userId) {
		return (dao.resignMember(userId)==1 ? true:false);
	}

	public boolean resignMemberCancel(String userId) {
		return (dao.resignMemberCancel(userId)==1 ? true:false);
	}

	
	public Map<String, Integer> getReportListPaging(int pageNum, String userId, String reportMenu) {
		Map<String,String> temp = new HashMap<String,String>();
		temp.put("userId", userId);
		temp.put("reportMenu", reportMenu);
		int count = dao.getReportListCount(temp);
		paging.setTotalCount(count);
		paging.setCountList(10);
		paging.setCountPage(5);
		Map<String, Integer> pagingResult = paging.getPaging(pageNum);
		return pagingResult;
	}
	
	public List<ReportListDTO> getReportList(Map<String, Integer> pagingResult, String userId, String reportMenu) {
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("userId", userId);
		temp.put("reportMenu", reportMenu);
		temp.put("startContent", pagingResult.get("startContent"));
		temp.put("endContent", pagingResult.get("endContent"));
		return dao.getReportList(temp);
	}
	
	public Map<String,String> getReportTargetDetail(int targetIdx, String reportMenu){
		Map<String,Object> temp = new HashMap<String,Object>();
		temp.put("targetIdx", targetIdx);
		temp.put("reportMenu", reportMenu);
		return dao.getReportTargetDetail(temp);
	}

	public Map<String,Integer> getReportCountDetail(String userId){
		return dao.getReportCountDetail(userId);
	}

	public boolean removeMember(String userId) {
		return (dao.removeMember(userId)==1 ? true:false);
	}

	public boolean setSuspendCause(String suspendCause, String userId) {
		Map<String,String> temp = new HashMap<String,String>();
		temp.put("userId", userId);
		temp.put("suspendCause", suspendCause);
		return (dao.setSuspendCause(temp)==1 ? true:false);
	}

	public String checkSuspendCause(String userId) {
		return dao.getSuspendCause(userId);
	}
	
	
	
}
