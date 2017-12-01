 package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import annotation.CheckAuth;
import annotation.CheckAuth.auth;
import board.dto.QaBoardDTO;
import board.service.QaBoardServiceImpl;
import member.dto.MemberDTO;
import member.service.MemberServiceImpl;

@Controller
public class QaBoardController {

	@Autowired
	QaBoardServiceImpl service;
	
	@Autowired
	MemberServiceImpl mService;

	/*
	 * =========================================================================
	 * == ============================ USER
	 * =======================================
	 * =========================================================================
	 * =
	 */

	// 유저용 문의게시판 리스트 출력 페이지 이동
	@RequestMapping(value = "qaBoard.listUser", method = RequestMethod.GET)
	public ModelAndView moveListUser(HttpSession session, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "0") int condition,
			@RequestParam(defaultValue = "2") int range,
			@RequestParam(defaultValue = "0") int category
			) {
		ModelAndView mav = new ModelAndView();
		String userId = (String) session.getAttribute("sessionId");
		Map<String, Integer> pagingResult = service.getPagingResultUser(userId, pageNum,category,condition);
		List<QaBoardDTO> list = service.getQaBoardListUser(userId, pagingResult.get("startContent"),pagingResult.get("endContent"),condition,range,category);
		MemberDTO userinfo = mService.getUserInfo(userId);
		mav.addObject("userinfo", userinfo);
		mav.addObject("condition",condition);
		mav.addObject("category",category);
		mav.addObject("range",range);
		mav.addObject("qaBoardList", list);
		mav.addObject("paging", pagingResult);
		mav.addObject("pageNum",pageNum);
		mav.setViewName("member/mypage/qaboard/qaBoardListUser");
		return mav;
	}

	// 질문하기 페이지 이동
	@RequestMapping(value = "qaBoard.question", method = RequestMethod.GET)
	public String moveQuestion() {
		return "member/mypage/qaboard/qaBoardQuestion";
	}

	// 질문 등록 실행
	@RequestMapping(value = "qaBoard.question", method = RequestMethod.POST)
	public @ResponseBody int setQuestion(QaBoardDTO qaBoardDTO, String title, int category, String content, HttpSession session){
		qaBoardDTO.setTitle(title);
		qaBoardDTO.setCategory(category);
		qaBoardDTO.setContent(content);
		
		if(qaBoardDTO.getCategory()==0){
			qaBoardDTO.setCategory(10);
		}
		qaBoardDTO.setUserId((String) session.getAttribute("sessionId"));
		
		int result = service.setQaBoardQuestion(qaBoardDTO);

		return result;
	}

	// 질문 수정 페이지 이동
	@RequestMapping(value = "qaBoard.questionModify", method = RequestMethod.GET)
	public ModelAndView moveQuestionModify(int idx, int condition) {
		ModelAndView mav = new ModelAndView();
		if (condition != 1) {
			mav.setViewName("redirect:qaBoard.listUser");
			return mav;
		}
		QaBoardDTO question = service.getQuestionDetail(idx);
		mav.addObject("question", question);
		mav.setViewName("member/mypage/qaboard/qaBoardQuestionModify");
		return mav;
	}

	// 질문 수정 실행
	@RequestMapping(value = "qaBoard.questionModify", method = RequestMethod.POST)
	public @ResponseBody int setQuestionModify(QaBoardDTO qaBoardDTO, String title, int category, String content, int idx) {
		qaBoardDTO.setTitle(title);
		qaBoardDTO.setCategory(category);
		qaBoardDTO.setContent(content);
		qaBoardDTO.setIdx(idx);
		int result = service.modifyQuestion(qaBoardDTO);
		
	

		return result;
	}

	// 질문 삭제 실행
	@RequestMapping(value = "qaBoard.questionDelete", method = RequestMethod.GET)
	public String setQuestionDelete(int idx, HttpSession session) {
		int result = service.deleteQuestion(idx);

		
		return "redirect:qaBoard.listAdminOption";
	}
	
	// 질문 삭제 실행 (ajax)
	@RequestMapping(value = "qaBoard.questionDelete", method = RequestMethod.POST)
	public @ResponseBody int setQuestionDeleteAjax(int idx, HttpSession session) {
		int result = service.deleteQuestion(idx);
	
		
		return result;
	}
	

	// 유저 질문 디테일
	@RequestMapping(value = "qaBoard.userDetail", method = RequestMethod.GET)
	public ModelAndView moveDetailUser(int idx) {
		ModelAndView mav = new ModelAndView();
		QaBoardDTO question = service.getQuestionDetail(idx);
		mav.addObject("question", question);
		if (question.getCondition() == 2) {
			QaBoardDTO answer = service.getAnswerDetail(question.getQaGroup());
			mav.addObject("answer", answer);
		}

		mav.setViewName("member/mypage/qaboard/qaBoardDetailUser");
		return mav;
	}

	/*
	 * =========================================================================
	 * == ============================ ADMIN
	 * =======================================
	 * =========================================================================
	 * =
	 */


	// 관리자용 문의게시판 정렬
	@RequestMapping(value = "qaBoard.listAdminOption", method = RequestMethod.GET)
	public ModelAndView setRangeList(
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "1") int condition,
			@RequestParam(defaultValue = "2") int range,
			@RequestParam(defaultValue = "0") int category,
			@RequestParam(defaultValue = "") String searchOption, 
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String permission){
		
		ModelAndView mav = new ModelAndView();
		Map<String, Integer> pagingResult = service.getPagingResultAdminOption(condition, pageNum, category, searchOption, keyword,permission);
		List<QaBoardDTO> list = service.getQaBoardListAdminOption(condition, pagingResult.get("startContent"),pagingResult.get("endContent"),category,range,searchOption, keyword,permission);
		mav.addObject("permission",permission);
		mav.addObject("searchOption",searchOption);
		mav.addObject("keyword",keyword);
		mav.addObject("condition",condition);
		mav.addObject("category",category);
		mav.addObject("range",range);
		mav.addObject("qaBoardList", list);
		mav.addObject("paging", pagingResult);
		mav.setViewName("admin/qaboard/qaBoardListAdmin");
		return mav;	
	}
	
	// 관리자 질문 디테일
	@RequestMapping(value = "qaBoard.adminDetail", method = RequestMethod.GET)
	public ModelAndView moveDetailAdmin(int idx, int permission) {
		ModelAndView mav = new ModelAndView();
		QaBoardDTO question = service.getQuestionDetail(idx);
		mav.addObject("question", question);
		if (question.getCondition() == 2) {
			QaBoardDTO answer = service.getAnswerDetail(question.getQaGroup());
			mav.addObject("answer", answer);
		}
		if(permission == 1){
			mav.setViewName("admin/qaboard/qaBoardQuestionDetailAdmin");
		}else if(permission == 0){
			mav.setViewName("admin/qaboard/qaBoardAnswerDetailAdmin");
		}
		return mav;
	}
	
	// 답변하기 페이지 이동
	@RequestMapping(value = "qaBoard.answer", method = RequestMethod.GET)
	public ModelAndView moveAnswer(int groupIdx) {
		ModelAndView mav = new ModelAndView();
		QaBoardDTO question = service.getQuestionDetail(groupIdx);
		mav.addObject("question", question);
		mav.setViewName("admin/qaboard/qaBoardAnswer");
		return mav;
	}
	
	// 답변 등록 실행
	@RequestMapping(value = "qaBoard.answer", method = RequestMethod.POST)
	public String setAnswer(QaBoardDTO qaBoardDTO, HttpSession session) {
		qaBoardDTO.setUserId((String) session.getAttribute("sessionId"));
		
		if(service.setAnswer(qaBoardDTO)){
			if(service.setQuestionCondition(qaBoardDTO.getQaGroup())){
				return "redirect:qaBoard.listAdminOption";
			}
		}
		
		return "admin/qaboard/qaBoardAnswerFail";
	}
	
	// 답변 수정 페이지 이동
	@RequestMapping(value = "qaBoard.answerModify", method = RequestMethod.GET)
	public ModelAndView moveAnswerModify(int idx) {
		ModelAndView mav = new ModelAndView();
		QaBoardDTO question = service.getQuestionDetail(idx);
		QaBoardDTO answer = service.getAnswerDetail(idx);
		mav.addObject("question", question);
		mav.addObject("answer", answer);
		mav.setViewName("admin/qaboard/qaBoardAnswerModify");
		return mav;
	}
	
	// 답변 수정 실행
	@RequestMapping(value = "qaBoard.answerModify", method = RequestMethod.POST)
	public String setAnswerModify(QaBoardDTO qaboardDTO) {
		if (service.modifyAnswer(qaboardDTO)){
			return "redirect:qaBoard.adminDetail?idx="+qaboardDTO.getIdx()+"&permission="+qaboardDTO.getPermission();
		}
		return "admin/qaboard/qaBoardAnswerFail";
	}

	// 답변 삭제 실행
	@RequestMapping(value = "qaBoard.answerDelete", method = RequestMethod.GET)
	public String setAnswerDelete(int groupIdx) {
		if(service.deleteAnswer(groupIdx)){
			if(service.setQuestionConditionDelete(groupIdx)){
				return "redirect:qaBoard.listAdminOption";		
			}
		}
		return "admin/qaboard/qaBoardAnswerFail"; 
	}

	/*
	 * =========================================================================
	 * == ============================ UTILL
	 * =======================================
	 * =========================================================================
	 * =
	 */
	// 게시글 이미지 추가
	@RequestMapping(value = "qaBoard.imageUpload", method = RequestMethod.POST) 
	public @ResponseBody String setImageUpload(MultipartFile uploadFile, HttpServletRequest request) {

		String localPath = request.getRequestURL().substring(0, 21);
		String url = service.setImageUpload(uploadFile);
		return localPath + "/img/qaboard/" + url;
	}

}
