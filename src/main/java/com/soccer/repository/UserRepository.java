package com.soccer.repository;

import com.soccer.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    // Find by email (used in registration and forgot password)
    User findByEmail(String email);

    // Find by reset token (used in password reset)
    User findByResetToken(String resetToken);

    // Find by userId and password (optional if you want combined lookup)
    User findByUserIdAndPassword(String userId, String password);

    // Find by verification code (used in email verification)
    User findByVerificationCode(String verificationCode);

    // ✅ Add this missing method for login lookup
    User findByUserId(String userId);
}