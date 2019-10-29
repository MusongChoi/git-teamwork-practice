package com.ezjobs.practice.entity;

import java.util.Date; // 날짜
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;

@SuppressWarnings("unused") // 날짜 사용안됨
@Entity
@Table(name="search")
@Data
@AllArgsConstructor 
public class Search {
    
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name="company_name", nullable = false)
    private String companyName;

    @Column(name="job_name", nullable = false)
    private String jobName;

    @Column(name="spec", nullable = false)
    private String spec;
}