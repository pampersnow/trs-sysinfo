package com.sys.pojo;

import java.util.Date;

/**  
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: Docdelivery  
* @Description: 文档推送实体类
* @author JYB
* @date 2018年10月13日下午2:53:33
* @version 1.00 
*/
public class Docdelivery {
	private int	id;                           
	private int articleid;                   
	private int sourcesiteid;           
	private String sourcesite;              
	private int sourcepageid;            
	private String sourcepage;              
	private String editorcharge;          
	private String title;                   
	private Date writetime;              
	private int doccount;                 
	private Date pubtime;        
	private int score;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	public int getSourcesiteid() {
		return sourcesiteid;
	}
	public void setSourcesiteid(int sourcesiteid) {
		this.sourcesiteid = sourcesiteid;
	}
	public String getSourcesite() {
		return sourcesite;
	}
	public void setSourcesite(String sourcesite) {
		this.sourcesite = sourcesite;
	}
	public int getSourcepageid() {
		return sourcepageid;
	}
	public void setSourcepageid(int sourcepageid) {
		this.sourcepageid = sourcepageid;
	}
	public String getSourcepage() {
		return sourcepage;
	}
	public void setSourcepage(String sourcepage) {
		this.sourcepage = sourcepage;
	}
	public String getEditorcharge() {
		return editorcharge;
	}
	public void setEditorcharge(String editorcharge) {
		this.editorcharge = editorcharge;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	public int getDoccount() {
		return doccount;
	}
	public void setDoccount(int doccount) {
		this.doccount = doccount;
	}
	public Date getPubtime() {
		return pubtime;
	}
	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
