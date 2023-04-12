import { Component } from '@angular/core';

interface Item {
  todo: string;
  category: string;
  textColor: string;
  bgColor: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent {
  title = 'todo-list';
  todo: string = '';
  category: string = '';
  textColor: string = '';
  bgColor: string = '';
  items: Item[] = [];

  submit() {
    switch (this.category) {
      case 'low':
        this.textColor = 'black';
        this.bgColor ='yellow';
        break;
      case 'medium':
        this.textColor = 'green';
        this.bgColor ='pink';
        break;
      case 'high':
        this.textColor = 'red';
        this.bgColor ='white';
        break;
    }

    this.items.push({
      todo: this.todo,
      category: this.category,
      textColor: this.textColor,
      bgColor: this.bgColor
    });

    this.todo = '';
    this.category = '';
  }
}
