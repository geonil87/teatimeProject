package member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import annotation.CheckAuth;
import annotation.CheckAuth.auth;
import annotation.NoCheckLogin;
import member.dto.MemberDTO;
import member.service.MemberServiceImpl;
import member.support.EmailAuthClass;
import member.support.RegistValidation;

@Controller
public class MemberController {

	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired(required=true)
	private HttpServletRequest request;
	
	@Resource
	RegistValidation registValidation;

	
	
	// 로그인 페이지 이동
	@NoCheckLogin
	@RequestMapping(value="member.login", method=RequestMethod.GET)
	public String moveLoginForm(){
		if(request.getSession().getAttribute("sessionId")!=null){
			return "redirect:main";
		}
		String url = request.getHeader("Referer");
		
		if(url == null){
			return "redirect:main";
		}
			
		if(request.getSession().getAttribute("prevPage")==null){
			url = url.substring(url.lastIndexOf("/")+1, url.length());
			request.getSession().setAttribute("prevPage", url);
		}
		
		return "member/login/loginForm";
	}
	
	// 로그인 실행
	@NoCheckLogin
	@RequestMapping(value="member.login", method=RequestMethod.POST)
	public ModelAndView getLoginInfo(String userId, String userPw, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String path="";
		String loginCondition = "";
				
		Map<String,String> loginInfo = new HashMap<String,String>();
		loginInfo.put("user_id", userId);
		loginInfo.put("user_pw", userPw);
		
				
		// 클라이언트 IP 추출			
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0) {
		   ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
		   ip = request.getHeader("WL-Proxy-Client-IP");  // 웹로직
		}
		if (ip == null || ip.length() == 0) {
		   ip = request.getRemoteAddr() ;
		}	
		
		Map<String,String> result = service.checkLogin(loginInfo);

		// 로그인 결과창
		if(result.containsKey("loginFailId")==true){
			mav.addObject("loginResult", result.get("loginFailId"));
			path = "redirect:member.login";
			mav.setViewName(path);
			return mav;
		}else if(result.containsKey("loginFailPw")==true){
			mav.addObject("userId",result.get("userId"));
			mav.addObject("loginResult", result.get("loginFailPw"));
			path = "redirect:member.login";
			loginCondition = "F";
		}else{
			session.setAttribute("sessionId", result.get("userId"));
			session.setAttribute("sessionNick", result.get("userNick"));
			session.setAttribute("sessionPermission", result.get("userPermission"));
			path = "redirect:"+session.getAttribute("prevPage");
			if(session.getAttribute("prevPage")==null){
				path = "redirect:main";
			}
			session.removeAttribute("prevPage");
			loginCondition = "S";
		}
		service.insertUserLog(userId, ip, loginCondition);
		mav.setViewName(path);
		return mav;
	}
	
	// 로그아웃 
	@NoCheckLogin
	@RequestMapping(value="member.logout")
	public String setLogout(HttpSession session){
		String path="";
		String url = request.getHeader("Referer");
		
		
		if(request.getSession().getAttribute("prevPage")==null && url != null){
			url = url.substring(url.lastIndexOf("/")+1, url.length());
			request.getSession().setAttribute("prevPage", url);
			path = "redirect:"+session.getAttribute("prevPage");
			
		}else{
			path = "redirect:main";
			
		}
		session.invalidate();
		
		return path;
	}
	
	// 약관 페이지로 이동
	@NoCheckLogin
	@RequestMapping(value="member.tos", method=RequestMethod.GET)
	public String moveTermOfService(){
		return "member/regist/tosForm";
	}
	
	// 회원가입 페이지 이동
	@NoCheckLogin
	@RequestMapping(value="member.regist", method=RequestMethod.GET)
	public String moveRegistration(){
		return "member/regist/registForm";
	}

	// 회원가입 실행
	@NoCheckLogin
	@RequestMapping(value="member.regist", method=RequestMethod.POST)
	public ModelAndView setRegistration(MemberDTO memberDTO, HttpSession session){
		ModelAndView mav = new ModelAndView();
		boolean checkFlag = false;
		// session check (이메일 인증 했는지 )
		if(session.getAttribute("sessionEmailAuthToken") == null){
			mav.addObject("errorMsg", "이메일 인증을 해주세요.");
		}else{
			checkFlag = true;
		}
		
		if(checkFlag){
			Map<String,String> result = service.insertRegistration(memberDTO);
			if(result != null){
				mav.addObject("registResult", result);
				mav.setViewName("member/regist/registResult");
				session.removeAttribute("sessionEmailAuthToken");
				session.setAttribute("prevPage","redirect:main");
				return mav;
			}
		}
		mav.setViewName("member/regist/registResultFail");
		return mav;
	}
	
	// 아이디 중복 검사 실행
	@NoCheckLogin
	@RequestMapping(value="member.checkSameId", method=RequestMethod.POST)
	public @ResponseBody boolean checkSameId(String id, HttpSession session){
		/*Map<String,String> temp = new HashMap<String,String>();
		
		if(id.equals("")){
			temp.put("errorMsg", "아이디를 입력하세요." );
			System.out.println("공백");
		}else if(!registValidation.valid("id", id)){
			temp.put("errorMsg", "아이디는 소문자와 숫자 6~12자리 조합으로 이루어져야 합니다." );
			System.out.println("정규식 위배");
		}else{
			if(service.checkRegistId(id)){
				temp.put("noSame", "noSame");
				System.out.println("아이디 사용 가능");
			}else{
				temp.put("same", "same");
				System.out.println("아이디 사용 불가능(중복)");
			}
		}

		return temp;*/
				
		return service.checkRegistId(id);
		
	}

	// 닉네임 중복 검사 실행
	@NoCheckLogin
	@RequestMapping(value="member.checkSameNick", method=RequestMethod.POST)
	public @ResponseBody boolean checkSameNick(String nick , HttpSession session){
		/*session.removeAttribute("sessionSameNick");
		int result = service.checkRegistNick(nick);
		if(result==0){
			session.setAttribute("sessionSameNick", nick);
		}
		return result;*/
		/*Map<String,String> temp = new HashMap<String,String>();
		
		if(nick.equals("")){
			temp.put("errorMsg", "닉네임을 입력하세요." );
			System.out.println("공백");
		}else if(!registValidation.valid("nick", nick)){
			temp.put("errorMsg", "닉네임은 한글,영어,숫자 2~10자리 조합으로 이루어져야 합니다." );
			System.out.println("정규식 위배");
		}else{
			if(service.checkRegistNick(nick)){
				temp.put("noSame", "noSame");
				System.out.println("닉네임 사용 가능");
			}else{
				temp.put("Same", "Same");
				System.out.println("닉네임 사용 불가능(중복)");
			}
		}*/

		return service.checkRegistNick(nick);
		
	}
	
	// 이메일 인증 페이지 이동
	@NoCheckLogin
	@RequestMapping(value="member.checkEmail", method=RequestMethod.GET)
	public String moveEmailAuth(){
		return "member/regist/registEmailAuthForm";
	}
	
	// 이메일 인증 코드 전송
	@NoCheckLogin
	@RequestMapping(value="member.sendAuthEmail", method=RequestMethod.POST)
	public @ResponseBody boolean sendAuthEmail(String userEmail, HttpSession session){
		boolean result = false;
		System.out.println(userEmail);
		session.removeAttribute("sessionEmailAuth");
		
		if(userEmail.equals("")){
			return false;
		}
		
		int checkEmail = service.checkRegistEmail(userEmail);
		System.out.println(checkEmail);
		if(checkEmail != 1){
	
			String authText = EmailAuthClass.excuteEmailAuth();
			System.out.println("인증 코드 : "+ authText);
			result = service.sendAuthMail(userEmail, authText);
			if(result){
				session.setAttribute("sessionEmailAuth", authText);	
				
			} 
		}	
		
		System.out.println(result);
		return result;
	}

	// 이메일 인증 코드 입력 비교 실행
	@NoCheckLogin
	@RequestMapping(value="member.checkAuthText", method=RequestMethod.POST)
	public @ResponseBody boolean checkAuthText(String auth, String userEmail, HttpSession session){
		boolean result = false;
	
		if(auth.equals("") || userEmail.equals("") || session.getAttribute("sessionEmailAuth") == null){
			return false;
		}
		
		if(session.getAttribute("sessionEmailAuth").equals(auth)){
			String authToken = EmailAuthClass.excuteEmailAuth();
			session.setAttribute("sessionEmailAuthToken", authToken);
			session.removeAttribute("sessionEmailAuth");
			result = true;
		};
		
		return result;
	}

	// 아이디 찾기 페이지 이동
	@NoCheckLogin
	@RequestMapping(value="member.findId", method=RequestMethod.GET)
	public String moveFindId(){
		return "member/login/findIdForm";
	}
	
	// 아이디 찾기 실행
	@NoCheckLogin
	@RequestMapping(value="member.findId", method=RequestMethod.POST)
	public @ResponseBody boolean findId(String userEmail){
		
		boolean result = service.sendFindIdMail(userEmail);
		
		return result;
	}
	
	// 비밀번호 찾기 페이지 이동
	@NoCheckLogin
	@RequestMapping(value="member.findPw", method=RequestMethod.GET)
	public String moveFindPw(){
		return "member/login/findPwForm";
	}
	
	// 비밀번호 찾기 실행
	@NoCheckLogin
	@RequestMapping(value="member.findPw", method=RequestMethod.POST)
	public @ResponseBody boolean findPw(String userEmail, String userId, HttpSession session){
		boolean checkIdResult = service.checkIdFindPw(userId);
		boolean result = false;
		if(checkIdResult){
			String authText = EmailAuthClass.excutePwAuth();
			
			result = service.sendFindPwMail(userEmail, authText, userId);
			if(result){
				session.setAttribute("sessionPwAuth", authText);
			}
		}
		return result;
	}
	
	// 비밀번호 찾기(변경) 인증 문자 비교 실행
	@NoCheckLogin
	@RequestMapping(value="member.checkFindPwAuthText", method=RequestMethod.POST)
	public @ResponseBody boolean checkFindPwAuthText(String auth, HttpSession session){
		boolean result = false;
		
		
		if(session.getAttribute("sessionPwAuth").equals(auth)){
			result = true;
		};
		session.removeAttribute("sessionPwAuth");
		
		return result;
	}
	
	// 비밀번호 찾기(변경) 페이지 이동
	@NoCheckLogin
	@RequestMapping(value="member.changePw", method=RequestMethod.GET)
	public String moveChangePw(String userId){
		return "member/login/changeUserPw";
	}
	
	// TODO 비밀번호 변경 실행 // 변경 성공 페이지 & 실패 페이지 만들기
	@NoCheckLogin
	@RequestMapping(value="member.changePw", method=RequestMethod.POST)
	public String ChangePw(String userId, String userPw, HttpSession session, HttpServletResponse response){
		int result = service.changePw(userId, userPw);
		try {
			PrintWriter out;
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			if(result == 1){
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('비밀번호 변경 성공');");
				out.println("location.href = 'javascript:window.close()';"); 
				out.println("</script>"); 
				out.close();
			}else{
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('비밀번호 변경 실패');");
				out.println("location.href = 'javascript:window.close()';"); 
				out.println("</script>"); 
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		session.invalidate();
		
		return null;
	}
	
	// 회원정보 수정 비밀번호 확인 페이지 이동
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.checkModifyUserInfo", method=RequestMethod.GET)
	public String moveCheckModifyInfo(){
		return "member/login/checkModifyUserInfo";
	}
	
	// 회원정보 수정 비밀번호 확인 실행
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.checkModifyUserInfo", method=RequestMethod.POST)
	public ModelAndView getCheckModifyInfo(HttpSession session,String userPw){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")!=null){
			String userId = (String)session.getAttribute("sessionId");
			boolean checkPw = service.checkModifyPw(userId, userPw); 
			if(checkPw){
				mav.addObject("userId", userId);
				mav.setViewName("redirect:member.modifyUserInfo");
			}else{
				mav.addObject("checkResult", "비밀번호가 틀립니다.");
				mav.setViewName("redirect:member.checkModifyUserInfo");
			}
		}
		return mav;
	}	
	
	//TODO 회원 정보 수정
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.modifyUserInfo", method=RequestMethod.GET)
	public ModelAndView moveModifyUserInfo(HttpSession session,String userId){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")!=null){
			MemberDTO memberDTO = service.getUserInfo(userId);
			mav.addObject("memberDTO", memberDTO);
			mav.setViewName("member/login/modifyUserInfo");
		}else{
			mav.addObject("checkResult", "회원정보가 없습니다.");
			mav.setViewName("redirect:member.checkModifyUserInfo");
		}
		return mav;
	}
	
	//TODO 회원 정보 수정 실행
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.modifyUserInfo", method=RequestMethod.POST)
	public ModelAndView setModifyUserInfo(HttpSession session, MemberDTO memberDTO){
		
		ModelAndView mav = new ModelAndView();
		boolean result = service.setModifyUserInfo(memberDTO);
		if(result){
			session.setAttribute("sessionId", memberDTO.getUserId());
			session.setAttribute("sessionNick", memberDTO.getUserNick());
			session.setAttribute("sessionPermission", memberDTO.getUserPermission());
			mav.setViewName("redirect:main");
		}else{
			mav.setViewName("redirect:member.checkModifyUserInfo");
		}
		
		return mav;
	}
	
	//TODO 회원 탈퇴
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.deleteUser", method=RequestMethod.GET)
	public String moveUserInfo(){
		return "member/login/resignUser";
	}
	
	//TODO 회원 탈퇴
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.deleteUser", method=RequestMethod.POST)
	public String deleteUserInfo(HttpSession session, String userPw){
		String userId = (String)session.getAttribute("sessionId");
		if(service.checkModifyPw(userId, userPw)){
			if(service.deleteUser(userId)){
				session.invalidate();
				return "redirect:main";
			}
		}
		return "";
	}
	
	@CheckAuth(auth.ALL)
	@RequestMapping(value="member.mycontent")
	public ModelAndView moveMyContent(String board, HttpSession session){
		String user_Id = (String)session.getAttribute("sessionId");
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> boardlist = new HashMap<String,Object>();
		boardlist.put("userId", user_Id);
		boardlist.put("board", board);
		MemberDTO userinfo = service.getUserInfo(user_Id);
		if (board.contains("board")) {
			result = service.MyboardList(boardlist);	
		}
		if (board.contains("comment")) {
			result = service.MyCommentList(boardlist);
		}
		//List<Map<String,Object>> result = service.MyboardList(boardlist);
		mav.addObject("userinfo", userinfo);
		
		mav.addObject("boardlist", result);
		mav.setViewName("member/mypage/mycontent");
		
		return mav;
	}
	

	@RequestMapping(value="deletecomment",method=RequestMethod.GET)
	public ModelAndView setCommentDelete(int idx, HttpSession session, String board){
		String user_id = (String)session.getAttribute("sessionId");
		
		Map<String, Object> boardlist = new HashMap<String,Object>();
		boardlist.put("idx", idx);
		boardlist.put("board", board);
		if(user_id!=null){
			int url = service.deleteBoardComment(boardlist);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:member.mycontent?board="+board);
		return mav;		
			
	}
	
	@RequestMapping(value="member.getSuspendCause", method=RequestMethod.GET)
	public ModelAndView getUserSuspendCause(String userId){
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("cause", service.getSuspendCause(userId));
		mav.setViewName("member/mypage/mySuspendCause");
		return mav;
	}
	
	
}

