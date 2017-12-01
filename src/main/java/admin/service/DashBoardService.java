package admin.service;

import java.util.List;

import admin.dto.DashBoardDTO;

public interface DashBoardService {


	
	public int boardTotalCount(String board);
	
	public int boardMonthCount(String board);
	
	public List<DashBoardDTO> boardMonthGRF(String board);
	
	public int boardWeekCount(String board);
	
	public List<DashBoardDTO> boardWeekGRF(String board);
	
	public int boardDayCount(String board);
	
	public List<DashBoardDTO> boardDayGRF(String board);
}
