import { Component } from '@angular/core';
import firebase from 'firebase/app';
import 'firebase/auth';
// import * as firebase from 'firebase/app';
// import 'firebase/auth';
// import 'firebase/firestore';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent {
  constructor() {
    firebase.initializeApp({
      apiKey: '<your-api-key>',
      authDomain: '<your-auth-domain>',
      projectId: '<your-project-id>',
      storageBucket: '<your-storage-bucket>',
      messagingSenderId: '<your-messaging-sender-id>',
      appId: '<your-app-id>'
    });
}

onSignupWithGoogle() {
  const provider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(provider);
}
}
