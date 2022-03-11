package fr.esgi.hackaton.mapper;

import fr.esgi.hackaton.dto.PasswordResetRequest;
import fr.esgi.hackaton.dto.RegistrationRequest;
import fr.esgi.hackaton.dto.auth.AuthenticationRequest;
import fr.esgi.hackaton.dto.auth.AuthenticationResponse;
import fr.esgi.hackaton.dto.user.UserResponse;
import fr.esgi.hackaton.service.AuthenticationService;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class AuthenticationMapper {

    private final AuthenticationService authenticationService;
    private final UserMapper userMapper;

    public AuthenticationMapper(@Lazy AuthenticationService authenticationService, UserMapper userMapper) {
        this.authenticationService = authenticationService;
        this.userMapper = userMapper;
    }

    public AuthenticationResponse login(AuthenticationRequest request) {
        Map<String, String> credentials = authenticationService.login(request.getEmail(), request.getPassword());
        AuthenticationResponse response = new AuthenticationResponse();
        response.setEmail(credentials.get("email"));
        response.setToken(credentials.get("token"));
        response.setUserRole(credentials.get("userRole"));
        return response;
    }

    public UserResponse findByPasswordResetCode(String code) {
        return userMapper.convertToResponseDto(authenticationService.findByPasswordResetCode(code));
    }

    public String registerUser(String captcha, RegistrationRequest registrationRequest) {
        return authenticationService.registerUser(userMapper.convertToEntity(registrationRequest), captcha, registrationRequest.getPassword2());
    }

    public String activateUser(String code) {
        return authenticationService.activateUser(code);
    }

    public String sendPasswordResetCode(String email) {
        return authenticationService.sendPasswordResetCode(email);
    }

    public String passwordReset(String email, PasswordResetRequest passwordReset) {
        return authenticationService.passwordReset(email, passwordReset.getPassword(), passwordReset.getPassword2());
    }
}
