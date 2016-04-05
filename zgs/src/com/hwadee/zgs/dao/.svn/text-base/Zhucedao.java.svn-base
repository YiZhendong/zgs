package com.hwadee.zgs.dao;

import com.hwadee.zgs.pojo.User;
import com.hwadee.zgs.util.DatabaseHelper;

public class Zhucedao {
	   public void add(User u){
			String sql = "insert into User(userName,password,email,telenum,level)values('"+u.getUserName()+"','"+u.getPassword()+"','"+u.getEmail()+"','"+u.getTelenum()+"','"+u.getLevel()+"')";
			DatabaseHelper.execute(sql);
		}
}
