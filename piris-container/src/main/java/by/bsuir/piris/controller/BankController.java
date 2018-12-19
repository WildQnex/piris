package by.bsuir.piris.controller;

import by.bsuir.piris.model.BankAccount;
import by.bsuir.piris.model.Client;
import by.bsuir.piris.model.ClientDto;
import by.bsuir.piris.model.CreditContract;
import by.bsuir.piris.repository.BankRepository;
import by.bsuir.piris.repository.impl.ClientRepositoryImpl;
import by.bsuir.piris.util.Helper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.temporal.ChronoUnit;

@Controller
@RequestMapping("/api/bank")
public class BankController
{

    @Autowired
    private ClientRepositoryImpl clientRepository;

    @GetMapping
    public ModelAndView mainPage()
    {
        ModelAndView modelAndView = new ModelAndView("bank");
        return modelAndView;
    }


    @GetMapping("/accounts")
    public ModelAndView getAccounts()
    {
        ModelAndView modelAndView = new ModelAndView("accounts");
        modelAndView.addObject("accounts", BankRepository.getAccounts());
        return modelAndView;
    }

    @GetMapping("/credit")
    public ModelAndView credit()
    {
        ModelAndView modelAndView = new ModelAndView("credit");
        return modelAndView;
    }

    @PostMapping("/credit/add")
    public ModelAndView creditAdd(@ModelAttribute CreditContract contract)
    {
        contract.setNumber(Helper.getNextCreditAccountNumber());
        contract.setDaysAmount(ChronoUnit.DAYS.between(contract.getEndDate(), contract.getStartDate()));
        BankAccount account = new BankAccount();
        account.setActive(true);
        account.setSaldo(contract.getMoney());
        account.setDollar(contract.isDollar());
        account.setNumber(contract.getNumber());
        Client user = clientRepository.getClient(contract.getId());
        account.setClient(user);
        BankAccount percentAccount = new BankAccount();
        percentAccount.setActive(true);
        percentAccount.setSaldo(0);
        percentAccount.setDollar(contract.isDollar());
        percentAccount.setNumber(Helper.getNextCreditAccountNumber());
        percentAccount.setClient(user);
        contract.setAccount(account);
        contract.setPercentAccount(percentAccount);
        System.out.println(contract);
        return new ModelAndView("index");
    }

    @PostMapping("/deposit/add")
    public ModelAndView depositeAdd(@ModelAttribute CreditContract contract)
    {
        contract.setNumber(Helper.getNextCreditAccountNumber());
        contract.setDaysAmount(ChronoUnit.DAYS.between(contract.getEndDate(), contract.getStartDate()));
        BankAccount account = new BankAccount();
        account.setActive(true);
        account.setSaldo(contract.getMoney());
        account.setDollar(contract.isDollar());
        account.setNumber(contract.getNumber());
        Client user = clientRepository.getClient(contract.getId());
        account.setClient(user);
        BankAccount percentAccount = new BankAccount();
        percentAccount.setActive(true);
        percentAccount.setSaldo(0);
        percentAccount.setDollar(contract.isDollar());
        percentAccount.setNumber(Helper.getNextCreditAccountNumber());
        percentAccount.setClient(user);
        contract.setAccount(account);
        contract.setPercentAccount(percentAccount);
        System.out.println(contract);
        return new ModelAndView("index");
    }
}
