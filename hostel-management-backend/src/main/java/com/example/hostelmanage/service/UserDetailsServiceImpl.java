package com.example.hostelmanage.service;

import com.example.hostelmanage.repository.AccountRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.hostelmanage.model.Account;

import javax.inject.Inject;
import java.util.Optional;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Inject
    private AccountRepository accountRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<Account> user =  accountRepository.findAccountByEmail(email);
        System.out.println("Find User: " + user.get().toString());
        User.UserBuilder builder = null;
        if (user.isPresent()) {
            Account currentUser = user.get();
            builder = org.springframework.security.core.userdetails.User.withUsername(email);
            builder.password(currentUser.getPassword());
            builder.roles(currentUser.getRole().getName());
        } else {
            throw new UsernameNotFoundException("User not found.");
        }

        return builder.build();
    }
}
