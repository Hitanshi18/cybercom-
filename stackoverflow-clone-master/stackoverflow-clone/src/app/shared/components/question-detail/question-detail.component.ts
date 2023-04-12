import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { QuestionService } from 'src/app/services/question.service';

@Component({
  selector: 'app-question-detail',
  templateUrl: './question-detail.component.html',
  styleUrls: ['./question-detail.component.css']
})
export class QuestionDetailComponent {
  questionId: number;
  question: any;
  answers: any[];

  constructor(
    private route: ActivatedRoute,
    private questionService: QuestionService
  ) { 
    
  }

  ngOnInit() {

    const questionId = this.route.snapshot.paramMap.get('id');
    // You can fetch the question data from a service or store based on the questionId
    this.question = {
      id: questionId,
      title: 'Sample Question',
      description: 'This is a sample question',
      upvoted: false,
      votes: 0,
      views: 0,
      answers: []
    };
    // this.questionId = +this.route.snapshot.paramMap.get('id');
    // this.question = this.questionService.getQuestionById(this.questionId);
    // this.answers = this.questionService['getAnswersByQuestionId'](this.questionId);
  }


  addAnswer(answerText: string, userName: string) {
    const newAnswer = {
      text: answerText,
      user: userName,
      date: new Date()
    };
    this.questionService.addAnswerByQuestionId(this.questionId, newAnswer);
    this.answers = this.questionService['getAnswersByQuestionId'](this.questionId);
  }
  
}
