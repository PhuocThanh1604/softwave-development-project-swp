package com.example.hostelmanage.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name, img;

    @Column
    private Double price;

    @Column
    private  Integer quantity;

    @Column
    private  boolean status;

    @ManyToOne
    @JoinColumn(name = "fk_service_cate", referencedColumnName = "id")
    private ServiceCategory serviceCategory;


    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL)
    private Set<ServiceDetail> serviceDetails;

}
