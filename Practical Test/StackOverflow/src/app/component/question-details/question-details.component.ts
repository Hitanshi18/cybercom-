import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-question-details',
  templateUrl: './question-details.component.html',
  styleUrls: ['./question-details.component.css']
})
export class QuestionDetailComponent implements OnInit {
  question = {
    id: 1,
    title: 'How to create a responsive website?',
    description: 'I want to create a website that looks good on all devices. What is the best approach for making it responsive?',
    votes: 10,
    answers: [
      {
        id: 1,
        text: 'You can use CSS media queries to make your website responsive.',
        votes: 5,
        user: {
          id: 1,
          name: 'John Doe',
          email: 'john.doe@example.com'
        },
        queries: [
          {
            id: 1,
            text: 'Can you provide an example of a media query?',
            user: {
              id: 2,
              name: 'Jane Doe',
              email: 'jane.doe@example.com'
            },
            timestamp: '2023-04-12T10:30:00'
          }
        ]
      },
      {
        id: 2,
        text: 'Bootstrap is a popular framework for building responsive websites.',
        votes: 3,
        user: {
          id: 2,
          name: 'Jane Doe',
          email: 'jane.doe@example.com'
        },
        queries: []
      }
    ],
    views: 50
  };
  dataService: any;
  authService: any;

  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    // Get the question ID from the URL parameters
    const questionId = this.route.snapshot.paramMap.get('id');

    // Use the ID to fetch the question from a data service
    // and assign it to the `question` property
    // This code assumes that you have a data service that provides
    // the question data based on its ID
    this.question = this.dataService.getQuestionById(questionId);
  }

  onAnswerQuery(answerId: number, queryText: string) {
    // Handle a new query related to an answer
    // This code assumes that you have a data service that provides
    // methods to add queries to an answer
    const currentUser = this.authService.getCurrentUser();
    this.dataService.addQueryToAnswer(answerId, queryText, currentUser);
  }

  onVoteAnswer(answerId: number) {
    // Handle a vote for an answer
    // This code assumes that you have a data service that provides
    // methods to add votes to an answer
    const currentUser = this.authService.getCurrentUser();
    this.dataService.addVoteToAnswer(answerId, currentUser);
  }

}
