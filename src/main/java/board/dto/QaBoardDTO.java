package board.dto;

public class QaBoardDTO {
	private int viewIdx;
	private int idx;
	private int category;
	private int qaGroup;
	private String title;
	private String content;
	private String userNick;
	private String userId;
	private String wdate;
	private int condition;
	private int permission;
	
	
	public int getViewIdx() {return viewIdx;}
	public void setViewIdx(int viewIdx) {this.viewIdx = viewIdx;}
	public int getIdx() {return idx;}
	public void setIdx(int idx) {this.idx = idx;}
	public int getCategory() {return category;}
	public void setCategory(int category) {this.category = category;}
	public int getQaGroup() {return qaGroup;}
	public void setQaGroup(int qaGroup) {this.qaGroup = qaGroup;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getUserNick() {return userNick;}
	public void setUserNick(String userNick) {this.userNick = userNick;}
	public String getUserId() {return userId;}
	public void setUserId(String userId) {this.userId = userId;}
	public String getWdate() {return wdate;}
	public void setWdate(String wdate) {this.wdate = wdate;}
	public int getCondition() {return condition;}
	public void setCondition(int condition) {this.condition = condition;}
	public int getPermission() {return permission;}
	public void setPermission(int permission) {this.permission = permission;}
	
	public QaBoardDTO() {super();}
	
	public QaBoardDTO(int viewIdx, int idx, int category, int qaGroup, String title, String content, String userNick,
			String userId, String wdate, int condition, int permission) {
		super();
		this.viewIdx = viewIdx;
		this.idx = idx;
		this.category = category;
		this.qaGroup = qaGroup;
		this.title = title;
		this.content = content;
		this.userNick = userNick;
		this.userId = userId;
		this.wdate = wdate;
		this.condition = condition;
		this.permission = permission;
	}
	@Override
	public String toString() {
		return "QaBoardDTO [viewIdx=" + viewIdx + ", idx=" + idx + ", category=" + category + ", qaGroup=" + qaGroup
				+ ", title=" + title + ", content=" + content + ", userNick=" + userNick + ", userId=" + userId
				+ ", wdate=" + wdate + ", condition=" + condition + ", permission=" + permission + "]";
	}
	
	
			
}
