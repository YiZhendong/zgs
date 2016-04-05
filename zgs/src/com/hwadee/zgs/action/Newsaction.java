package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.News;
import com.hwadee.zgs.service.Newsservice;
public class Newsaction {
     public News news=new News();
     private Newsservice service=new Newsservice();
     private int news_id;
     public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String add(){
  	   service.add(news);
  	   return "index";
     }
     public String del() {
  	   service.del(news.getNews_id());
  	   return "index";
     }
     public String mod() {
  	   service.mod(news);
  	   return "index";
     }
     public String findById(){
  	   news=service.findById(news_id);
  	   return "update";
     }
     public String findByTitle(){
    	   news=service.findByTitle(news.getTitle());
    	   return "update";
       }
}
