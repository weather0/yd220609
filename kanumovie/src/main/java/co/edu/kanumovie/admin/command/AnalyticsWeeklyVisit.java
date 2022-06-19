package co.edu.kanumovie.admin.command;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;

public class AnalyticsWeeklyVisit implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("위클리 비짓 클래스 들어옴");
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
			System.out.println(arr[i]);
		}
		
		
		for(int i = 0; i < arr.length; i++) {
			String days = arr[i];
			arr[i] = dao.selectCountWeeklyVisit(days);
		}
		
		String json = new Gson().toJson(arr);
		System.out.println("제이슨 결과 = " + json);
		
		return "ajax:" + json;
	}

}
