//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Xinxiguanliservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Xinxiguanlidao;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.pojo.User;
public class Xinxiguanliservice 
{
   private Xinxiguanlidao dao = new Xinxiguanlidao();
   
   public void del(int id) 
   {
	   dao.del(id);
   }
   
   public void mod(User u) 
   {
	   dao.mod(u);
   }
   public void mod(Project p){
	   dao.mod(p);
   }
   public ArrayList<Project> findAllGeneral(Pagination page){
	   return dao.findAllGeneral(page);
   }
   public void delproject(int id){
	   dao.delproject(id);
   }
   public User findById(int id){
	   return dao.findById(id);
   }
}
