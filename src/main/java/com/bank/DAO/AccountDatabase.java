package com.bank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bank.Model.Account;

public class AccountDatabase {

    public boolean checkIfAccountExists(String accountNumber) {
        String query = "SELECT COUNT(*) FROM CustomerAccounts WHERE account_number = ?";
        try (Connection con = UserDatabase.myconnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, accountNumber);

            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getInt(1) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Account getAccountDetails(String accountNumber) {
        String query = "SELECT * FROM CustomerAccounts WHERE account_number = ?";
        try (Connection con = UserDatabase.myconnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, accountNumber);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setUser_id(rs.getInt("cust_id"));
                account.setAccount_number(rs.getString("account_number"));
                account.setIfsc(rs.getString("ifsc_code"));
                account.setAccount_type(rs.getString("account_type"));
                account.setBalance(rs.getDouble("balance"));
                account.setBranch_name(rs.getString("branch_name"));
                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean createNewAccount(Account acc) {
        String query = "INSERT INTO CustomerAccounts (account_id, cust_id, account_number, ifsc_code, account_type, balance, branch_name) " +
                "VALUES (user_accid_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
        try (Connection con = UserDatabase.myconnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, acc.getUser_id());
            stmt.setString(2, acc.getAccount_number());
            stmt.setString(3, acc.getIfsc());
            stmt.setString(4, acc.getAccount_type());
            stmt.setDouble(5, acc.getBalance());
            stmt.setString(6, acc.getBranch_name());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean linkAccountToUser(int userId, String accountNumber) {
        String query = "UPDATE CustomerAccounts SET cust_id = ? WHERE account_number = ?";
        try (Connection connection = UserDatabase.myconnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.setString(2, accountNumber);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
