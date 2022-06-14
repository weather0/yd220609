package co.edu.kanumovie.show.vo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ShowData {
	
	private String baseURL = "https://api.themoviedb.org/3/discover/tv?";
	private String apiKey="api_key=e51d70c65b46eb8bd60cafccc9325e8b";
	private String language="&language=ko-KO";
	private String sort="&sort_by=popularity.desc";
	private String page="&page=";
	private int idx = 1;
	private String param = baseURL + apiKey + language + sort + page + idx;
	
	
	public String getData() {
		String output = null;
		try {
			URL url = new URL(param);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while((line = br.readLine()) != null) {
				output += line;
			}
			conn.disconnect(); 
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		ObjectMapper objectMapper = new ObjectMapper(); 
		JsonNode root;
		try {
			root = objectMapper.readTree(output);
			JsonNode backdrop_path = root.get("backdrop_path");
			System.out.println(backdrop_path);
			System.out.println(root);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<ShowVO> vo = new ArrayList<ShowVO>();
		
		return output;
		
	}
	
	
	
	
	

}
