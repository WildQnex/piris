package by.bsuir.piris.controller;

import by.bsuir.piris.model.BankAccount;
import by.bsuir.piris.model.Client;
import by.bsuir.piris.model.ClientDto;
import by.bsuir.piris.model.CreditContract;
import by.bsuir.piris.model.DepositContract;
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

    @GetMapping("/deposit")
    public ModelAndView deposit()
    {
        ModelAndView modelAndView = new ModelAndView("deposit");
        return modelAndView;
    }

    @GetMapping("/credits")
    public ModelAndView credits()
    {
        ModelAndView modelAndView = new ModelAndView("credits");
        modelAndView.addObject("credits", BankRepository.getCreditContracts());
        return modelAndView;
    }

    @GetMapping("/deposits")
    public ModelAndView deposits()
    {
        ModelAndView modelAndView = new ModelAndView("deposits");
        modelAndView.addObject("deposits", BankRepository.getDepositeContracts());
        return modelAndView;
    }

    @PostMapping("/credit/add")
    public ModelAndView creditAdd(@ModelAttribute CreditContract contract)
    {
        contract.setNumber(Helper.getNextCreditAccountNumber());
        contract.setDaysAmount(ChronoUnit.DAYS.between(contract.getStartDate(), contract.getEndDate()));
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
        BankRepository.addAccount(account);
        BankRepository.addAccount(percentAccount);
        contract.setAccount(account);
        contract.setPercentAccount(percentAccount);
        BankRepository.addCreditContract(contract);
        return new ModelAndView("index");
    }

    @PostMapping("/deposit/add")
    public ModelAndView depositeAdd(@ModelAttribute DepositContract contract)
    {
        contract.setNumber(Helper.getNextDepositAccountNumber());
        contract.setDaysAmount(ChronoUnit.DAYS.between(contract.getStartDate(), contract.getEndDate()));
        BankAccount account = new BankAccount();
        account.setActive(false);
        account.setSaldo(contract.getMoney());
        account.setDollar(contract.isDollar());
        account.setNumber(contract.getNumber());
        Client user = clientRepository.getClient(contract.getId());
        account.setClient(user);
        BankAccount percentAccount = new BankAccount();
        percentAccount.setActive(false);
        percentAccount.setSaldo(0);
        percentAccount.setDollar(contract.isDollar());
        percentAccount.setNumber(Helper.getNextDepositAccountNumber());
        percentAccount.setClient(user);
        BankRepository.addAccount(account);
        BankRepository.addAccount(percentAccount);
        contract.setAccount(account);
        contract.setPercentAccount(percentAccount);
        BankRepository.addDepositeContract(contract);
        return new ModelAndView("index");
    }
}
