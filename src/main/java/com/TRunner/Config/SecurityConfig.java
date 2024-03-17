package com.TRunner.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.TRunner.Controllers.AuthenticationSuccessHandler;


@Configuration
@EnableWebSecurity
public class SecurityConfig{

    @Bean
    UserDetailsService getUserDetailsService() {
		return new CustomUserDetailService();
	}

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

    @Bean
    AuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider daoAuthenticationProvider=new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(getUserDetailsService());
		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
		return daoAuthenticationProvider;
	}

    //Configure Methods
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf(c-> c.disable()).authorizeHttpRequests(customizer -> {
			customizer.requestMatchers("/signup","/CSS/**").permitAll();
			customizer.requestMatchers("/user/**").authenticated();
//			customizer.requestMatchers("/createTournament").authenticated();
			customizer.anyRequest().permitAll();
		});
		http.csrf(c-> c.disable()).formLogin(Customizer.withDefaults())
		.logout(form -> form.invalidateHttpSession(true).clearAuthentication(true).logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login?logout").permitAll()) ;
		http.httpBasic(Customizer.withDefaults());
		return http.build();
		
	}
	
    @Bean
    public AuthenticationManager authenticationManager() {
		return new ProviderManager(authenticationProvider());
	}
}
