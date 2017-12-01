package member.support;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class RegistValidation {
	
	private final String id = "^[a-z]{1}[a-z0-9]{5,11}$";
	private final String pw = "^.*(?=^.{8,15}$)(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$";
	private final String nick = "^[a-zA-Z0-9가-힣]{2,10}$";
	private final String email = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";
	private final String name = "^[가-힣]{2,5}$";
	private final String birth = "^(\\d){4}([0][1-9]|[1][0-2])([0][0-9]|[1][0-9]|[2][0-9]|[3][0-1])$";
	private final String phone = "^(01[0|1|6|8|9])([0-9]{3,4})([0-9]{4})$";
		
	
	public boolean valid(String flag, String validInfo){
		Pattern pattern=null;
		Matcher matcher=null;
		
		//pattern 설정
		if(flag.equals("id")){
			pattern = Pattern.compile(id);
		}else if(flag.equals("pw")){
			pattern = Pattern.compile(pw);
		}else if(flag.equals("nick")){
			pattern = Pattern.compile(nick);
		}else if(flag.equals("email")){
			pattern = Pattern.compile(email);
		}else if(flag.equals("name")){
			pattern = Pattern.compile(name);
		}else if(flag.equals("birth")){
			pattern = Pattern.compile(birth);
		}else if(flag.equals("phone")){
			pattern = Pattern.compile(phone);
		}
		//matcher 설정
		matcher = pattern.matcher(validInfo);
		
		//값이 정규식과 같으면 true / 틀리면 false
		if(matcher.find()){
			return true;
		}		
		return false;
	}

	
}
