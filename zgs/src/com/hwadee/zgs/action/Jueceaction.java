package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.service.Jueceservice;
public class Jueceaction {
    public Project project=new Project();
    private Jueceservice service=new Jueceservice();
    public String juece() 
    {
 	   service.juece(project);
 	   return "index";
    }
    public String findById(){
 	   project=service.findById(project.getProject_id());
 	   return "update";
    }
}
