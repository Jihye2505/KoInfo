package kr.or.kosta.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosta.dao.AttractionDAO;
import kr.or.kosta.domain.Attraction;
import kr.or.kosta.service.AttractionService;

@Service
public class AttractionServiceLogic implements AttractionService {
	
	@Autowired
	private AttractionDAO attractionDAO;

	@Override
	public List<Attraction> attractionSearchByName(String title) {
		return attractionDAO.attractionSearchByName(title);
	}

	@Override
	public Attraction attractionSearchById(int attraction_id) {
		return attractionDAO.attractionSearchById(attraction_id);
	}

	@Override
	public List<Attraction> attractionSearchByState(int state_id) {
		return attractionDAO.attractionSearchByState(state_id);
	}

	@Override
	public int attractionCreate(Attraction attraction) {
		return attractionDAO.attractionCreate(attraction);
	}

	@Override
	public int attractionUpdate(Attraction attraction) {
		return attractionDAO.attractionUpdate(attraction);
	}

	@Override
	public int attractionDelete(int attraction_id) {
		return attractionDAO.attractionDelete(attraction_id);
	}

	@Override
	public int favoritesCreate(String user_id, int attraction_id) {
		return attractionDAO.favoritesCreate(user_id, attraction_id);
	}

	@Override
	public List<Attraction> favoritesAllSearch(String user_id) {
		return attractionDAO.favoritesAllSearch(user_id);
	}

	@Override
	public int favoritesDelete(String user_id, int attraction_id) {
		return attractionDAO.favoritesDelete(user_id, attraction_id);
	}

}
