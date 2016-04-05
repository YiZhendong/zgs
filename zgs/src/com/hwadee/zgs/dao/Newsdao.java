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

import com.hwadee.zgs.pojo.News;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.News;
import com.hwadee.zgs.util.DatabaseHelper;

public class Newsdao {
	 public void add(News n) 
	   {
		   String sql="insert into News(type,news_id,source,time,title,type)values('"+n.getType()+"',"
				   +n.getNews_id()+",'"+n.getSource()+",'"+n.getTime()+",'"+n.getTitle()+",'"+n.getType();
		   DatabaseHelper.execute(sql);
		   System.out.println("The News has been added!");
	   }
	   
	   /**
	   @roseuid 55AC8325018C
	    */
	   public void del(int id) 
	   {
		   String sql="delete from News where News_id="+id;
		   DatabaseHelper.execute(sql);
		   System.out.println("The News has been deleted");
	   }
	   
	   /**
	   @roseuid 55AC8329007D
	    */
	   public void mod(News n) 
	   {
		   String sql="update News set type='"+n.getType()+"',news_id="+n.getNews_id()+",source='"+n.getSource()
				   +",time='"+n.getTime()+",title='"+n.getTitle()+",type='"+n.getType()+	   		
				   "'where News_id="+n.getNews_id();
		   DatabaseHelper.execute(sql);
		   System.out.println("The News has been updated");
	   }
	   
	   
	   //列出所有的新闻的标题
	   public ArrayList<News> findAllGeneral(Pagination page){
			int totalRow = 0;
			int totalPage = 0;
			String sql = "select count(*) from news where type='焦点'";
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
			sql = "select title from news where type='焦点' limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
			ResultSet rs = DatabaseHelper.query(sql);
			try {
				Connection conn = DatabaseHelper.getConnection();
				QueryRunner qr = new QueryRunner();
				list =  qr.query(conn, sql, new BeanListHandler(News.class));
				
				DbUtils.close(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return (ArrayList)list;
		}
	   //展示具体新闻的详细信息
	   public News findByTitle(String title){
		   QueryRunner qr = new QueryRunner();
			String sql = "select * from News where title='"+title+"'";
			Connection conn = DatabaseHelper.getConnection();
			News p= null;
			try {
			    p = (News) qr.query(conn, sql, new BeanHandler(News.class));
			    DbUtils.close(conn);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return p;
	   }

	   public News findById(int id){
		   QueryRunner qr = new QueryRunner();
			String sql = "select * from News where News_id="+id;
			Connection conn = DatabaseHelper.getConnection();
			News p= null;
			try {
			    p = (News) qr.query(conn, sql, new BeanHandler(News.class));
			    DbUtils.close(conn);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return p;
	   }
	public ArrayList<News> findSpecial(Pagination page){
			int totalRow = 0;
			int totalPage = 0;
			String sql = "select count(*) from news where type='政策'";
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
			sql = "select title from news where type='政策' limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
			ResultSet rs = DatabaseHelper.query(sql);
			try {
				Connection conn = DatabaseHelper.getConnection();
				QueryRunner qr = new QueryRunner();
				list =  qr.query(conn, sql, new BeanListHandler(News.class));
				
				DbUtils.close(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return (ArrayList)list;
		}
}
