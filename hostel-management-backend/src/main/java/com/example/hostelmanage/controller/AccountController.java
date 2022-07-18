package com.example.hostelmanage.controller;

import com.example.hostelmanage.domain.BookingDomain;
import com.example.hostelmanage.model.Account;
import com.example.hostelmanage.model.Profile;
import com.example.hostelmanage.model.Role;
import com.example.hostelmanage.repository.AccountRepository;
import com.example.hostelmanage.repository.ProfileRepository;
import com.example.hostelmanage.repository.RoleRepository;
import com.example.hostelmanage.service.AccountService;
import com.example.hostelmanage.service.JwtService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.Optional;

@RestController
@RequestMapping(path = "/account")
public class AccountController {

    @Inject
    public AccountRepository accountRepository;

    @Inject
    public ProfileRepository profileRepository;

    @Inject
    public RoleRepository roleRepository;

    @Inject
    private PasswordEncoder passwordEncoder;

    @Inject
    private JwtService jwtService;

    @Inject
    private AccountService accountService;

    @PostMapping("/create")
    public ResponseEntity<Account> createAccount(@RequestBody Account account) throws Exception {
        String email = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();

        if(!email.equals("anonymousUser")){
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        Optional<Account> accountChecking = accountRepository.findAccountByEmail(account.getEmail());

        if(accountChecking.isPresent()){
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        account.setPassword(passwordEncoder.encode(account.getPassword()));
        account = accountRepository.save(account);
        return new ResponseEntity<>(account, HttpStatus.CREATED);
    }


    @GetMapping("/id/{Id}")
    public ResponseEntity<?> getAccountById(@PathVariable Long Id) throws Exception {
        Account account = accountService.getAccountById(Id);
        return new ResponseEntity<>(account, HttpStatus.OK);
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<Account>> getAllAccount(){
        Iterable<Account> list = accountRepository.findAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PutMapping("/update/{Id}")
    public  ResponseEntity<?> updateAccount(@PathVariable Long Id,  @RequestBody Account account) throws Exception {

        /* There are 4 step to dynamic update a entity
        * Step 1: Find account by ID with Optional<T>
        * Step 2: Get profile ID from account which we find out before
        * Step 3: Find profile by profile ID in step 2 with Optional<T>
        * Step 4: Setter them
        * */

        Optional<Account> acc = accountRepository.findById(Id);

        if(!acc.isPresent()) {
            throw new Exception("Account not found");
        }

        Account thisAcccount = acc.get();

        Optional<Profile> prf = profileRepository.findById(thisAcccount.getProfile().getId());

        if(!prf.isPresent()) {
            throw new Exception("Profile not found");
        }
        Optional<Role> role = roleRepository.findById(thisAcccount.getRole().getId());
        if(!role.isPresent()) {
            throw new Exception("Profile not found");
        }

        Profile thisProfile = prf.get();
        Role thisRole =role.get();

        /* Update phone, password */
        if(account.getPhone() != null)
            thisAcccount.setPhone(account.getPhone());

        if(account.getPassword() != null)
            thisAcccount.setPassword(account.getPassword());

        /* Update Full Name, DoB, Card ID  */
        if(account.getProfile().getFullName() != null)
            thisProfile.setFullName(account.getProfile().getFullName());

        if(account.getProfile().getDob() != null)
            thisProfile.setDob(account.getProfile().getDob());

        if(account.getProfile().getCardNumber() != null);
            thisProfile.setCardNumber(account.getProfile().getCardNumber());

        if(account.getRole().getName() == null);
        thisRole.setName(account.getRole().getName());

        thisRole.setStatus(thisRole.isStatus());

        /* Save them */
        accountRepository.save(thisAcccount);
        profileRepository.save(thisProfile);
        roleRepository.save(thisRole);

        return new ResponseEntity<>(thisAcccount, HttpStatus.OK);

    }
    @PutMapping("/update/{Id}/role/{role_id}")
    public  ResponseEntity<?> updateRoleForAccount(
                @PathVariable Long Id,//id account
                @PathVariable Long role_id //id của role
            ) throws Exception {

        Optional<Account> acc = accountRepository.findById(Id);

        if(!acc.isPresent()) {
            throw new Exception("Account not found");
        }
        Optional<Role> role = roleRepository.findById(role_id);
        if(!role.isPresent()) {
            throw new Exception("Role not found");
        }
        Account thisAcccount = acc.get();
        Role thisRole =role.get();
        thisAcccount.setRole(thisRole);

        /* Save them */
        accountRepository.save(thisAcccount);
        return new ResponseEntity<>(thisAcccount, HttpStatus.OK);

    }

    /* Only Test
    *  Note: We have to update status column, not use delete method!
    * */
    @DeleteMapping("/delete/{Id}")
    public ResponseEntity<?> deleteAccount(@PathVariable Long Id){
        accountRepository.deleteById(Id);
        return  new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/user")
    public ResponseEntity<?> getAccountByEmail() throws Exception {
        String email = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        Optional<Account> account = accountRepository.findAccountByEmail(email);

        if(!account.isPresent()){
            throw new Exception("Account not found");
        }

        Account thisAcccount = account.get();

        return new ResponseEntity<>(thisAcccount, HttpStatus.OK);

    }

    /* Update card number */
    @PutMapping("/updateCardNumber")
    public ResponseEntity<?> updateCardNumber(@RequestBody BookingDomain bookingDomain) {
        String email = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        System.out.println("dwewewew" + email);
        Optional<Account> account = accountRepository.findAccountByEmail(email);
        Account thisAccount = account.get();

        Optional<Profile> profile = profileRepository.findById(thisAccount.getProfile().getId());
        Profile thisProfile = profile.get();

        thisProfile.setCardNumber(bookingDomain.getCardNumber());
        profileRepository.save(thisProfile);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }




}
