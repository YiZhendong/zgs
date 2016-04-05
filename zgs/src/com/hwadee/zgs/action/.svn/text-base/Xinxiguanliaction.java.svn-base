//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\action\\Xinxiguanliaction.java

package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.User;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.service.Xinxiguanliservice;

public class Xinxiguanliaction 
{
	public User user=new User();
	public Project project=new Project();
	private Xinxiguanliservice service=new Xinxiguanliservice();
   /**
   @roseuid 55AC82E600C9
    */
   public Xinxiguanliaction() 
   {
    
   }
   
   /**
   @roseuid 55AC82F401EA
    */
 
   
   /**
   @roseuid 55AC82F8032B
    */
   public String del() 
   {
    service.del(user.getUser_id());
    return "index";
   }
   
   /**
   @roseuid 55AC82FD03A0
    */
   public String moduser() 
   {
      service.mod(user);
      return "index";
   }
   public String modproject() 
   {
      service.mod(project);
      return "index";
   }
   public String delproject(){
	   service.delproject(project.getProject_id());
	   return "index";
   }
   public String findById(){
	   user=service.findById(user.getUser_id());
	   return "update";
   }
}
