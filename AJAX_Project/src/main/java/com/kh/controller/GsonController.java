package com.kh.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.model.vo.Member;


/**
 * Servlet implementation class GsonController
 */
@WebServlet("/ajax5.do")
public class GsonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GsonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArrayList<Member> list = new ArrayList<>();
		list.add(new Member(5,"김유저",20,"남자"));
		list.add(new Member(63,"박사람",55,"여자"));
		list.add(new Member(20,"최둘리",44,"남자"));
		list.add(new Member(25,"신짱구",19,"남자"));
		  
		  //GSON : Google JSON
		  //구글에서 JSON을 쉽고 편리하게 사용할 수 있도록 기능을 제공해주는 라이브러리
		  
		  //응답데이터 형식 및 인코딩 설정
		  response.setContentType("json/application;charset=UTF-8");
		  //toJson() 메소드를 이용하여 json화 작업을 수행시킨다.
		  
//		  Gson gson = new Gson();
//		  //gson.toJson(전달객체,응답 스트림);
//		  gson.toJson(list,response.getWriter());
		  
		  new Gson().toJson(list,response.getWriter());
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
