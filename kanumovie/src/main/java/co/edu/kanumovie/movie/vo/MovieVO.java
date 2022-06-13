package co.edu.kanumovie.movie.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieVO {
	
	private String adult;
	private String backdropPath;
	private String genreIds;
	private int id;
	private String originalLanguage;
	private String originalTitle;
	private String overview;
	private double popularity;
	private String posterPath;
	private Date releaseDate;
	private String title;
	private String video;
	private double voteAverage;
	private int voteCount;

}
