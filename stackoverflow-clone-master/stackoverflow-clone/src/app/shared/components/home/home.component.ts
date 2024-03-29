import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  length: number;

  questions : any[] = [
    {
      id: 1,
      title: 'How to create a responsive website?',
      description: 'I want to create a website that looks good on all devices. What is the best approach for making it responsive?',
      votes: 10,
      answers: 3,
      views: 50,
      showAnswers: false,
      showVotes: false,
      showViews: false,
      answersList: []
    },
    {
      id: 2,
      title: 'What is the difference between React and Angular?',
      description: 'I am new to web development and I am confused about which framework to use. Can someone explain the main differences between React and Angular?',
      votes: 8,
      answers: 5,
      views: 40,
      showAnswers: false,
      showVotes: false,
      showViews: false,
      answersList: []
    },
    {
      id: 3,
      title: 'How to optimize a website for search engines?',
      description: 'I want my website to rank higher on search engine results pages. What are some best practices for optimizing a website for SEO?',
      votes: 5,
      answers: 2,
      views: 30,
      showAnswers: false,
      showVotes: false,
      showViews: false,
      answersList: []
    }
  ];

  constructor() { }

  upvoteQuestion(question: any) {
    // implementation of the upvoteQuestion method
  }
  
  viewAnswers(question) {
    console.log(question.answers); // or any other logic to display the answers
    }

    
}

