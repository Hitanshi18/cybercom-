import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TopQuestionComponent } from './top-question.component';

describe('TopQuestionComponent', () => {
  let component: TopQuestionComponent;
  let fixture: ComponentFixture<TopQuestionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TopQuestionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TopQuestionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
