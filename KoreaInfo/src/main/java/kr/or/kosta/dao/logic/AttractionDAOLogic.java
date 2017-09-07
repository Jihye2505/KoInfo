package kr.or.kosta.dao.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.or.kosta.dao.AttractionDAO;
import kr.or.kosta.dao.SqlSessionFactoryProvider;
import kr.or.kosta.domain.Attraction;

@Repository
public class AttractionDAOLogic implements AttractionDAO {
	
	private SqlSessionFactory factory;

	public AttractionDAOLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public List<Attraction> attractionSearchByName(String title) {
		SqlSession session = factory.openSession();
		List<Attraction> list = null;
		
		try {
			list = session.selectList("attractionFindByName", "%" + title + "%");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Attraction attractionSearchById(int attraction_id) {
		SqlSession session = factory.openSession();
		Attraction attraction = null;
		
		try {
			attraction = session.selectOne("attractionFindById", attraction_id);
		} finally {
			session.close();
		}
		return attraction;
	}

	@Override
	public List<Attraction> attractionSearchByState(int state_id) {
		SqlSession session = factory.openSession();
		List<Attraction> list = null;
		
		try {
			list = session.selectList("attractionFindByState", state_id);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int attractionCreate(Attraction attraction) {
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.insert("createAttraction", attraction);
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int attractionUpdate(Attraction attraction) {
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.update("updateAttraction", attraction);
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int attractionDelete(int attraction_id) {
		SqlSession session = factory.openSession();
		int result = 0;

		try {
			result = session.delete("deleteAttraction", attraction_id);
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int favoritesCreate(String user_id, int attraction_id) {
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("attraction_id", attraction_id);
		int result = 0;

		try {
			result = session.insert("createFavorites", map); ///////////////////////
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Attraction> favoritesAllSearch(String user_id) {
		SqlSession session = factory.openSession();
		List<Attraction> list = null;

		try {
			list = session.selectList("favoritesFindAll", user_id);
			
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int favoritesDelete(String user_id, int attraction_id) {
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("attraction_id", attraction_id);
		int result = 0;

		try {
			result = session.delete("deleteFavorites", map);
			if(result > 0) {
				session.commit();
			}
			else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

}
