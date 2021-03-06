package by.bsuir.piris.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

@Data
@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_client", nullable = false)
    private long id;

    @Column(name = "surname", nullable = false)
    private String surname;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "middlename", nullable = false)
    private String middleName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "birthday", nullable = false)
    private LocalDate birthday;

    @Column(name = "passport_series", nullable = false)
    private String passportSeries;

    @Column(name = "passport_number", nullable = false)
    private String passportNumber;

    @Column(name = "issued_by", nullable = false)
    private String issuedBy;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "issue_date", nullable = false)
    private LocalDate issueDate;

    @Column(name = "ident_number", nullable = false)
    private String identNumber;

    @Column(name = "birthday_place", nullable = false)
    private String birthdayPlace;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "home_telephone")
    private String homeTelephone;

    @Column(name = "mobile_phone")
    private String mobilePhone;

    @Column(name = "email")
    private String email;

    @Column(name = "workplace")
    private String workplace;

    @Column(name = "position")
    private String position;

    @Column(name = "pensioner")
    private boolean pensioner;

    @Column(name = "salary")
    private BigDecimal salary;

    @Column(name = "militarity")
    private boolean militarity;

    @ManyToOne
    @JoinColumn(name = "id_disability")
    private DisabilityDegree disabilityDegree;

    @ManyToOne
    @JoinColumn(name = "id_merital_status")
    private MeritalStatus meritalStatus;

    @ManyToOne
    @JoinColumn(name = "id_citizenship")
    private Citizenship citizenship;

    @ManyToOne
    @JoinColumn(name = "id_city")
    private City city;

    public Client(){}

    public Client(ClientDto clientDto)
    {
        this.id = clientDto.getId();

        this.surname = clientDto.getSurname();

        this.name = clientDto.getName();

        this.middleName = clientDto.getMiddleName();

        this.birthday = clientDto.getBirthday();

        this.passportSeries = clientDto.getPassportSeries();

        this.passportNumber = clientDto.getPassportNumber();

        this.issuedBy = clientDto.getIssuedBy();

        this.issueDate = clientDto.getIssueDate();

        this.identNumber = clientDto.getIdentNumber();

        this.birthdayPlace = clientDto.getBirthdayPlace();

        this.address = clientDto.getAddress();

        this.homeTelephone = clientDto.getHomeTelephone();

        this.mobilePhone = clientDto.getMobilePhone();

        this.email = clientDto.getEmail();

        this.workplace = clientDto.getWorkplace();

        this.position = clientDto.getPosition();

        this.pensioner = clientDto.isPensioner();

        this.salary = clientDto.getSalary();

        this.militarity = clientDto.isMilitarity();

        DisabilityDegree disabilityDegree = new DisabilityDegree();
        disabilityDegree.setId(clientDto.getDisability());
        this.disabilityDegree = disabilityDegree;

        MeritalStatus meritalStatus = new MeritalStatus();
        meritalStatus.setId(clientDto.getMeritalStatus());
        this.meritalStatus = meritalStatus;

        Citizenship citizenship = new Citizenship();
        citizenship.setId(clientDto.getCitizenship());
        this.citizenship = citizenship;

        City city = new City();
        city.setId(clientDto.getCity());
        this.city = city;

    }
}
