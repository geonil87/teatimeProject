package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;

public interface MemberService {
	
	public Map<String,String> checkLogin(Map<String,String> loginInfo);
	
	public Map<String,String> insertRegistration(MemberDTO memberDTO);
	
	public boolean checkRegistId(String userId);
	
	public boolean checkRegistNick(String userNick);
	
	public int checkRegistEmail(String userEmail);
	
	public boolean sendAuthMail(String userEmail, String authText);
	
	public boolean sendFindIdMail(String userEmail);
	
	public boolean checkIdFindPw(String userId);
	
	public boolean sendFindPwMail(String userEmail, String authText, String userId);
	
	public int changePw(String userId,String userPw);
	
	public boolean checkModifyPw(String userId,String userPw);
	
	public MemberDTO getUserInfo(String userId);
	
	public boolean setModifyUserInfo(MemberDTO memberDTO);
	
	public boolean insertUserLog(String userId, String ip, String loginCondition);
	
	public boolean deleteUser(String userId);
	
	public List<Map<String,Object>> MyboardList(Map<String,Object> boardlist);
	
	public int deleteBoardComment(Map<String,Object> boardlist);
	
	public String getSuspendCause(String userId);
	
}
