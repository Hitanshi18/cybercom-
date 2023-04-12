import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/Shared/guard/service/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user_login!: FormGroup;
  response : any
  constructor(
    private formBuilder: FormBuilder,
    private userService: UserService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.user_login = this.formBuilder.group({
      username: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(8)]]
    });
  }

  get get_user_login() {
    return this.user_login.controls;
  }

  Save_User_Login() {
    const email = this.user_login.value.username;
    const password = this.user_login.value.password;

    this.userService.loginUser(email, password).subscribe(
      () => {
        // Handle successful login
        console.log('Login successful!');
        this.router.navigate(['/layout']); // Navigate to user profile page
      },
      (error: any) => {
        // Handle login error
        console.log('Login failed:', error);
      }
    );
  }

}