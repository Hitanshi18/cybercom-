import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/internal/BehaviorSubject';

@Injectable({
  providedIn: 'root'
})
export class DataService {

    private questions = new BehaviorSubject<any>([]);
    currentQuestions = this.questions.asObservable();
  
    constructor() { }
  
    changeQuestions(questions: any) {
      this.questions.next(questions);
    }
  
    // Implement methods for getting, updating, and deleting data here
  
  }
