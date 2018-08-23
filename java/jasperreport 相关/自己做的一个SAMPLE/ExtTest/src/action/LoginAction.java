package action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import bean.User;

public class LoginAction extends ActionSupport {
	private Map<String , Integer> jobs;
	private String pass;
	public Map<String , Integer> getJobs() {
		return jobs;
	}

	public void setJobs(Map<String , Integer> jobs) {
		this.jobs = jobs;
		System.out.println(jobs.get("one"));
	}
	
	public String execute() throws Exception
	{
		System.out.println(jobs.get("one"));
		return SUCCESS;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	
	
}
