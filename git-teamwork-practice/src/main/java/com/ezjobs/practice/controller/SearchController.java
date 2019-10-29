package com.ezjobs.practice.controller;

import org.springframework.web.bind.annotation.*;

import com.ezjobs.practice.entity.Search;
import com.ezjobs.practice.service.SearchService;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;




//@SuppressWarnings("unused") // 엔티티가 사용이 되지 않았음. 나중에 수정
@Controller
public class SearchController {
	@Inject
	private SearchService searchService;
	
	@GetMapping("/searchlist/{npg}")
	public String search(Map<Object, Object> map, @PathVariable String npg){
		
		int nowPage = Integer.parseInt(npg);
		searchService.search(map);
		searchService.makeLastPage(map); 
		searchService.makeBlock(map, nowPage);

		return "searchList";
	}
	
	@GetMapping("/searchlist")
	public String dsearch() {
		return "redirect:/searchlist/1";
	}
	
	
	
	/*
	 * @GetMapping("/searchlist/searchText={tp}&page={npg}") public String
	 * search2(@PathVariable String tp, @PathVariable String npg, Map<Object,
	 * Object> map){ int nowPage = Integer.parseInt(npg); searchService.search(map);
	 * searchService.makeLastPage(map); searchService.makeBlock(map, nowPage);
	 * return "redirect:/searchlist"; }
	 */
}