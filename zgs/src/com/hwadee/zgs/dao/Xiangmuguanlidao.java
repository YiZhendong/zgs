package com.hwadee.zgs.dao;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.util.DatabaseHelper;

public class Xiangmuguanlidao 
{

   public Xiangmuguanlidao() 
   {
    
   }
   
//项目的增加删除和修改
   public void add(Project p){
	   String sql="insert into project(projectName,level,money,state,user_id,content,introduction,place,startTime,endTime,summary,risk)values(?,?,?,?,?,?,?,?,?,?,?,?)";
	   QueryRunner qr=new QueryRunner();
	   Connection conn=DatabaseHelper.getConnection();
	   try{
		   qr.update(conn,sql,new Object[]{p.getProjectName(),p.getLevel(),p.getMoney(),p.getState(),p.getUser_id(),p.getContent(),
				   p.getIntroduction(),p.getPlace(),p.getStartTime(),p.getEndTime(),p.getSummary(),p.getRisk()});
		   DbUtils.close(conn);
	   } catch(SQLException e){
		   e.printStackTrace();
	   }
	   System.out.println("The User has been updated");
   }
   
   /**
   @roseuid 55AC7D4C0331
    */
   public void del(int id) 
   {
	   String sql="delete from project where project_id="+id;
	   DatabaseHelper.execute(sql);
	   System.out.println("The project has been deleted");
   }
   
   
   /**
   @roseuid 55AC7D500260
    */
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
}
