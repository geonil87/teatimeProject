package admin.dto;

public class LoginLogDTO {
	
	private int idx;
	private String userId;
	private String userIp;
	private String logCondition;
	private String wdate;
	
	
	
	public int getIdx() {return idx;}
	public void setIdx(int idx) {this.idx = idx;}
	public String getUserId() {return userId;}	
	public void setUserId(String userId) {this.userId = userId;}
	public String getUserIp() {return userIp;}
	public void setUserIp(String userIp) {this.userIp = userIp;}
	public String getLogCondition() {return logCondition;}
	public void setLogCondition(String logCondition) {this.logCondition = logCondition;}
	public String getWdate() {return wdate;}
	public void setWdate(String wdate) {this.wdate = wdate;}
	
	public LoginLogDTO() {super();}

	public LoginLogDTO(int idx, String userId, String userIp, String logCondition, String wdate) {
		super();
		this.idx = idx;
		this.userId = userId;
		this.userIp = userIp;
		this.logCondition = logCondition;
		this.wdate = wdate;
	}
		
}
