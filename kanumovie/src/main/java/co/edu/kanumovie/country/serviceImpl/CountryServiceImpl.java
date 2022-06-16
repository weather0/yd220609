package co.edu.kanumovie.country.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.country.service.CountryMapper;
import co.edu.kanumovie.country.service.CountryService;
import co.edu.kanumovie.country.vo.CountryVO;

public class CountryServiceImpl implements CountryService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CountryMapper map = sqlSession.getMapper(CountryMapper.class);
	
	@Override
	public List<CountryVO> countrySelectList() {
		return map.countrySelectList();
	}

}
