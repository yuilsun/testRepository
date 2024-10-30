package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxController1
 */
@WebServlet("/ajax1.do")
public class AjaxController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxController1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String input = request.getParameter("input");
		
		System.out.println(input);
		
		//사용자에게 돌려줄 응답 데이터 구성
		String responseData = "입력된 값은 : "+input+", 그 값의 길이는 "+input.length()+"입니다.";
		
		//응답 데이터를 돌려주기 위해 사용하는 구문
		//응답객체(response)객체에 getWriter라는 메소드를 이용한다 (연결통로-스트림)
		//응답 데이터 전달하기 print() 메소드 이용
		//인코딩 처리와 응답 데이터 형식 지정하기
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(responseData);//응답 데이터 전달
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
