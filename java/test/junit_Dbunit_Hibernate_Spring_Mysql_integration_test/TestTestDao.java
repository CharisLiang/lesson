package test.com.keystar.channel.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import com.github.springtestdbunit.DbUnitTestExecutionListener;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.DbUnitConfiguration;
import com.keystar.channel.bean.TestPerson;
import com.keystar.channel.dao.TestDao;

/** 
 * @author Charlie.L 
 * @version 1.0
 * 创建时间：2018年3月9日 下午1:46:51 
 * 类说明 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:test/dbunit/xml/config.xml","classpath:daoContext.xml"})
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, DbUnitTestExecutionListener.class })
@Transactional
public class TestTestDao extends AbstractTransactionalJUnit4SpringContextTests{
	
	@Autowired
	private TestDao testDao;
	
	@Test
	@DatabaseSetup({ "classpath:test/dbunit/xml/test/TestPerson.xml" })
	public void testFind() throws Exception {
		List<TestPerson> personList = this.getTestDao().getTests();
		assertEquals(2, personList.size());
		assertEquals("c", personList.get(0).getName());
	}

	public TestDao getTestDao() {
		return testDao;
		
	}

	public void setTestDao(TestDao testDao) {
		this.testDao = testDao;
	}
}
