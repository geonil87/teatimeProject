package member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import member.dao.MemberDAO;
import member.dto.MemberDTO;
import member.support.EmailAuthClass;
import member.support.RegistValidation;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	RegistValidation registValidation;
		
	//로그인
	public Map<String,String> checkLogin(Map<String,String> loginInfo) {
		Map<String, String> loginResultMap = dao.checkLogin(loginInfo);
		
		
		if(loginResultMap == null){
			loginResultMap = new HashMap<String,String>();
			loginResultMap.put("loginFailId", "아이디가 존재하지 않습니다.");
		}else if(!loginResultMap.get("userPw").equals(loginInfo.get("user_pw"))){
			loginResultMap.remove("userPw");
			loginResultMap.remove("userPermission");
			loginResultMap.remove("usernick");
			loginResultMap.put("loginFailPw", "비밀번호가 일치하지 않습니다.");
		}else if(String.valueOf(loginResultMap.get("userPermission")).equals("99")){
			loginResultMap.remove("userPw");
			loginResultMap.remove("userPermission");
			loginResultMap.remove("usernick");
			loginResultMap.put("loginFailId", "탈퇴한 회원 아이디 입니다.");
		}
		
		return loginResultMap;
	}
	
	//회원가입
	public Map<String,String> insertRegistration(MemberDTO memberDTO) {	
		Map<String,String> registResultMap = null;
		boolean valid = true;
		int registResult = 0;
		// 정규화(validation) 시작
		String result = "없음";
		if(!registValidation.valid("id", memberDTO.getUserId())){valid = false; result = "아이디실패";}
		else if(!registValidation.valid("pw", memberDTO.getUserPw())){valid = false; result = "비밀번호실패";}
		else if(!registValidation.valid("nick", memberDTO.getUserNick())){valid = false; result = "닉네임실패";}
		else if(!registValidation.valid("email", memberDTO.getUserEmail())){valid = false; result = "이메일실패";}
		else if(!registValidation.valid("name", memberDTO.getUserName())){valid = false; result = "이름실패";}
		else if(!registValidation.valid("birth", memberDTO.getUserBirthday())){valid = false; result = "생일실패";}
		else if(!registValidation.valid("phone", memberDTO.getUserPhone())){valid = false; result = "핸드폰실패";}
		else if(memberDTO.getUserPostcode() == null){ valid = false; result = "우편번호실패";}
		else if(memberDTO.getUserAddress1() == null){ valid = false; result = "주소1실패";}
		else if(memberDTO.getUserAddress2() == null){ valid = false; result = "주소2실패";}
		else if(memberDTO.getUserGender() == null){ valid = false; result = "성별실패";};		
		
		
		if(valid){
			registResult = dao.insertRegist(memberDTO);
			if(registResult == 1){
				registResultMap = dao.checkRegist(memberDTO.getUserId());
			}
		}						
		return registResultMap;  
	}

	public boolean checkRegistId(String userId) {
		return (dao.checkRegistSameId(userId) == 0 ? true : false);
	}
	
	public boolean checkRegistNick(String userNick) {
		return (dao.checkRegistSameNick(userNick) == 0 ? true : false) ;
	}


	public int checkRegistEmail(String userEmail) {
		if(!registValidation.valid("email", userEmail)){ return 1;}
		return dao.checkRegistSameEmail(userEmail);
	}
	
	
	public boolean sendAuthMail(String userEmail, String authText) {
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject("Teatime 회원가입 인증 메일 입니다.");
            helper.setText("인증 코드는 [ "+authText+" ] 입니다.", true);
            helper.setFrom("teatimeprojectmaster@gmail.com");
            helper.setTo(userEmail);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            e.getCause();
            e.getMessage();
        }
        return false;
    }


	public boolean sendFindIdMail(String userEmail) {
		String findIdResult = dao.findId(userEmail);
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject("Teatime 아이디 찾기 메일 입니다.");
            helper.setText("회원님의 아이디는 [ "+findIdResult+" ] 입니다.", true);
            helper.setFrom("teatimeprojectmaster@gmail.com");
            helper.setTo(userEmail);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            e.getCause();
            e.getMessage();
        }
        return false;
	}

	

	public boolean checkIdFindPw(String userId) {
		int checkIdResult = dao.checkIdFindPw(userId);
		if(checkIdResult == 1){
			return true;
		}
		return false;
	}
	

	public boolean sendFindPwMail(String userEmail, String authText, String userId) {
        if(dao.getUserEmail(userId).equals(userEmail)){
        	MimeMessage message = javaMailSender.createMimeMessage();
        	
        	try {
        		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        		helper.setSubject("Teatime 비밀번호 변경 서비스 인증 메일입니다.");
        		helper.setText("비밀번호 변경 인증 코드는 [ "+authText+" ] 입니다.", true);
        		helper.setFrom("teatimeprojectmaster@gmail.com");
        		helper.setTo(userEmail);
        		
        		javaMailSender.send(message);
        		return true;
        	} catch (MessagingException e) {
        		e.printStackTrace();
        		e.getCause();
        		e.getMessage();
        	}
        }
        return false;
	}
	
	
	public int changePw(String userId,String userPw) {
		Map<String,String> userInfo = new HashMap<String,String>();
		userInfo.put("userId", userId);
		userInfo.put("userPw", userPw);
		return dao.changePw(userInfo);
	}
	

	public boolean checkModifyPw(String userId,String userPw){
		if(dao.checkModifyPw(userId).equals(userPw)){
			return true;
		}
		return false;
	}

	public MemberDTO getUserInfo(String userId) {
		return dao.getUserInfo(userId);
	}

	public boolean setModifyUserInfo(MemberDTO memberDTO) {
		int resultModify = dao.setModifyUserInfo(memberDTO);
		return (resultModify==1) ? true:false;
	}

	public boolean insertUserLog(String userId, String ip, String loginCondition) {
		Map<String,String> temp = new HashMap<String,String>();
		temp.put("userId", userId);
		temp.put("ip", ip);
		temp.put("loginCondition", loginCondition);
		return (dao.insertUserLog(temp)==1) ? true:false;
	}
	
	public boolean deleteUser(String userId){
		return (dao.deleteUser(userId)==1?true:false);
	}


	public List<Map<String, Object>> MyboardList(Map<String, Object> boardlist) {
		return dao.boardList(boardlist);
	}
	
	public List<Map<String, Object>> MyCommentList(Map<String, Object> boardlist) {
		return dao.commentList(boardlist);
	}
	
	//댓글 삭제하기
	public int deleteBoardComment(Map<String, Object> boardlist){
		int result = dao.deleteBoardComment(boardlist);
		
		String url = "";
		if(result == 1 ){
			url = "storyboard/teatime.storyBoardDetail";
		}else{
			url = "storyboard/StoryBoardCommentWriteFail";
		}
		return dao.deleteBoardComment(boardlist);
	}
	
	public String getSuspendCause(String userId){
		return dao.getSuspendCause(userId);
	};
	
	
}
