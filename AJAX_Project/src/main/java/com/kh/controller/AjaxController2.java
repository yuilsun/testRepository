package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class AjaxController2
 */
@WebServlet("/ajax2.do")
public class AjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//객체 방식 (JSONObject)  응답 처리 해보기
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//JSONObject 에 담아주기
		JSONObject jobj = new JSONObject();
		
		//Collection map처럼 사용 key,value 세트로 데이터 저장
		jobj.put("name",name);
		jobj.put("age",age);
		
		//응답데이터로 전달
		
		response.setContentType("/json/application;charset=UTF-8");
		response.getWriter().print(jobj);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//jquery ajax 요청시 기본 문자 인코딩은 UTF-8이다
		request.setCharacterEncoding("UTF-8"); //확실하게 다시 설정
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//응답 데이터 만들기 
		String responseData = "이름은 "+name+"이고 나이는 "+age+"살 입니다.";
		//응답객체 인코딩 설정 및 데이터 타입 설정
		//response.setContentType("text/html;charset=UTF-8");
		//response.getWriter().print(responseData);//응답데이터 전달
		
		
		//데이터를 각각 전달하고자 할때 
		//response.getWriter().print(name);
		//response.getWriter().print(age);
		
		
		/*
		 * 위와같이 따로 전달을 해도 하나의 문자열로 합쳐져서 전달된다.
		 * 각 데이터를 구분지어 전달하고자 한다면 객체 또는 배열 형태로 전달해야한다.
		 * 이때 사용되는 형식이 JSON 형식이다.
		 * JSON (JavaScript Object Notation) : 자바스크립트 객체 표기법
		 * -ajax 통신시 사용되는 형식 중 하나
		 * JSON의 종류
		 * JSONArray : 배열 형식 [value,value,....]
		 * JSONObject : 객체 형식 {key:value,key:value,....}
		 * 
		 * JSON은 자바에서 기본 제공되지 않기 때문에 외부 라이브러리를 등록해서 사용해야한다.
		*/
		
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		//만들어준 json배열을 응답데이터로 전달한다.
		//text/html 형식으로 전달하면 문자열로 전달됨 ["이름",20] 와 같이 
		//response.getWriter().print(jArr);
		
		//객체 형태를 유지하고 전달하려면 
		//응답 데이터 형식을 변경해야한다.
		//이때 사용하는 형식은 json/application 형식이다.
		response.setContentType("json/application;charset=UTF-8");
		response.getWriter().print(jArr);
		
	}

}
