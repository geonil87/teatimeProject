package admin.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.dto.DashBoardDTO;
import admin.service.DashBoardService;
import admin.service.DashBoardServiceImpl;


@Controller
public class DashBoardMainController {

	@Autowired
	DashBoardServiceImpl service;
	
	@RequestMapping(value="admin.dashBoardMain", method=RequestMethod.GET)
	public String dashboardMain(Model model){
		
		String board = "story_board";
		//스토리 토탈 숫자
				int storyTotalCount = service.boardTotalCount(board);
				model.addAttribute("storyTotalCount", storyTotalCount);
				//스토리 달 숫자
				int storyMonthCount = service.boardMonthCount(board);
				model.addAttribute("storyMonthCount", storyMonthCount);
				//스토리 달 그래프
				List<DashBoardDTO> storyMonthGRF = service.boardMonthGRF(board);
				model.addAttribute("storyMonthGRF", storyMonthGRF);
				//스토리 주 숫자
				int storyWeekCount = service.boardWeekCount(board);
				model.addAttribute("storyWeekCount", storyWeekCount);
				//스토리 주 그래프
				List<DashBoardDTO> storyWeekGRF = service.boardWeekGRF(board);
				model.addAttribute("storyWeekGRF", storyWeekGRF);				
				//스토리 일 숫자
				int storyDayCount = service.boardDayCount(board);
				model.addAttribute("storyDayCount", storyDayCount);
				//스토리 일 그래프
				List<DashBoardDTO> storyDayGRF = service.boardDayGRF(board);
				/*for (DashBoardDTO list : storyDayGRF) {
					System.out.println("storyDayGRF"+list);
				}*/
				model.addAttribute("storyDayGRF", storyDayGRF);	
		
		String board2 = "photo_board";
		//포토 토탈 숫자
				int photoTotalCount = service.boardTotalCount(board2);
				model.addAttribute("photoTotalCount", photoTotalCount);
				//포토 달 숫자
				int photoMonthCount = service.boardMonthCount(board2);
				model.addAttribute("photoMonthCount", photoMonthCount);
				//포토 달 그래프
				List<DashBoardDTO> photoMonthGRF = service.boardMonthGRF(board2);
				model.addAttribute("photoMonthGRF", photoMonthGRF);
				//포토 주 숫자
				int photoWeekCount = service.boardWeekCount(board2);
				model.addAttribute("photoWeekCount", photoWeekCount);
				//포토 주 그래프
				List<DashBoardDTO> photoWeekGRF = service.boardWeekGRF(board2);
				model.addAttribute("photoWeekGRF", photoWeekGRF);				
				//포토 일 숫자
				int photoDayCount = service.boardDayCount(board2);
				model.addAttribute("photoDayCount", photoDayCount);
				//포토 일 그래프
				List<DashBoardDTO> photoDayGRF = service.boardDayGRF(board2);
				model.addAttribute("photoDayGRF", photoDayGRF);		
				
		String board3 = "photo_board";
		//포토 토탈 숫자
				int mediaTotalCount = service.boardTotalCount(board3);
				model.addAttribute("photoTotalCount", mediaTotalCount);
				//포토 달 숫자
				int mediaMonthCount = service.boardMonthCount(board3);
				model.addAttribute("photoMonthCount", mediaMonthCount);
				//포토 달 그래프
				List<DashBoardDTO> mediaMonthGRF = service.boardMonthGRF(board3);
				model.addAttribute("photoMonthGRF", mediaMonthGRF);
				//포토 주 숫자
				int mediaWeekCount = service.boardWeekCount(board3);
				model.addAttribute("photoWeekCount", mediaWeekCount);
				//포토 주 그래프
				List<DashBoardDTO> mediaWeekGRF = service.boardWeekGRF(board3);
				model.addAttribute("photoWeekGRF", mediaWeekGRF);				
				//포토 일 숫자
				int mediaDayCount = service.boardDayCount(board3);
				model.addAttribute("photoDayCount", mediaDayCount);
				//포토 일 그래프
				List<DashBoardDTO> mediaDayGRF = service.boardDayGRF(board3);
				model.addAttribute("photoDayGRF", mediaDayGRF);		
				
				String userlog = "userlog";
				//포토 토탈 숫자
						int userTotalCount = service.boardTotalCount(userlog);
						model.addAttribute("userTotalCount", userTotalCount);
						//포토 달 숫자
						int userMonthCount = service.boardMonthCount(userlog);
						model.addAttribute("userMonthCount", userMonthCount);
						//포토 달 그래프
						List<DashBoardDTO> userMonthGRF = service.boardMonthGRF(userlog);
						model.addAttribute("userMonthGRF", userMonthGRF);
						//포토 주 숫자
						int userWeekCount = service.boardWeekCount(userlog);
						model.addAttribute("userWeekCount", userWeekCount);
						//포토 주 그래프
						List<DashBoardDTO> userWeekGRF = service.boardWeekGRF(userlog);
						model.addAttribute("userWeekGRF", userWeekGRF);				
						//포토 일 숫자
						int userDayCount = service.boardDayCount(userlog);
						model.addAttribute("userDayCount", userDayCount);
						//포토 일 그래프
						List<DashBoardDTO> userDayGRF = service.boardDayGRF(userlog);
						model.addAttribute("userDayGRF", userDayGRF);		
				
				
				
		
		
		return "admin/dashboard/dashBoardMain";
	}

}
