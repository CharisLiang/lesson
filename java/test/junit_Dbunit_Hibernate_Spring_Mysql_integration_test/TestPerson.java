package com.keystar.channel.bean;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/** 
 * @author Charlie.L 
 * @version 1.0
 * 创建时间：2018年2月7日 下午2:27:15 
 * 类说明 
 */
@Entity
@Table(name = "test")
public class TestPerson {
	private Integer id;
	private String name;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "test_id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "user_name", length = 20,  nullable = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
