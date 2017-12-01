package board.support;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

public class Paging {
	
	private int totalCount; // ��ü �Խù���
	private int countList;	// �Խ��ǿ� �ѷ��� �Խù� ���� (set ���� ����)
	private int countPage; 	// �Խ��ǿ� �ѷ��� ������ ���� (set ���� ����)
	
	private int pageNum;	// ���� ������ ��ȣ
	private int totalPage;	// �Խ����� ������ ��
	private int startPage;	// ���� ������
	private int endPage;	// ������ ������
	private int startContent;	// �ѷ��ִ� ���� �Խù� ��ȣ
	private int endContent;	// �ѷ��ִ� ������ �Խù� ��ȣ
	
	public Map<String,Integer> getPaging(int pageNum){
		totalPage = (int)Math.ceil((double)totalCount/(double)countList);
		// Preview & Next ��ư�� ������ ����
		if(pageNum <= 0){
			pageNum = 1;
		}else if(pageNum > totalPage){
			pageNum = totalPage;
		}
		
		startPage = pageNum-((pageNum-1)%countPage);
		
		endPage = startPage+(countPage-1);
		if(endPage > totalPage){endPage = totalPage;};	// endPage�� �� ������ �� ���� ������ end �������� �� ��������
		
		startContent = 1+(countList*(pageNum-1));
		endContent = countList*pageNum;
		
		// �� �Խù��� �ѷ������ �Խù� ������ ������� ����������
		if(totalCount < countList){
			startPage = 0;
			endPage = 1;
		}
		

		
		
		Map<String,Integer> page = new HashMap<String, Integer>();
		page.put("pageNum", pageNum);
		page.put("totalPage", totalPage);
		page.put("startPage", startPage);
		page.put("endPage", endPage);
		page.put("startContent", startContent);
		page.put("endContent", endContent);
		return page;
	}

	
	/*Getter & Setter*/
	public int getTotalCount() {return totalCount;}
	public void setTotalCount(int totalCount) {this.totalCount = totalCount;}
	public int getCountList() {return countList;}
	public void setCountList(int countList) {this.countList = countList;}
	public int getCountPage() {return countPage;}
	public void setCountPage(int countPage) {this.countPage = countPage;}
	public int getPageNum() {return pageNum;}
	public void setPageNum(int pageNum) {this.pageNum = pageNum;}
	public int getTotalPage() {return totalPage;}
	public void setTotalPage(int totalPage) {this.totalPage = totalPage;}
	public int getStartPage() {return startPage;}
	public void setStartPage(int startPage) {this.startPage = startPage;}
	public int getEndPage() {return endPage;}
	public void setEndPage(int endPage) {this.endPage = endPage;}
	public int getStartContent() {return startContent;}
	public void setStartContent(int startContent) {this.startContent = startContent;}
	public int getEndContent() {return endContent;}
	public void setEndContent(int endContent) {this.endContent = endContent;}
		
}
