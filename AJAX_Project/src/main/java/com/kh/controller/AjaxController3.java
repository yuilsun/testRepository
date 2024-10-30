package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.model.vo.Member;

/**
 * Servlet implementation class AjaxController3
 */
@WebServlet("/ajax3.do")
public class AjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		//전달받은 userNo를 이용하여 데이터를 조회했다는 가정 후 진행
		//Member 객체 정의해서 임의 값으로 응답데이터 구성하기
		Member m  = new Member(userNo,"김유저",15,"남자");
		
		
		//자바객체를 그대로 전달할 수 없고 JSON 형태로 변경해주어야함
		//JSONObject에 데이터 옮겨 담고 전달하기
		JSONObject jobj = new JSONObject();
		
		jobj.put("userNo", m.getUserNo());
		jobj.put("userName", m.getUserName());
		
		jobj.put("age", m.getAge());
		
		jobj.put("gender", m.getGender());
		
		
		
		
		
		//위 객체 데이터를 응답 데이터로 전달하기
		 response.setContentType("json/application;charset=UTF-8");
     //response.getWriter().print(m);
     //옮겨 담은 데이터를 가진 JSONObject 응답
		
		response.getWriter().print(jobj);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
