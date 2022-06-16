package co.edu.kanumovie.movie.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.country.vo.CountryVO;

public class MovieSelectCountryList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		CountryVO vo = new CountryVO(); 
		vo.setId(request.getParameter("id"));
		vo.setKoreanName(request.getParameter("name"));
		System.out.println(vo.getKoreanName());
		request.setAttribute("koreanTitle", vo.getKoreanName());
		request.setAttribute("id", vo.getId());
		return "movie/movieSelectCountryList";
	}

}
