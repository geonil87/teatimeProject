package admin.dto;

public class DashBoardDTO {

	private String count;
	private String date;

	public DashBoardDTO() {}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public DashBoardDTO(String count, String date) {
		super();
		this.count = count;
		this.date = date;
	}

	public String toString() {
		return "DashBoardDTO [count=" + count + ", date=" + date + "]";
	}
	
	
	
}
