package admin.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import admin.dto.DashBoardDTO;


@Component
public class DashBoardDAO {

	@Autowired
	SqlSession session;
	
	String namespace = "dashList";
	

	public int boardTotalCount(String board) {
		HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
		 dateMap.put("boardname", board);
		return session.selectOne(namespace+".boardTotalCount", dateMap);
	}
	
	public int boardMonthCount(String board) {
		HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
		 dateMap.put("boardname", board);
		int count = session.selectOne("dashList.boardMonthCount", dateMap);
		return count;
	}
	
	
	public List<DashBoardDTO> boardMonthGRF(String board) {
		HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
		 dateMap.put("boardname", board);
	 List<DashBoardDTO> list = new ArrayList<DashBoardDTO>();
	 list = session.selectList("dashList.boardMonthGRF", dateMap);

		return list;
	}
	
	public int boardWeekCount(String board) {
		HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
		 dateMap.put("boardname", board);
		int count = session.selectOne("dashList.boardWeekCount", dateMap);
		return count;
	}
	
	
	public List<DashBoardDTO> boardWeekGRF(String board) {
		HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
		 dateMap.put("boardname", board);

	 List<DashBoardDTO> list = new ArrayList<DashBoardDTO>();
	 list = session.selectList("dashList.boardWeekGRF", dateMap);

		return list;
	}
	
	public int boardDayCount(String board) {
		HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
		 dateMap.put("boardname", board);
		int count = session.selectOne("dashList.boardDayCount", dateMap);
		return count;
	}
	
	
	public List<DashBoardDTO> boardDayGRF(String board) {
		
	 List<DashBoardDTO> list = new ArrayList<DashBoardDTO>();
	 HashMap<String, String> dateMap = new HashMap<String, String>();	 	 
	 dateMap.put("boardname", board);
	 list = session.selectList("dashList.boardDayGRF", dateMap);

		return list;
	}



}
