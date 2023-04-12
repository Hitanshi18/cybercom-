import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, NgForm, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/Shared/guard/service/user.service';



@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {


    registrationForm!: FormGroup;
  
    constructor(
      private formBuilder: FormBuilder,
      private http: HttpClient,
      private userService:UserService,
      private router : Router
    ) {}
  
    ngOnInit() {
      this.registrationForm = this.formBuilder.group({
        name: ['', Validators.required],
        email: ['', [Validators.required, Validators.email]],
        password: ['', [Validators.required, Validators.minLength(8)]]
      });
    }
    onSubmit() {
      this.userService.addUser(this.registrationForm.value).subscribe(
        response => {
          console.log(response);
          // Handle successful response
    
          // Redirect user to login page
          this.router.navigate(['/login']);
        },
        error => {
          console.log(error);
          // Handle error response
        }
      );
    }
    
    // registrationForm: FormGroup ;
  
    // constructor(
    //   private formBuilder: FormBuilder,
    //   private http: HttpClient
    // ) {}
  
    // ngOnInit() {
    //   this.registrationForm = this.formBuilder.group({
    //     name: ['', Validators.required],
    //     email: ['', [Validators.required, Validators.email]],
    //     password: ['', [Validators.required, Validators.minLength(8)]]
    //   });
    // }
  
    // onSubmit() {
    //   const registrationData = this.registrationForm.value;
  
    //   // Send registrationData to backend API using HttpClient
    //   this.http.post('/api/register', registrationData).subscribe(
    //     (response) => {
    //       console.log('Registration successful!');
    //       // Redirect user to login page
    //     },
    //     (error) => {
    //       console.log('Registration failed:', error);
    //     }
    //   );
    // }
  }