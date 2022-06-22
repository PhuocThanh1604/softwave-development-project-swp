package com.example.hostelmanage.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Set;


@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String email, phone;

    @Column
    private String password;

    @ManyToOne
    @JoinColumn(name = "fk_role", referencedColumnName = "id" )
    private Role role;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_profile", referencedColumnName = "id")
    @JsonManagedReference
    private Profile profile;

    @JsonIgnore
    @OneToMany(mappedBy="account", cascade = CascadeType.ALL)
    private Set<Booking> booking;

}
