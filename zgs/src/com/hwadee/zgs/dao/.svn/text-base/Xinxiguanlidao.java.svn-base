//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\dao\\Xinxiguanlidao.java

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

import com.hwadee.zgs.util.DatabaseHelper;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.pojo.User;



public class Xinxiguanlidao 
{
   
   /**
   @roseuid 55AC83110323
    */
   public Xinxiguanlidao() 
   {
    
   }
   
   //个人基本信息的修改和删除和查找
 
   public User findById(int id){
	    QueryRunner qr = new QueryRunner();
		String sql = "select * from User where user_id="+id;
		Connection conn = DatabaseHelper.getConnection();
		User u= null;
		try {
		    u = (User) qr.query(conn, sql, new BeanHandler(User.class));
		    DbUtils.close(conn);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return u;
   }
   
   public void del(int id) 
   {
	   String sql="delete from User where user_id="+id;
	   DatabaseHelper.execute(sql);
	   System.out.println("The User has been deleted");
   }
   
   /**
   @roseuid 55AC8329007D
    */
   public void mod(User u) 
   {
	   String sql="update User set userName=?,password=?,email=?,telenum=?where user_id=?";
	   QueryRunner qr = new QueryRunner();
		Connection conn = DatabaseHelper.getConnection();
		try {
			qr.update(conn, sql, new Object[]{u.getUserName(),u.getPassword(),u.getEmail(),u.getTelenum(),u.getUser_id()});
			DbUtils.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   System.out.println("The User has been updated");
   }
   
   //这是对于个人发布的项目的操作之一：删除
   public void delproject(int id) 
   {
	   String sql="delete from project where project_id="+id;
	   DatabaseHelper.execute(sql);
	   System.out.println("The project has been deleted");
   }
   
   //这是对于个人发布的项目的操作之二：修改()
   public void mod(Project p) 
   {
	   
	   String sql="update project set projectName=?,level=?,money=?,state=?,user_id=?,content=?,introduction=?,place=?,startTime=?,endTime=?,summary=?,risk=? where project_id=?";
	   QueryRunner qr = new QueryRunner();
		Connection conn = DatabaseHelper.getConnection();
		try {
			qr.update(conn, sql, new Object[]{p.getProjectName(),p.getLevel(),p.getMoney(),p.getState(),p.getUser_id(),p.getContent(),p.getIntroduction(),p.getPlace(),
					p.getStartTime(),p.getEndTime(),p.getSummary(),p.getRisk(),p.getProject_id()});
			DbUtils.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   System.out.println("The project has been updated");
   }
   //这是对于个人发布的项目的展示，只展示5种基本信息（projectname,introduction,level,state,startTime）
   public ArrayList<Project> findAllGeneral(Pagination page){
		int totalRow = 0;
		int totalPage = 0;
		String sql = "select count(*) from project";
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
		sql = "select projectName,introduction,level,state,startTime from project limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
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

