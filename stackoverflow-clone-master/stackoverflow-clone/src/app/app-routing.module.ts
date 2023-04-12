import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ErrorPageComponent } from './error-page/error-page.component';
import { HomeComponent } from './shared/components/home/home.component';
import { QuestionDetailComponent } from './shared/components/question-detail/question-detail.component';
import { AskQuestionComponent } from './shared/components/ask-question/ask-question.component';

const routes: Routes = [
  {path:'',redirectTo:'home',pathMatch:'full'},
  {path:'home',component:HomeComponent},
{path:'users',
loadChildren: () => import('./users/users.module').then(m => m.UsersModule)},
{path: 'question-detail' , component: QuestionDetailComponent},
{path:'**',component:ErrorPageComponent},
{ path: 'question-detail/:id', component: QuestionDetailComponent },
{path: 'ask-question', component: AskQuestionComponent}

]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
