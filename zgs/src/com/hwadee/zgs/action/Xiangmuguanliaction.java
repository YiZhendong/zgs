//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\action\\Xiangmuguanliaction.java

package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.service.Xiangmuguanliservice;
public class Xiangmuguanliaction 
{
	public Project project=new Project();
   private Xiangmuguanliservice service=new Xiangmuguanliservice();
   /**
   @roseuid 55AC7CAE0102
    */
   public Xiangmuguanliaction() 
   {
    
   }
   
   /**
   @roseuid 55AC7CC60139
    */
   public String add() 
   {
    service.add(project);
    return "index";
   }
   
   /**
   @roseuid 55AC7D230334
    */
   public String del() 
   {
    service.del(project.getProject_id());
    return "index";
   }
   
   /**
   @roseuid 55AC7D2B0163
    */
   public String mod() 
   {
    service.mod(project);
    return "index";
   }
}
