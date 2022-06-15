package co.edu.kanumovie.admin.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;

public class Analytics implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/analytics";
	}

}
