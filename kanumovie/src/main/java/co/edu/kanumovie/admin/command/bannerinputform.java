package co.edu.kanumovie.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;

public class bannerinputform implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin/bannerinputform";
	}

}
