package board.dto;

public class BoardCommentRecommendDTO {
	int good;
	int bad;
	public BoardCommentRecommendDTO() {}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public BoardCommentRecommendDTO(int good, int bad) {
		super();
		this.good = good;
		this.bad = bad;
	}
	
}
