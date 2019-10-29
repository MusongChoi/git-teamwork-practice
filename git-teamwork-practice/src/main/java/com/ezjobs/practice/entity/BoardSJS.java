package com.ezjobs.practice.entity;

import java.util.Date;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;

@Entity
@Table(name="board")
@Data
@AllArgsConstructor 
public class BoardSJS {
    
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name="title", nullable = false)
    private String title;

    @Column(name="text", nullable = false)
    private String text;

    @Column(name="user_id", nullable = false)
    private String userId;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="edit_date", nullable = false)
    private Date editDate= new Date();
}