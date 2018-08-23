package com.keystar.channel.dao.impl;

import java.util.List;

import com.keystar.channel.bean.TestPerson;
import com.keystar.channel.dao.TestDao;
import com.keystar.channel.util.BaseDao;


/** 
 * @author Charlie.L 
 * @version 1.0
 * 创建时间：2018年2月7日 下午2:33:04 
 * 类说明 
 */
public class TestDaoImpl extends BaseDao<TestPerson,Integer> implements TestDao {

	@Override
	public List<TestPerson> getTests() {
		String hql = "from TestPerson";
		return getListByHQL(hql);
	}

}
