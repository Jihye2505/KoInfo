package kr.or.kosta.dao;

import java.util.List;

import kr.or.kosta.domain.Attraction;

public interface AttractionDAO {

	List<Attraction> attractionSearchByName(String title);
	Attraction attractionSearchById(int attraction_id);
	List<Attraction> attractionSearchByState(int state_id);
	int attractionCreate(Attraction attraction);
	int attractionUpdate(Attraction attraction);
	int attractionDelete(int attraction_id);
	int favoritesCreate(String user_id, int attraction_id);
	List<Attraction> favoritesAllSearch(String user_id);
	int favoritesDelete(String user_id, int attraction_id);
	
}
