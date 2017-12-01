package board.dto;

import org.springframework.stereotype.Repository;


public class StoryBoardDTO {
	

	int idx;
	String title;
	String content;
	String user_id;
	String user_nick;
	String wdate;
	int hit;
	int available;
	int good;
	int bad;
	int comment_count;
	
	public int getBad() {
		return bad;
	}
	
	public void setBad(int bad) {
		this.bad = bad;
	}


	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public StoryBoardDTO(){}
	
	public StoryBoardDTO(int idx, String title, String content, String user_id,String user_nick ,String wdate, int hit,int available) {
		
		
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.wdate = wdate;
		this.hit = hit;
		this.available = available;
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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
	
	
	@Override
	public String toString() {
		return "StoryBoardDTO [idx=" + idx + ", title=" + title + ", content=" + content + ", user_nick=" + user_id
				+ ", wdate=" + wdate + ", hit=" + hit + "]";
	}
	

}
