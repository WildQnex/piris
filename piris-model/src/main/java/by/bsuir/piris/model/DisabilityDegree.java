package by.bsuir.piris.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "disability")
public class DisabilityDegree {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_disability", nullable = false)
    private long id;

    @Column(name = "disability_degree", nullable = false)
    private int disabilityDegree;
}
