package co.edu.kanumovie.country.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.country.service.CountryService;
import co.edu.kanumovie.country.serviceImpl.CountryServiceImpl;
import co.edu.kanumovie.country.vo.CountryVO;

public class CountrySelectList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CountryService dao = new CountryServiceImpl();
		List<CountryVO> countrylist = dao.countrySelectList();
		ObjectMapper mapper = new ObjectMapper(); 
		String data = "";
		try {
			data = mapper.writeValueAsString(countrylist);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + data;
	}

}
