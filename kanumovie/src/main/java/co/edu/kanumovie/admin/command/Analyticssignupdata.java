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
					if(i == arr.length-1) {
						writer.print(result);
					} else {
						writer.print(result+",");
					}
				
				} else {
					if(i == arr.length-1) {
						writer.print(result);
					} else {
						writer.print(result+",");
					}
				
				}
				
			}
			
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}

}
