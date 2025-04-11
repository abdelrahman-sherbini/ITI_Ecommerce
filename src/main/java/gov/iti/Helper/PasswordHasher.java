package gov.iti.Helper;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class PasswordHasher {

    // Constants for hashing
    private static final int SALT_LENGTH = 16; // in bytes
    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 128; // in bits

    // Hashes the password and returns a string containing salt + hash
    public static String hashPassword(String password) {
        try {
            // Generate a random salt
            byte[] salt = new byte[SALT_LENGTH];
            SecureRandom random = new SecureRandom();
            random.nextBytes(salt);

            // Generate the hash
            KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte[] hash = factory.generateSecret(spec).getEncoded();

            // Return salt and hash encoded as Base64 strings
            return Base64.getEncoder().encodeToString(salt) + ":" + Base64.getEncoder().encodeToString(hash);

        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException("Error while hashing password", e);
        }
    }

    // Verifies if a password matches a stored hash
    public static boolean verifyPassword(String password, String stored) {
        try {
            String[] parts = stored.split(":");
            byte[] salt = Base64.getDecoder().decode(parts[0]);
            byte[] storedHash = Base64.getDecoder().decode(parts[1]);

            KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte[] hash = factory.generateSecret(spec).getEncoded();

            // Compare hashes
            if (hash.length != storedHash.length) return false;
            for (int i = 0; i < hash.length; i++) {
                if (hash[i] != storedHash[i]) return false;
            }
            return true;

        } catch (Exception e) {
            return false;
        }
    }

    
}
