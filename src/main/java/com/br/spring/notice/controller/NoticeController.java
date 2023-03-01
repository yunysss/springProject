package com.br.spring.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.br.spring.common.model.vo.PageInfo;
import com.br.spring.common.template.Pagination;
import com.br.spring.notice.model.service.NoticeService;
import com.br.spring.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Notice> list = nService.selectList(pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "notice/noticeListView";
	}
	
	@RequestMapping("enrollForm.no")
	public String selectNotice() {
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, Model m) {
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:list.no";
		} else {
			m.addAttribute("errorMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.no")
	public String selectNotice(int no, Model m) {
		
		Notice n = nService.selectNotice(no);
		m.addAttribute("n", n);
		
		return "notice/noticeDetailView";
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int no, Model m) {
		int result = nService.deleteNotice(no);
		
		if(result > 0) {
			return "redirect:list.no";
		}else {
			m.addAttribute("errorMsg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}
	
}
