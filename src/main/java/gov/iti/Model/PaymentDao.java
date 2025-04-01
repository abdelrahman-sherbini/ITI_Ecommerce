package gov.iti.Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import gov.iti.Dtos.Payment;

public class PaymentDao {
    private Connection con;

    // Constructor to initialize connection
    public PaymentDao(Connection con) {
        this.con = con;
    }

    // Insert Payment
    public boolean insertPayment(Payment payment)  {
        String query = "INSERT INTO payment (user_id, method, amount, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, payment.getUser_id());
            ps.setString(2, payment.getMethod());
            ps.setBigDecimal(3, payment.getAmount());
            ps.setString(4, payment.getStatus());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        payment.setPayment_id(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            return false;
    }

    // Get Payment by ID
    public Payment getPaymentById(int paymentId) {
        String query = "SELECT * FROM payment WHERE payment_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, paymentId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractPayment(rs);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Get All Payments
    public List<Payment> getAllPayments()  {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM payment";
        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                payments.add(extractPayment(rs));
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return payments;
    }

    // Update Payment
    public boolean updatePayment(Payment payment)  {
        String query = "UPDATE payment SET user_id = ?, method = ?, amount = ?, status = ? WHERE payment_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, payment.getUser_id());
            ps.setString(2, payment.getMethod());
            ps.setBigDecimal(3, payment.getAmount());
            ps.setString(4, payment.getStatus());
            ps.setInt(5, payment.getPayment_id());

            return ps.executeUpdate() > 0;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Delete Payment
    public boolean deletePayment(int paymentId)  {
        String query = "DELETE FROM payment WHERE payment_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, paymentId);
            return ps.executeUpdate() > 0;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Helper Method to Extract Payment from ResultSet
    private Payment extractPayment(ResultSet rs)  {
        Payment payment = new Payment();
        try {
            payment.setPayment_id(rs.getInt("payment_id"));
        payment.setUser_id(rs.getInt("user_id"));
        payment.setMethod(rs.getString("method"));
        payment.setAmount(rs.getBigDecimal("amount"));
        payment.setStatus(rs.getString("status"));
        return payment;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
