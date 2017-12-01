package board.dto;

public class NoticesBoardDTO {
	int idx;
	int category;
	int importance;
	String title;
	String content;
	String user_id;
	String wdate;
	int hit;
	int available;
	String user_nick;
	
	
	public NoticesBoardDTO(){}
	public NoticesBoardDTO(int idx, int category, int importance, String title, String content, String user_id,
			String wdate, int hit, int available, String user_nick) {
		super();
		this.idx = idx;
		this.category = category;
		this.importance = importance;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.wdate = wdate;
		this.hit = hit;
		this.available = available;
		this.user_nick = user_nick;
	}



	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public int getImportance() {
		return importance;
	}


	public void setImportance(int importance) {
		this.importance = importance;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}


	public int getAvailable() {
		return available;
	}


	public void setAvailable(int available) {
		this.available = available;
	}


	public String getUser_nick() {
		return user_nick;
	}


	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	
	
	
	
}
