package com.codingdojo.doctors.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="ratings")
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Min(value = 1, message="Rating must be atleast 1")
    @Max(value = 10, message="Rating must be maximum of 10")
    private Integer rate;
 
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
    	this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
    	this.updatedAt = new Date();
    }
    
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ratingUser_id")
	private User ratingUser;
 	    
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ratingComment_id")
	private Comment ratingComment;

	public Rating(Long id, Integer rate, User ratingUser, Comment ratingComment) {
		this.id = id;
		this.rate = rate;
		this.ratingUser = ratingUser;
		this.ratingComment = ratingComment;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getRate() {
		return rate;
	}
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getRatingUser() {
		return ratingUser;
	}
	public void setRatingUser(User ratingUser) {
		this.ratingUser = ratingUser;
	}
	public Comment getRatingComment() {
		return ratingComment;
	}
	public void setRatingComment(Comment ratingComment) {
		this.ratingComment = ratingComment;
	}
	
	
	
	
}
