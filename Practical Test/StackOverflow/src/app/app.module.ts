import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
// import { HttpClient } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './layout/header/header.component';
import { AskQuestionComponent } from './component/ask-question/ask-question.component';
import { TopQuestionComponent } from './component/top-question/top-question.component';
import { QuestionDetailComponent } from './component/question-details/question-details.component';
// import { LayoutModule } from './layout/layout.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserRoutingModule } from './user/user-routing.module';
@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    AskQuestionComponent,
    TopQuestionComponent,
    QuestionDetailComponent,

  ],
  imports: [
    BrowserModule,
    // HttpClient,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,UserRoutingModule
    // LayoutModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
