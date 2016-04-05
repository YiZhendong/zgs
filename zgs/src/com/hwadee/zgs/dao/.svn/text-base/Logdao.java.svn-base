package com.hwadee.zgs.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hwadee.zgs.pojo.Log;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.util.DatabaseHelper;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Logdao {
	
	//日志的增加删除和修改
	public void add(Log l) 
	   {
		   SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd");
		   String sql="insert into Log(content,time,title,user_id)values('"+l.getContent()+"','"+sm.format(new Date())+"','"+l.getTitle()+"','"+l.getUser_id()+"')";
		   DatabaseHelper.execute(sql);
		   System.out.println("The Log has been added!");
	   }
	   
	   
	   public void del(int id) 
	   {
		   String sql="delete from Log where log_id="+id;
		   DatabaseHelper.execute(sql);
		   System.out.println("The Log has been deleted");
	   }
	   
	   public void mod(Log l) 
	   {
		   String sql="update Log set content='"+l.getContent()+"',time='"+l.getTime()+"',time='"+l.getTime()+"',content='"+l.getContent()+"'where log_id="+l.getLog_id();
		   DatabaseHelper.execute(sql);
		   System.out.println("The Log has been updated");
	   }
	   
	   //根据id修改日志
	   public Log findById(int id){
		   String sql = "select * from log where log_id="+id;
			ResultSet rs = DatabaseHelper.query(sql);
			Log c = new Log();
			try {
				if (rs.next()) {
					int user_id = rs.getInt("user_id");
					String time = rs.getString("time");
					String content = rs.getString("content");
					String  title  =  rs.getString("title");
					c.setLog_id(id);
					c.setUser_id(user_id);
					c.setTime(time);
					c.setContent(content);
					c.setTitle(title);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return c;
		}
	   //列出日志信息，包括三个属性：title，content，time
	   public ArrayList<Log> findAllGeneral(Pagination page,int user_id){
			int totalRow = 0;
			int totalPage = 0;
			String sql = "select count(*) from log where user_id="+user_id;
			ResultSet rs_count = DatabaseHelper.query(sql);
			try {
				if (rs_count.next()) {
					totalRow = rs_count.getInt(1);
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			totalPage = (int)Math.ceil(1.0*totalRow/page.getPageSize());
			
			if (page.getPageIndex()>totalPage) {
				page.setPageIndex(totalPage);
			}
			if (page.getPageIndex()<1) {
				page.setPageIndex(1);
			}
			page.setTotalRow(totalRow);
			page.setTotalPage(totalPage);
			
			List list = new ArrayList();
			sql = "select * from log where user_id="+user_id+" limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
			ResultSet rs = DatabaseHelper.query(sql);
			try {
				Connection conn = DatabaseHelper.getConnection();
				QueryRunner qr = new QueryRunner();
				list =  qr.query(conn, sql, new BeanListHandler(Log.class));			
				DbUtils.close(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return (ArrayList)list;
		}
}
