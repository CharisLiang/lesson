package action;

import com.opensymphony.xwork2.ActionSupport;

import bean.User;

public class ReportAction extends ActionSupport {
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String execute() throws Exception
	{
		User user = new User();
		user.setName("abcs");
		setUser(user);
		return SUCCESS;
		
	}
}
