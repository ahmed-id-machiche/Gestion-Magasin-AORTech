package com.magasin.service;

import com.magasin.model.entity.User;
import com.magasin.repository.UserRepository;
import com.magasin.util.PasswordUtil;

import java.util.List;

public class UserService {
    private final UserRepository userRepository = new UserRepository();

    public List<User> findAll() { return userRepository.findAll(); }
    public User findById(Long id) { return userRepository.findById(id); }
    public void delete(Long id) { userRepository.delete(id); }

    public User create(User user, String rawPassword) {
        user.setPassword(PasswordUtil.hash(rawPassword));
        return userRepository.save(user);
    }

    public User update(User user, String rawPassword) {
        if (rawPassword != null && !rawPassword.isBlank()) {
            user.setPassword(PasswordUtil.hash(rawPassword));
        }
        return userRepository.update(user);
    }

    public User authenticate(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && PasswordUtil.matches(password, user.getPassword())) {
            return user;
        }
        return null;
    }
}

