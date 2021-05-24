package com.soo.projectboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 게시판 컨트롤러
 * 
 * @author
 */

@Controller
@RequestMapping("/soo_project_board")
public class Soo_projectBoardController {

	@Resource(name = "Soo_projectBoardService")
	private Soo_projectBoardService service;
	private Soo_projectBoardDAO dao;
	
	static final Logger logger = LoggerFactory.getLogger(Soo_projectBoardController.class);
	/*
	  @RequestMapping(value = "/Soo_Edu_Board_Notice_List.do") public String
	  board(Model model, @RequestParam(value = "page", required = false,
	  defaultValue = "1") int page) throws Exception {
	  
	  int limit = 5; int listcount = service.getListCount();
	  
	  int startrow = (page - 1) * 5 + 1; int endrow = startrow + limit - 1;
	  HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
	  hashmap.put("stratrow", startrow); hashmap.put("endrow", endrow);
	  
	  List<Soo_projectBoardVO> boardlist = service.getBoardlist(hashmap);
	  
	  // 총 페이지 수 int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
	   더해서 올림 처리 // 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...) int startpage = (((int)
	  ((double) page / 5 + 0.9)) - 1) * 5 + 1; // 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30
	 * 등...) int endpage = maxpage; if (endpage > startpage + 5 - 1) endpage =
	 * startpage + 5 - 1; // 페이지 하단 링크 페이지
	 * 
	 * model.addAttribute("page", page); model.addAttribute("listcount", listcount);
	 * model.addAttribute("boardlist", boardlist); model.addAttribute("maxpage",
	 * maxpage); model.addAttribute("startpage", startpage);
	 * model.addAttribute("endpage", endpage);
	 * 
	 * System.out.println("boardlist=====>" + boardlist);
	 * 
	 * return "views/board/Soo_Edu_Board_Notice_List"; }
	 */

	// 공지사항 리스트
	/*
	@RequestMapping(value = "/Soo_Edu_Board_Notice_List.do")
	public String board(Model model) throws Exception {

		List<Soo_projectBoardVO> boardlist = service.getBoardlist();

		model.addAttribute("boardlist", boardlist);

		return "views/board/Soo_Edu_Board_Notice_List";
	}
	*/
	@RequestMapping(value="/Soo_Edu_Board_Notice_List.do")
	public ModelAndView openBoardList(Criteria cri) throws Exception {
	       
		System.out.println("리스트 컨트롤러 ");
		
	    ModelAndView mav = new ModelAndView("views/board/Soo_Edu_Board_Notice_List");
	        
	    PageMaker pageMaker = new PageMaker();
	    
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.getListCount());
	        
	    List<Map<String,Object>> list = service.selectBoardList(cri);
	    mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	        
	}
	
	// 공지사항 글쓰기 get
	@RequestMapping(value = "/soo_project1_notice_board_insert.do")
	public String getboardInsert() throws Exception {

		return "views/board//Soo_Edu_Board_Notice_Insert";
	}

	// 공지사항 글쓰기 post
	@RequestMapping(value = "/soo_project1_notice_board_inserts.do", method = RequestMethod.POST)
	public String boardInsert(Soo_projectBoardVO boardvo) throws Exception {

		service.board_insert(boardvo);
		System.out.println("boardInsert ----> " + boardvo);

		return "redirect:/soo_project_board/Soo_Edu_Board_Notice_List.do";
	}

	// 상세보기
	@RequestMapping(value = "/soo_project1_notice_view.do")
	public String boardView(int board_seq, Model model) throws Exception {

		Soo_projectBoardVO res = service.boardView(board_seq);

		model.addAttribute("boardview", res);

		return "views/board/Soo_Edu_Board_Notice_View";
	}
	
	//공지사항 상세보기(수정버튼클릭)
	@RequestMapping(value = "/soo_project1_notice_details.do")
	public String boardDetail(int board_seq, Model model) throws Exception {

		Soo_projectBoardVO res = service.boardView(board_seq);

		model.addAttribute("boardview", res);

		return "views/board/Soo_Edu_Board_Notice_Details";
	}
	
	// 공지사항 수정완료
	@RequestMapping(value = "/soo_project1_notice_update.do", method = RequestMethod.POST)
	public String boardUpdate(Soo_projectBoardVO boardvo) throws Exception {

		System.out.println("boardvo수정-->" + boardvo);
		int res = service.boardUpdate(boardvo);

		if (res > 0) {
			System.out.println("수정성공");
			return "redirect:/soo_project_board/Soo_Edu_Board_Notice_List.do";
		} else {
			System.out.println("수정실패");
			return "";
		}

	}
	
	// 공지사항 삭제
	@RequestMapping(value = "soo_project1_notice_delete.do")
	@ResponseBody
	public Map<String, String> boardDelete(@RequestParam(value = "board_seq[]", required = false) String[] board_seq)
			throws Exception {

		ArrayList<String> data = new ArrayList<String>();
		Map<String, String> map = new HashMap<String,String>();
		
		for (String seq : board_seq) {
			System.out.println("board_seq 컨트롤러 " + seq);

			int board_seq1 = Integer.parseInt(seq);
			int res = service.boardDelete(board_seq1);

			if (res > 0) {
				System.out.println("성공");
				data.add("success");
				
			} else {
				System.out.println("실패");
				data.add("fail");
			}

		}

		Iterator<String> itr = data.iterator();
		while (itr.hasNext()) {
			String result = itr.next();
			if ("fail".equals(result)) {
				map.put("RESULT", "fail");
				return map;
			}
		}
		
		map.put("RESULT", "success");
		return map;

	}

}
