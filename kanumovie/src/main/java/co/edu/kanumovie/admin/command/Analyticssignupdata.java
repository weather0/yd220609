package co.edu.kanumovie.admin.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;

public class Analyticssignupdata implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; chartset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter writer = response.getWriter();
			
			DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
			Date date = new Date();        
			String dateToStr = dateFormat.format(date);
			System.out.println(dateToStr);
			
			AdminService dao = new AdminServiceImpl();
			int result = dao.selectCountWeeklySignUpUsersCount(dateToStr);
			System.out.println("UPDATED");
			//int result = dao.selectCountWeeklySignUpUsersCount("22/06/16");
			if(result >= 1) {
				System.out.println("=======찾았똬아 성공=======");
			} else {
				System.out.println("=========못찾았똬아=========");
			}
			
			//한주 전    
			Calendar week = Calendar.getInstance();
			week.add(Calendar.DATE , -7);   
			String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			System.out.println(beforeWeek);
			
			
			writer.print("우왕ㅋ?");
			writer.print(dateToStr);
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}

}
