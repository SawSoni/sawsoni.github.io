import { Injectable } from '@angular/core';
import $ from 'jquery';

@Injectable({
  providedIn: 'root'
})
export class PromiseService {

	

  constructor() { }

  getPromise1(){
    
    return new Promise((resolve,reject)=>{
          
            resolve('I am a promise Object comming from promise service');
          
            // reject('Sorry about Promise');
          
    });
  }

  fatchGet(){
  	let URL = "http://localhost:3000/api/tasks";
  	 return fetch(URL);
  	// return p;
  }

 /**
  * This loads data from /api/tasks REST API
  */
  loadTasks(){
    let URL = "http://localhost:3000/api/tasks";
     return $.ajax(URL, { method: 'GET'});
    // return p;
  }

  saveTask(task){
  	let URL = "http://localhost:3000/api/tasks";
  	return $.ajax(URL,{method:'POST',data:task});
  }



  /*loadTasks(){
    var that = this;
    const URL = "http://localhost:3000/api/tasks";
    $.ajax(URL, { method: 'GET'}
    ).then(function(data) {
      console.log(this.heroes);
    }).fail( (data) => {
      console.log(data);
    });
  }*/
  

}
