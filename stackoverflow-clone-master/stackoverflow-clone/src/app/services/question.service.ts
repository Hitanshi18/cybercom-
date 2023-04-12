import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/internal/BehaviorSubject';

@Injectable({
  providedIn: 'root'
})
export class QuestionService {
  // [x: string]: any;

  // private questions = [
  //   {
  //     id: 1,
  //     title: 'How to create a responsive website?',
  //     description: 'I want to create a website that looks good on all devices. What is the best approach for making it responsive?',
  //     votes: 10,
  //     upvoted: false,
  //     answers: 3,
  //     views: 50,
  //     showAnswers: false,
  //     showVotes: false,
  //     showViews: false,
  //     answersList: []
  //   },
  //   {
  //     id: 2,
  //     title: 'What is the difference between React and Angular?',
  //     description: 'I am new to web development and I am confused about which framework to use. Can someone explain the main differences between React and Angular?',
  //     votes: 8,
  //     upvoted: false,
  //     answers: 5,
  //     views: 40,
  //     showAnswers: false,
  //     showVotes: false,
  //     showViews: false,
  //     answersList: []
  //   },
  //   {
  //     id: 3,
  //     title: 'How to optimize a website for search engines?',
  //     description: 'I want my website to rank higher on search engine results pages. What are some best practices for optimizing a website for SEO?',
  //     votes: 5,
  //     upvoted: false,
  //     answers: 2,
  //     views: 30,
  //     showAnswers: false,
  //     showVotes: false,
  //     showViews: false,
  //     answersList: []
  //   }
  // ];

  // private questionsSubject = new BehaviorSubject<any[]>(this.questions);

  // constructor() { }

  // getQuestions() {
  //   return this.questionsSubject.asObservable();
  // }

  // getQuestionById(id: number) {
  //   return this.questions.find(question => question.id === id);
  // }

  // addAnswerToQuestion(questionId: number, answer: string) {
  //   const question = this.getQuestionById(questionId);
  //   if (question) {
  //     question.answersList.push(answer);
  //     question.answers++;
  //     this.questionsSubject.next(this.questions);
  //   }
  // }

  // upvoteQuestion(questionId: number) {
  //   const question = this.getQuestionById(questionId);
  //   if (question) {
  //     if (!question.upvoted) {
  //       question.upvoted = true;
  //       question.votes++;
  //     } else {
  //       question.upvoted = false;
  //       question.votes--;
  //     }
  //     this.questionsSubject.next(this.questions);
  //   }
  // }

  // addAnswerByQuestionId(questionId: number, answer: any) {
  //   const question = this.questions.find(q => q.id === questionId);
  //   if (question) {
  //     question.answersList.push(answer);
  //   }
  // }
  

  questions: any[] = [
    {
      id: 1,
      title: 'How to create a responsive website?',
      description: 'I want to create a website that looks good on all devices. What is the best approach for making it responsive?',
      votes: 10,
      answers: 3,
      views: 50,
      answersList: []
    },
    {
      id: 2,
      title: 'What is the difference between React and Angular?',
      description: 'I am new to web development and I am confused about which framework to use. Can someone explain the main differences between React and Angular?',
      votes: 8,
      answers: 5,
      views: 40,
      answersList: []
    },
    {
      id: 3,
      title: 'How to optimize a website for search engines?',
      description: 'I want my website to rank higher on search engine results pages. What are some best practices for optimizing a website for SEO?',
      votes: 5,
      answers: 2,
      views: 30,
      answersList: []
    }
  ];

  constructor() { }

  getQuestionById(id: number): any {
    return this.questions.find(q => q.id === id);
  }

  getAnswersByQuestionId(id: number): any[] {
    const question = this.getQuestionById(id);
    return question.answersList;
  }

  addAnswerByQuestionId(id: number, answer: any) {
    const question = this.getQuestionById(id);
    question.answersList.push(answer);
  }
}
