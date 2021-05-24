package com.soo.projectmain;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller

public class Soo_projectMainController {
	
	@Resource(name = "Soo_projectMainService")
	private Soo_projectMainService service;
	
	
	@RequestMapping(value = "/soo_project_main/soo_project_main.do")
	public String soo_project_main(ModelMap model, Soo_projectMainVO vo) throws Exception {
		
		return "views/sooproject_main";
		
	}
	@RequestMapping(value = "/test/mvcPattern.do")
	public String test() throws Exception{
		
//		return "views/user/list";
		return "views/board/board_list";
	}
	
	@RequestMapping(value = "/index.do")
	public String edu_index() throws Exception{
		
		return "views/edu/index";
	}
	
	
	
	
	@RequestMapping(value = "/papago.do")
	public String edu_papago() throws Exception{
		
		return "views/edu/papago";
	}
	
	@RequestMapping(value = "/shop.do")
	public String edu_shop() throws Exception{
		
		return "views/edu/shop";
	}
	
	@RequestMapping(value = "/detail.do")
	public String edu_detail() throws Exception{
		
		return "views/edu/detail";
	}
	
	@RequestMapping(value = "/modify.do")
	public String edu_modify() throws Exception{
		
		return "views/edu/modify";
	}
	
	
	

	
}
