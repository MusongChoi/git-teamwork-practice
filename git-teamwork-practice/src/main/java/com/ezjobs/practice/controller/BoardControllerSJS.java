package com.ezjobs.practice.controller;

import org.springframework.web.bind.annotation.*;

import com.ezjobs.practice.entity.BoardSJS;
import com.ezjobs.practice.service.BoardServiceSJS;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;



/*************
 * 
 * 
 * @author YDH
 *
 *************/

@Controller
@RequestMapping("/boardSJS")//상위 서브도메인
public class BoardControllerSJS {
	@Inject
	private BoardServiceSJS boardServiceSJS;
	
	@GetMapping("/communitySJS")//커뮤니티 게시판 목록 /board/community
	public String community(Map<Object, Object> map){
		boardServiceSJS.community(map);
		return "boardListSJS";
	}
	
	@GetMapping("/contentSJS/{id}")//글내용 보기 /board/content
	public String content(@PathVariable String id,Map<Object, Object> map){
		map.put("id",id);
		boardServiceSJS.content(map);
		return "boardContentSJS";
	}
	
	@GetMapping("/writeSJS")//글작성 화면 /board/write
	public String writeView(Map<Object, Object> map){
		return "boardWriteSJS";
	}
	
	@PostMapping("/writeSJS")//글작성 요청 /board/write
	public String Write(@ModelAttribute BoardSJS board){
		boardServiceSJS.write(board);
		return "redirect:/boardSJS/communitySJS";
	}
	
}
