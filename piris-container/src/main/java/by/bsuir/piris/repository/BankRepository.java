package by.bsuir.piris.repository;

import by.bsuir.piris.model.BankAccount;
import by.bsuir.piris.model.CreditContract;
import by.bsuir.piris.model.DepositContract;
import by.bsuir.piris.util.Helper;

import java.util.ArrayList;
import java.util.List;

public class BankRepository {

    private static List<BankAccount> accounts;
    private static List<CreditContract> creditContracts;
    private static List<DepositContract> depositContracts;
    private static BankAccount bankFond;

    static {
        accounts = new ArrayList<>();

        bankFond = new BankAccount();
        bankFond.setNumber(Helper.FOND);
        bankFond.setSaldo(100_000_000);

        accounts.add(bankFond);

        creditContracts = new ArrayList<>();
        depositContracts = new ArrayList<>();
    }

    public static List<BankAccount> getAccounts()
    {
        return accounts;
    }

    public static BankAccount getAccount(long id)
    {
        return accounts.stream().filter(acc -> acc.getNumber() == id).findFirst().orElse(null);
    }

    public static void addAccount(BankAccount bankAccount)
    {
        if(accounts.stream().noneMatch(acc -> acc.getNumber() == bankAccount.getNumber()))
        {
            accounts.add(bankAccount);
        }
    }

    public static void updateAccount(BankAccount bankAccount)
    {
        accounts.stream().filter(acc -> acc.getNumber() == bankAccount.getNumber())
                .forEach(acc -> {
                    acc.setSaldo(bankAccount.getSaldo());
                    acc.setActive(bankAccount.isActive());
                    acc.setClient(bankAccount.getClient());
                });
    }

    public static List<CreditContract> getCreditContracts()
    {
        return creditContracts;
    }

    public static List<DepositContract> getDepositeContracts()
    {
        return depositContracts;
    }

    public static void addCreditContract(CreditContract creditContract)
    {
        creditContracts.add(creditContract);
    }

    public static void addDepositContract(DepositContract depositContract)
    {
        depositContracts.add(depositContract);
    }

    public static BankAccount getBankFond() {
        return bankFond;
    }

    public static void transaction(BankAccount to, BankAccount from, double money)
    {
        if(from.isDollar() && to.isDollar())
        {
            from.withdrawMoney(money);
            to.addMoney(money);
        }else if(!from.isDollar() && !to.isDollar())
        {
            from.withdrawMoney(money);
            to.addMoney(money);
        }else if(from.isDollar() && !to.isDollar())
        {
            from.withdrawMoney(money);
            to.addMoney((money * Helper.CURRENCY_RATE));
        }else if(!from.isDollar() && to.isDollar())
        {
            System.out.println(money);
            System.out.println((long)(money / Helper.CURRENCY_RATE));
            from.withdrawMoney(money);
            to.addMoney((money / Helper.CURRENCY_RATE));
        }

    }
}
