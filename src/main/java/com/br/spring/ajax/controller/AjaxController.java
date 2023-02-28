package com.br.spring.ajax.controller;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.spring.ajax.model.vo.User;
import com.google.gson.Gson;

@Controller
public class AjaxController {
	
	/*
	 * 1. HttpServletResponse 객체로 응답데이터 응답하기
	
	@RequestMapping("ajax1.do")
	public void ajaxMethod1(String name, int age, HttpServletResponse response) throws IOException {
		System.out.println(name);
		System.out.println(age);
		
		// 요청처리를 위한 서비스 호출
		
		// 요청처리가 다 됐다는 가정하에 그 페이지에 돌려줄 응답데이터가 있을 경우
		String responseData = "응답문자열 : " + name + "은(는) " + age + "살 입니다.";
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseData); // throws로 예외처리
	}
	 */
	
	/*
	 * 2. 응답할 데이터를 문자열로 바로 리턴하는 방법 (HttpServletResponse 객체 안 쓸 수 있음)
	 *    단, 내가 리턴하는 문자열이 포워딩할 응답뷰가 아니라 응답데이터라는걸 선언해줘야함
	 *    @ResponseBody를 반드시 붙여야함
	 */
	/*
	@ResponseBody
	@RequestMapping(value="ajax1.do", produces="text/html; charset=UTF-8")
	public String ajaxMethod1(String name, int age) {
		return "응답문자열 : " + name + "은(는) " + age + "살 입니다.";
	}
	*/
	
	/*
	 * * 다수의 응답데이터가 있을 경우 (HttpServletResponse 객체 활용)
	 */
	/*
	@RequestMapping("ajax1.do")
	public void ajaxMethod1(String name, int age, HttpServletResponse response) throws IOException {
		// response.setContentType("text/html; charset=UTF-8");
		// response.getWriter().print(name);
		// response.getWriter().print(age);
		// 연이어서 출력하는 데이터가 하나의 문자열로 연이어져있음 => 따로 접근하기 어려움
		
		// JSON형태로 담아서 응답
		// JSONArray	=> [값, 값, 값, ...]		=> 자바에서의 ArrayList와 유사
		// JSONObject	=> {키:값, 키:값, ...}		=> 자바에서의 HashMap과 유사
		
		// 방법1 .JSONArray로 담아서 응답
		//JSONArray jArr = new JSONArray();
		//jArr.add(name); // ["홍길동"]
		//jArr.add(age); // ["홍길동", 12]
		
		// 방법2. JSONObject로 담아서 응답
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
	}
	*/
	
	/*
	 * * 다수의 응답데이터가 있을 경우 (@ResponseBody 활용)
	 */
	@ResponseBody
	@RequestMapping(value="ajax1.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod1(String name, int age) {
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age); // {name:'홍길동', age:10}
		
		return jObj.toJSONString(); // "{name:'홍길동', age:10}"
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="ajax2.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod2(int num) {
		
		//User u = uService.selectUser(num);
		User u = new User("user01", "pass01", "홍길동", 20, "010-2222-3333");
		
		// JSON형태로 만들어서 응답
		JSONObject jObj = new JSONObject();
		jObj.put("userId", u.getUserId());
		jObj.put("userPwd", u.getUserPwd());
		jObj.put("userName", u.getUserName());
		jObj.put("age", u.getAge());
		jObj.put("phone", u.getPhone());
		
		return jObj.toJSONString();
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="ajax2.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod2(int num) {
		
		//User u = uService.selectUser(num);
		User u = new User("user01", "pass01", "홍길동", 20, "010-2222-3333");
		
		return new Gson().toJson(u); // 필드명으로 key값 자동 생성되어 JSon 객체 String으로 반환됨
	}
	
	@ResponseBody
	@RequestMapping(value="ajax3.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod3() {
		
		//ArrayList<User> list = uService.selectUserList();
		ArrayList<User> list = new ArrayList<>();
		list.add(new User("user01", "pass01", "홍길동", 10, "010-2222-3333"));
		list.add(new User("user02", "pass02", "김말똥", 20, "010-4444-5555"));
		list.add(new User("user03", "pass03", "강개순", 30, "010-6666-7777"));
		list.add(new User("user04", "pass04", "김순자", 40, "010-8888-9999"));
		
		// [{userId:'xxxx', userPwd:'xxxx', ..}, {}, {}, {}]
		return new Gson().toJson(list);
	}
}





















