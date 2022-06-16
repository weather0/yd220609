package co.edu.kanumovie.admin.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;


public class Analyticssignupdata implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * // 게시글 검색 NoticeService dao = new NoticeServiceImpl(); List<NoticeVO> list =
		 * new ArrayList<NoticeVO>(); ObjectMapper mapper = new ObjectMapper(); //json
		 * string으로 만들기 위해 String key = request.getParameter("key"); String val =
		 * request.getParameter("val"); list = dao.noticeSearchList(key, val); String
		 * jsonData =""; try { jsonData = mapper.writeValueAsString(list); //리스트를 json
		 * String 으로 } catch (JsonProcessingException e) { e.printStackTrace(); }
		 * System.out.println(jsonData); return "ajax:" + jsonData;
		 */
		
		
		response.setContentType("text/html; chartset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter writer = response.getWriter();
			SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
			AdminService dao = new AdminServiceImpl();
			
			Calendar cal = Calendar.getInstance();
			String arr[] = new String[7];
			for(int i = 6; i >= 0; i--) {
				if(i == 6) {
					cal.add(Calendar.DAY_OF_MONTH, 0);
					arr[i] = format.format(cal.getTime());
				} else {
					cal.add(Calendar.DAY_OF_MONTH, -1);
					arr[i] = format.format(cal.getTime());
				}
			}
			
			for(int i = 0; i < arr.length; i++) {
				//System.out.print("날짜 > "+arr[i] + " ");
				int result = dao.selectCountWeeklySignUpUsersCount(arr[i]);
				if(result >= 1) {
				//	System.out.println("=======찾았똬아 성공=======");
				//	System.out.println(arr[i]+" "+result);
					if(i == arr.length-1) {
						writer.print(result);
					} else {
						writer.print(result+",");
					}
				
				} else {
				//	System.out.println("=========못찾았똬아=========");
				//	System.out.println(arr[i]+" "+result);
					if(i == arr.length-1) {
						writer.print(result);
					} else {
						writer.print(result+",");
					}
				
				}
				
			}
			
			
//			writer.print(dateToStr);
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}

}
