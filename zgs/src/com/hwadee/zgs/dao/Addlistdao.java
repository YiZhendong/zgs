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
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.util.DatabaseHelper;

public class Addlistdao {
	//增加，删除和修改通讯录信息
	public void add(Addlist a) 
	   {
		   String sql="insert into Addlist(list_user_id,email,userName,telenum)values('"+a.getList_user_id()+"','"+a.getEmail()+"','"+a.getUserName()+"','"+a.getTelenum()+"')";
		   DatabaseHelper.execute(sql);
		   
		   System.out.println("The Addlist has been added!");
	   }
	   
	   public void del(int id) 
	   {
		   String sql="delete from Addlist where addlist_id="+id;
		   DatabaseHelper.execute(sql);
		   System.out.println("The Addlist has been deleted");
	   }
	   
	   public void mod(Addlist a) 
	   {
		   String sql="update Addlist set email='"+a.getEmail()+"',userName="+a.getUserName()+",telenum='"+a.getTelenum()
				   +",email='"+a.getEmail()+"'where addlist_id="+a.getAddlist_id();
		   DatabaseHelper.execute(sql);
		   System.out.println("The Addlist has been updated");
	   }
	   
	   
	   //根据姓名查找联系方式
	   public Addlist findByName(String userName){
		    QueryRunner qr = new QueryRunner();
			String sql = "select userName,telenum,email from Addlist where userName="+userName;
			Connection conn = DatabaseHelper.getConnection();
			Addlist a = null;
			try {
			    a = (Addlist) qr.query(conn, sql, new BeanHandler(Addlist.class));
			    DbUtils.close(conn);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return a;
	   }
	   
	   
	   //列出个人通讯录上所有人的信息
	   public ArrayList<Addlist> findAll(Pagination page,int list_user_id){
			int totalRow = 0;
			int totalPage = 0;
			String sql = "select count(*) from addlist where list_user_id="+list_user_id;
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
			sql = "select * from addlist where list_user_id="+list_user_id+" limit "+((page.getPageIndex()-1)*page.getPageSize())+","+page.getPageSize();
			ResultSet rs = DatabaseHelper.query(sql);
			try {
				Connection conn = DatabaseHelper.getConnection();
				QueryRunner qr = new QueryRunner();
				list =  qr.query(conn, sql, new BeanListHandler(Addlist.class));
				DbUtils.close(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return (ArrayList)list;
		}
	   
}
