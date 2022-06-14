package co.edu.kanumovie.show.service;

import java.util.List;

import co.edu.kanumovie.genre.vo.GenreVO;
import co.edu.kanumovie.show.vo.ShowVO;

public interface ShowMapper {
	
	List<ShowVO> showSelectList();
	List<ShowVO> showSelectGenreList(GenreVO vo); 
	ShowVO showSelect(); 
	int showInsert(); 
	int showUpdate(); 
	int showDelete(); 

}
