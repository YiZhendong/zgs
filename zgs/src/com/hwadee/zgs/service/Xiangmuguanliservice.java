//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Xiangmuguanliservice.java

package com.hwadee.zgs.service;

import com.hwadee.zgs.dao.Xiangmuguanlidao;
import com.hwadee.zgs.pojo.Project;
public class Xiangmuguanliservice 
{
   private Xiangmuguanlidao dao = new Xiangmuguanlidao();
   public void add(Project p) 
   {
	   dao.add(p);
   }
   
   public void del(int id) 
   {
	   dao.del(id);
   }
   
   public void mod(Project p) 
   {
	   dao.mod(p);
   }
}
