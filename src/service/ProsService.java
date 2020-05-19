package service;

import java.util.HashMap;
import java.util.List;
import entity.bean.*;

public interface ProsService {
	
	List<Pros> findAll();

	List<HashMap<String, String>> findByParam(HashMap<String, String> map);
	
	void insert(HashMap<String, String> map);

	void delete(int id);

	void update(HashMap<String, String> map);
 

}
