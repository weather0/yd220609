package co.edu.kanumovie.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(list.size());
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			System.out.println(list.get(i).getName());
			System.out.println(list.get(i).getGenreCount());
		}
		
//		Gson gson = new Gson();
//		String jsonPlace = gson.toJson(list);
//		
		return null;
	}

}
