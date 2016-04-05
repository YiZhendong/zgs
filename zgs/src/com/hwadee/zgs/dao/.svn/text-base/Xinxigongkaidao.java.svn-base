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

import com.hwadee.zgs.pojo.*;
import com.hwadee.zgs.util.*;
public class Xinxigongkaidao 
{
   
   /**
   @roseuid 55AC822700F1
    */
   public Xinxigongkaidao() 
   {
    
   }
 
 //根据id查找项目
   public Project findById(int id){
	    QueryRunner qr = new QueryRunner();
		String sql = "select * from Project where Project_id="+id;
		Connection conn = DatabaseHelper.getConnection();
		Project p= null;
		try {
		    p = (Project) qr.query(conn, sql, new BeanHandler(Project.class));
		    DbUtils.close(conn);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return p;
   }
   public void modById(int id) 
   {
	   String sql="update Project set state=1 where project_id=?";
	   QueryRunner qr = new QueryRunner();
		Connection conn = DatabaseHelper.getConnection();
		try {
			qr.update(conn, sql, id);
			DbUtils.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   System.out.println("The state has been updated");
   }
   
   public int findSum(Project p){
	   	int sum = 0;
	   	QueryRunner qr = new QueryRunner();
		String sql = "select sum(price) from Project where where level="+p.getLevel()+"money>="+p.getMoney()+"state="+p.getState();
		Connection conn = DatabaseHelper.getConnection();
		try {
		    sum =  qr.query(conn, sql, new BeanHandler(Project.class));
		    DbUtils.close(conn);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	   return sum;
   }
   //列出所有的项目信息
   public ArrayList<Project> findAll(Pagination page){
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
		sql = "select * from project limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
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
   //根据筛选条件来选出项目
   public ArrayList<Project> findBySome(Pagination page,String level,String money,String state){
	   	int totalRow = 0;
		int totalPage = 0;
	    QueryRunner qr = new QueryRunner();
		String sql = "select count(*) from Project where 1=1";
		if (!level.equals("")) {
			sql += " and level='"+level+"'";
		}
		if (!money.equals("")) {
			sql += " and money='"+money+"'";
		}
		if (!state.equals("")) {
			sql+=" and state= '"+state+"'";
		}
		
		System.out.println(sql);
		Connection conn = DatabaseHelper.getConnection();
		List list = new ArrayList();
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
		
		//以上设置totalRow和totalPage
		sql = "select * from Project where 1=1";
		if (!level.equals("")) {
			sql += " and level='"+level+"'";
		}
		if (!money.equals("")) {
			sql += " and money='"+money+"'";
		}
		if (!state.equals("")) {
			sql+=" and state= '"+state+"'";
		}
		sql += " limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
		ResultSet rs = DatabaseHelper.query(sql);
		
		try {
		    list = qr.query(conn, sql, new BeanListHandler(Project.class));
		    DbUtils.close(conn);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return (ArrayList)list;
 }

   //列出所有的项目的大致信息，属性有五个：projectName,introduction,level,state,startTime
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
		sql = "select project_id,projectName,introduction,level,state,startTime from project limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
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
   
   public ArrayList<Project> findAllGeneral1(Pagination page){
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

   public ArrayList<Project> findAllGeneral2(Pagination page){
		int totalRow = 0;
		int totalPage = 0;
		String sql = "select count(*) from project where state=0";
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
		sql = "select project_id,projectName,introduction,level,state,startTime from project where state=0 limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
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
  

   //列出统计后的项目信息，筛选条件有三个，分别是level，money，state
   public ArrayList<Project> findAllGeneral(Pagination page,Project p){
		int totalRow = 0;
		int totalPage = 0;
		String sql = "select count(*) from project where level="+p.getLevel()+"money>="+p.getMoney()+"state="+p.getState();
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
		sql = "select projectName,introduction,level,state,money from project where level="+p.getLevel()+"money>="+p.getMoney()+"state="+p.getState()+
				"limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
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
   public ArrayList<Project> findAllGeneral1(Pagination page,int id){
 		int totalRow = 0;
 		int totalPage = 0;
 		String sql = "select count(*) from project where user_id="+id;
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
 		sql = "select project_id,projectName,introduction,level,state,money from project where user_id="+id+" limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
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
