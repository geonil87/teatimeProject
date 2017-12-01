package admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.xml.MappingJackson2XmlView;

import admin.dto.BlackListDTO;
import admin.dto.LoginLogDTO;
import admin.dto.ReportListDTO;
import admin.dto.ResignListDTO;
import admin.service.AdminManagementServiceImpl;
import annotation.CheckAuth;
import annotation.CheckAuth.auth;
import member.dto.MemberDTO;

@Controller
public class AdminManagementController {
	
	
	@Autowired
	AdminManagementServiceImpl service;
	
	
			
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[ 유 저 관 리 ]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	
	@CheckAuth(value=auth.ADMIN)
	@RequestMapping(value="management.memberList")
	public ModelAndView moveMemberManagement(
			@RequestParam(defaultValue="1") int pageNum,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="") String searchOption){
			
		ModelAndView mav = new ModelAndView();
		Map<String, Integer> pagingResult = service.getMemberPaging(pageNum, keyword, searchOption);
		List<MemberDTO> list = service.getMemberList(pagingResult, keyword, searchOption);
		mav.addObject("searchOption",searchOption);
		mav.addObject("keyword",keyword);
		mav.addObject("memberList", list);
		mav.addObject("paging", pagingResult);
		mav.setViewName("admin/memberinfo/memberManagement");
		return mav;
	}
	
	@RequestMapping(value="management.memberInfo")
	public ModelAndView moveMemberInfo(String userId, @RequestParam(defaultValue="1") int pageNum){
		ModelAndView mav = new ModelAndView();
		
		// 유저 정보 가져오기
		MemberDTO memberInfo = service.getMemberInfo(userId);
		mav.addObject("memberInfo", memberInfo);
		
		// 신고 현황 가져오기
		Map<String, Integer> reportCount = service.getReportCount(userId);
		mav.addObject("reportCount", reportCount);

		// QnA 현황 가져오기
		Map<String,Integer> qaBoardCount = service.getMemberQaBoardCount(userId);
		mav.addObject("qaBoardCount", qaBoardCount);
		
		// 로그 정보 가져오기
		Map<String,Integer> pagingResult = service.getLoginLogPaging(userId, pageNum);
		List<LoginLogDTO> list = service.getLoginLog(pagingResult, userId);
		mav.addObject("logList",list);
		mav.addObject("paging", pagingResult);
		mav.setViewName("admin/memberinfo/memberInfo");
		return mav;
	}
	
	
	@RequestMapping(value="management.modifyMemberInfo", method=RequestMethod.GET)
	public ModelAndView moveMemberInfoModify(String userId){
		ModelAndView mav = new ModelAndView();
		
		// 유저 정보 가져오기
		MemberDTO memberInfo = service.getMemberInfo(userId);
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("admin/memberinfo/memberInfoModify");
		
		return mav;
	}
	
	@RequestMapping(value="management.modifyMemberInfo", method=RequestMethod.POST)
	public ModelAndView modifyMemberInfo(MemberDTO memberDTO){
		ModelAndView mav = new ModelAndView();
		if(service.modifyMemberInfo(memberDTO)){
			mav.addObject("userId", memberDTO.getUserId());
			mav.addObject("resultMsg", "수정 완료");
		}else{
			mav.addObject("userId", memberDTO.getUserId());
			mav.addObject("resultMsg", "수정 실패");
		}
		mav.setViewName("redirect:management.modifyMemberInfo");
		return mav;
	}
	
	@RequestMapping(value="management.modifyMemberStatus", method=RequestMethod.POST)
	public ModelAndView modifyMemberStatus(String memberStatus, MemberDTO memberDTO, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		if(service.modifyMemberStatus(memberStatus,memberDTO)){
			mav.addObject("userId", memberDTO.getUserId());
			mav.addObject("resultMsg", "상태 변경 완료");
		};
		
		String url = request.getHeader("Referer");
		if(url == null){
			mav.setViewName("redirect:management.memberList");
			return mav;
		}
		url = url.substring(url.lastIndexOf("/")+1, url.length());
		String[] urlTemp = url.split("\\?");
		
		
		mav.setViewName("redirect:"+urlTemp[0]);
		return mav;
	}
	
	@RequestMapping(value="management.resignMemberInfo", method=RequestMethod.GET)
	public ModelAndView resignMemberInfo(String userId){
		ModelAndView mav = new ModelAndView();
		if(service.resignMember(userId)){
			mav.addObject("userId", userId);
			mav.addObject("resultMsg", "탈퇴 완료");
		}
		mav.setViewName("redirect:management.memberInfo");
		return mav;
	}
	
	@RequestMapping(value="management.suspendCause", method=RequestMethod.GET)
	public String moveSuspendCause(String userId){
		return "admin/memberinfo/suspendCause";
	}
	
	@RequestMapping(value="management.suspendCause", method=RequestMethod.POST)
	public @ResponseBody boolean setSuspendCause(String suspendCause, MemberDTO memberDTO, String memberStatus){
	
		if(!service.modifyMemberStatus(memberStatus,memberDTO)){
			return false;
		}

		return service.setSuspendCause(suspendCause,memberDTO.getUserId());
	}
	
	@RequestMapping(value="management.suspendCauseResult", method=RequestMethod.GET)
	public ModelAndView moveSuspendCauseResult(String userId){
		ModelAndView mav = new ModelAndView();
		String cause = service.checkSuspendCause(userId);
		mav.addObject("suspendCause", cause);
		mav.setViewName("admin/memberinfo/suspendCauseResult");
		
		return mav;
	}
	
	
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[ 블 랙 리 스 트 ]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	
	@RequestMapping(value="management.blackList")
	public ModelAndView moveBlackListInfo(
		@RequestParam(defaultValue="1") int pageNum,
		@RequestParam(defaultValue="") String keyword,
		@RequestParam(defaultValue="") String searchOption){
		
		ModelAndView mav = new ModelAndView();
		Map<String, Integer> pagingResult = service.getBlackListPaging(pageNum, keyword, searchOption);
		List<BlackListDTO> list = service.getBlackList(pagingResult, keyword, searchOption);
		mav.addObject("searchOption",searchOption);
		mav.addObject("keyword",keyword);
		mav.addObject("blackList", list);
		mav.addObject("paging", pagingResult);
		mav.setViewName("admin/memberinfo/blackListManagement");
		return mav;
	}
	
	@RequestMapping(value="management.blackListInfo")
	public ModelAndView moveBlackListInfo(String userId, 
			@RequestParam(defaultValue="storyBoard") String reportMenu,
			@RequestParam(defaultValue="1") int pageNum){
		ModelAndView mav = new ModelAndView();
		
		// 유저 정보 가져오기
		MemberDTO memberInfo = service.getMemberInfo(userId);
		mav.addObject("memberInfo", memberInfo);
		
		// 신고 리스트 가져오기
		Map<String, Integer> pagingResult = service.getReportListPaging(pageNum, userId, reportMenu);
		List<ReportListDTO> reportList = service.getReportList(pagingResult, userId, reportMenu);
		mav.addObject("reportList", reportList);		
		mav.addObject("paging", pagingResult);
		
		// 게시판, 댓글 별 신고 횟수 가져오기
		Map<String,Integer> reportCountDetail = service.getReportCountDetail(userId);
		mav.addObject("reportCount", reportCountDetail);
		
		mav.addObject("reportMenu", reportMenu);
		mav.setViewName("admin/memberinfo/blackListInfo");
		return mav;
	}
	
	@RequestMapping(value="management.blackListContent")
	public ModelAndView openCheckContent(int targetIdx, String reportMenu){
		ModelAndView mav = new ModelAndView();
		Map<String,String> reportTarget = service.getReportTargetDetail(targetIdx, reportMenu);
		mav.addObject("reportTarget", reportTarget);
		mav.setViewName("admin/memberinfo/blackListContent");
		
		return mav;
	}
	
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[ 탈 퇴 회 원 ]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	
	@RequestMapping(value="management.resignList")
	public ModelAndView moveResignListInfo(
		@RequestParam(defaultValue="1") int pageNum,
		@RequestParam(defaultValue="") String keyword,
		@RequestParam(defaultValue="") String searchOption){
		
		ModelAndView mav = new ModelAndView();
		Map<String, Integer> pagingResult = service.getResignPaging(pageNum, keyword, searchOption);
		List<ResignListDTO> list = service.getResignList(pagingResult, keyword, searchOption);
		mav.addObject("searchOption",searchOption);
		mav.addObject("keyword",keyword);
		mav.addObject("resignList", list);
		mav.addObject("paging", pagingResult);
		mav.setViewName("admin/memberinfo/resignManagement");
		return mav;
	}
	
	@RequestMapping(value="management.resignMemberInfoCancel", method=RequestMethod.GET)
	public ModelAndView resignMemberInfoCancel(String userId){
		ModelAndView mav = new ModelAndView();
		if(service.resignMemberCancel(userId)){
			mav.addObject("userId", userId);
			mav.addObject("resultMsg", "탈퇴 취소");
		}
		mav.setViewName("redirect:management.memberInfo");
		return mav;
	}
	
	@RequestMapping(value="management.resignMemberInfoCancel", method=RequestMethod.POST)
	public String resignListMemberInfoCancel(@RequestParam(value="checkValue", required=false) List<String> checkValue){
		
		if(checkValue == null){
			return "redirect:management.resignList";
		}
		
		for(String s : checkValue){
			if(service.resignMemberCancel(s)){
				
			}
		}
		
		return "redirect:management.resignList";
	}
	
	@RequestMapping(value="management.removeMemberInfo", method=RequestMethod.POST)
	public String removeMemberInfo(@RequestParam(value="checkValue", required=false) List<String> checkValue){
		
		if(checkValue == null){
			return "redirect:management.resignList";
		}
		
		for(String s : checkValue){
			if(service.removeMember(s)){
				
			}
		}
		
		return "redirect:management.resignList";
	}
	
	
	
	
}
