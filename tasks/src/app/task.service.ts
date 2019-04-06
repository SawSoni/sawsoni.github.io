/*to Create this file Using the Angular CLI, 
create a service called hero.(ng generate service hero)this is the command*/
import { Injectable } from '@angular/core';
import $ from 'jquery';

@Injectable({
  providedIn: 'root'
})

/*The HeroService is now ready to plug into the HeroesComponent.*/
export class TaskService {


  constructor() {
    console.log("Created instance of TaskService") 
  }

  /**
  * This method get tasks from REST API through fetch() function
  */
  fatchTasks(){
    let URL = "http://localhost:3000/api/task";
     return fetch(URL);
    // return p;
  }

 /**
  * This loads data from /api/tasks REST API with jquery AJAX
  */
  getTasks(){
    let URL = "http://localhost:3000/api/task";
     return $.ajax(URL, { method: 'GET'});
    // return p;
  }

  /**
  * This method save task in REST API
  */
  saveTask(task){
    let URL = "http://localhost:3000/api/task";
    return $.ajax(URL,{method:'POST',data:task});
  }
  
}
