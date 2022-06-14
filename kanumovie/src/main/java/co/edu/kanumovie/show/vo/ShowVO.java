package co.edu.kanumovie.show.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShowVO {
	
	private int id;
	private String originalName;
	private String originalCountry;
	private String genreIds;
	private String originalLanguage;
	private String overview;
	private String posterPath;
	private Date firstAirDate;
	private double voteAverage;
	private int voteCount;
	private int seasonNumber;
	private int episodeCount;

}
