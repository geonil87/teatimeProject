package admin.dto;

import member.dto.MemberDTO;

public class BlackListDTO extends MemberDTO {
	private int reportCount;
	
	
	public int getReportCount() {return reportCount;}
	public void setReportCount(int reportCount) {this.reportCount = reportCount;}
		
	
	public BlackListDTO() {super();}
	
	public BlackListDTO(int idx, String userId, String userPw, String userName, String userNick, String userPhone,
			String userEmail, String userPostcode, String userAddress1, String userAddress2, String userGender,
			String userBirthday, String userIndate, int userPermission, int reportCount) {
		super(idx, userId, userPw, userName, userNick, userPhone, userEmail, userPostcode, userAddress1, userAddress2,
				userGender, userBirthday, userIndate, userPermission);
		this.reportCount = reportCount;
	}
	

	
	
}
