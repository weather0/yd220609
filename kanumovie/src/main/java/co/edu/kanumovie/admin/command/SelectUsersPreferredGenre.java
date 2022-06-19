package co.edu.kanumovie.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.stream.JsonWriter;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.admin.vo.PreferredGenreVO;
import co.edu.kanumovie.common.Command;

public class SelectUsersPreferredGenre implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AdminService dao = new AdminServiceImpl();
		List<PreferredGenreVO> list = new ArrayList<PreferredGenreVO>();
		list = dao.selectUsersPreferredGenre();

		String json = new Gson().toJson(list);
		//System.out.println("제이슨 결과2 = " + json);
		
		return "ajax:" + json;
	}

}
