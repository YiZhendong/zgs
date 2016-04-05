//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\dao\\Juecedao.java

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

import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.util.DatabaseHelper;


public class Juecedao 
{
   
   /**
   @roseuid 55AC81390251
    */
   public Juecedao() 
   {
    
   }
   
  //决策方法只修改state属性
   public void juece(Project p) 
   {
	   String sql = "update project set state='"+p.getState()+"' where project_id="+p.getProject_id();
		DatabaseHelper.execute(sql);
   }
   //列出所有的信息
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
   //列出项目的一般信息，有5个属性：projectname，introduction，level，state，startTime
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
