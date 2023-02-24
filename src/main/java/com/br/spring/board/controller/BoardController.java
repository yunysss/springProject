package com.br.spring.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.br.spring.board.model.service.BoardService;
import com.br.spring.board.model.vo.Board;
import com.br.spring.common.model.vo.PageInfo;
import com.br.spring.common.template.FileUpload;
import com.br.spring.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	/*
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		// 포워딩할 응답뷰 => /WEB-INF/views/board/boardListView.jsp
		return "board/boardListView";
	}
	*/
	
	// ModelAndView 이용하기
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectList(pi);
		
		/*
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("board/boardListView");
		*/
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView"); // 메소드 체이닝 가능
		
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public String selectBoard(Board b) {
		// /WEB-INF/views/board/boardEnrollForm.jsp
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		//System.out.println(b);
		//System.out.println(upfile); // 첨부파일을 선택했든 안했든 생성된 객체 (단, filename에 원본명이 있냐, ""이냐의 차이로 조건검사 진행)
		
		// 전달된 파일이 있을 경우 => 파일명 수정작업 후 서버 업로드 => 원본명, 서버업로드된경로를 b에 이어서 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
			// 파일명 수정 작업 후 서버에 업로드 시키기 ("flower.png" => "2023022312213034523.png")
			/*
			String originName = upfile.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName)); // java.io.File로 import
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
			*/
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
			
			// 원본명, 서버업로드된경로(resources/xxxx/xxxxx.jpg)를 b에 이어서 담기
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName(saveFilePath);
		}
		
		// 넘어온 첨부파일 있을 경우 b : 제목, 작성자, 내용, 파일원본명, 파일저장경로
		// 넘어온 첨부파일 없을 경우 b : 제목, 작성자, 내용, null, null
		int result = bService.insertBoard(b);
		
		if(result > 0) { // 성공 => 알람문구 담아서 => 게시글 리스트페이지
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.bo";
		} else { // 실패 => 에러문구 담아서 => 에러페이지
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int no, ModelAndView mv) {
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			Board b = bService.selectBoard(no);
			mv.addObject("b", b).setViewName("board/boardDetailView");
		}else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
}
















