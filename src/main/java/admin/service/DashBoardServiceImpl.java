package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.DashBoardDAO;
import admin.dto.DashBoardDTO;

@Service("DashBoardService")
public class DashBoardServiceImpl implements DashBoardService {

	@Autowired
	DashBoardDAO dao;
	
	
	public int boardTotalCount(String board) {
		return dao.boardTotalCount(board);
	}
	
	public int boardMonthCount(String board) {
		return dao.boardMonthCount(board);
	}
	
	public List<DashBoardDTO> boardMonthGRF(String board) {
		return dao.boardMonthGRF(board);
	}
	
	public int boardWeekCount(String board) {
		return dao.boardWeekCount(board);
	}
	
	public List<DashBoardDTO> boardWeekGRF(String board) {
		return dao.boardWeekGRF(board);
	}
	
	public int boardDayCount(String board) {
		return dao.boardDayCount(board);
	}
	
	public List<DashBoardDTO> boardDayGRF(String board) {
		return dao.boardDayGRF(board);
	}

}
