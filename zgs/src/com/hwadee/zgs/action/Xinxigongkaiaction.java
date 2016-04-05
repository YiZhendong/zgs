//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\action\\Xinxigongkaiaction.java

package com.hwadee.zgs.action;

import java.util.ArrayList;

import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.service.Xinxigongkaiservice;
public class Xinxigongkaiaction 
{
	public Project project=new Project();
	       int sum;
   private Xinxigongkaiservice service=new Xinxigongkaiservice();
   public ArrayList<Project> list = new ArrayList();
   public Pagination pagination=new Pagination();

   public String findById() 
   {
     project=service.findById(project.getProject_id());
     return "update";
   }
   public String modById() 
   {
     service.modById(project.getProject_id());
     return "update";
   }
   public String findSum(){
	   sum=service.findSum(project);
	   return "update";
   }
   public String findBySome() {
		list = service.findBySome(pagination, project.getLevel(), project.getMoney(),project.getState());
		return "list";
	}

}
