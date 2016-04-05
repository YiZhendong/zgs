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

import com.hwadee.zgs.pojo.Addlist;
import com.hwadee.zgs.pojo.Favorite;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.util.DatabaseHelper;

public class Favoritedao {
	
	//收藏夹的增加删除和修改
	public void add(Favorite f) 
	   {
		   String sql="insert into Favorite(project_id,user_id)values('"+f.getProject_id()+"','"+f.getUser_id()+"')";
		   DatabaseHelper.execute(sql);
		   System.out.println("The Favorite has been added!");
	   }
	public void add1(Favorite f) 
	   {
		   String sql="insert into Favorite(project_id,user_id)values('"+f.getProject_id()+"','"+f.getUser_id()+"')";
		   DatabaseHelper.execute(sql);
		   System.out.println("The Favorite has been added!");
	   }
	  
	   public void del(int id) 
	   {
		   String sql="delete from Favorite where user_id="+id;
		   DatabaseHelper.execute(sql);
		   System.out.println("The Favorite has been deleted");
	   }
	   
	   public void mod(Favorite n) 
	   {
		   String sql="update Favorite set project_id='"+n.getProject_id()+"',user_id="+n.getUser_id()+"'where favorite_id="+n.getFavorite_id();
		   DatabaseHelper.execute(sql);
		   System.out.println("The Favorite has been updated");
	   }
	   //根据用户的id查询用户收藏夹中项目的信息，属性有5种：projectname,introduction,level,state,starttime
	   public Favorite query(int user_id){
		    Project p=new Project();
		    QueryRunner qr = new QueryRunner();
			String sql = "select projectname,introduction,level,state,starttime from project where project_id=(select project_id from favorite where user_id="+user_id;
			Connection conn = DatabaseHelper.getConnection();
			Favorite f = null;
			try {
			    f = (Favorite) qr.query(conn, sql, new BeanHandler(Favorite.class));
			    DbUtils.close(conn);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return f;
	   }
	   
	 //列出个人收藏夹上所有项目的信息
	   public ArrayList<Project> findAll(Pagination page,int user_id){
			int totalRow = 0;
			int totalPage = 0;
			String sql = "select count(*) from project,(select project_id from favorite where user_id='"+user_id+"') as r where project.project_id=r.project_id";
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
			sql = "select projectname,introduction,level,state,starttime from project ,(select project_id from favorite where user_id='"+user_id+"') as r where project.project_id=r.project_id"+" limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
			ResultSet rs = DatabaseHelper.query(sql);
			try {
				Connection conn = DatabaseHelper.getConnection();
				QueryRunner qr = new QueryRunner();
				list =  qr.query(conn, sql, new BeanListHandler(Project.class));
				DbUtils.close(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return (ArrayList)list;
		}

}
