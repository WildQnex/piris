package by.bsuir.piris.repository;

import by.bsuir.piris.model.BankAccount;
import by.bsuir.piris.util.Helper;

import java.util.ArrayList;
import java.util.List;

public class BankRepository {

    private static List<BankAccount> accounts;

    private static BankAccount bankFond;

    static {
        accounts = new ArrayList<>();

        bankFond = new BankAccount();
        bankFond.setNumber(Helper.FOND);
        bankFond.setSaldo(100_000_000);

        accounts.add(bankFond);
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
}
