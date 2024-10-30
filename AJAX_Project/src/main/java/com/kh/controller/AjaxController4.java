package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.model.vo.Member;

/**
 * Servlet implementation class AjaxController4
 */
@WebServlet("/ajax4.do")
public class AjaxController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxController4() {
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
		
		//위와같이 list를 반환받아왔다고 가정했을때 해당 데이터들을 응답데이터로 변환하는 작업 필요
		
		
		response.setContentType("json/application;charset=UTF-8");
		//response.getWriter().print(list);
		
		//응답 데이터 형식은 JSON 형태여야한다.
		JSONArray jArr = new JSONArray();
		
		//반복문을 이용하여 리스트에 담긴 데이터를 JSONObject에 옮겨담아 JSONArray에 추가하기
		for(Member m : list) {
			JSONObject jObj = new JSONObject();
			jObj.put("userNo", m.getUserNo());
			jObj.put("userName", m.getUserName());
			jObj.put("age", m.getAge());
			jObj.put("gender", m.getGender());
			
			//옮겨 담은 JSONObject를 JSONArray에 추가하기 
			jArr.add(jObj);
		}
		
		//조회한 데이터 JSON화 작업 완료
		response.getWriter().print(jArr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
