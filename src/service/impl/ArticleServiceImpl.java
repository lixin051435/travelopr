package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List; 
import entity.bean.*; 
import entity.mapper.*; 
import service.*; 
import java.util.HashMap;
import javax.annotation.Resource;
 

@Service("ArticleService")
public class ArticleServiceImpl implements ArticleService {
	 
	@Resource
	public  ArticleMapper mapper;
   	
	@Override
	public List<Article> findAll()
	{
		return mapper.findAll();
	}

    @Override
	public List<HashMap<String, String>> findByParam(HashMap<String, String> map)
	{
		return mapper.findByParam(map);
	}
	
	@Override
	public void insert(HashMap<String, String> map)
	{
        mapper.insert(map);
	}

    @Override
	public void delete(int id)
	{
		mapper.delete(id);
	}


    @Override
	public void update(HashMap<String, String> map)
	{
		mapper.update(map);
	}
 

}