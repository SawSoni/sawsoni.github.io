import { Component, OnInit } from '@angular/core';
import { Hero } from '../hero';


// import { HEROES } from '../mockheroes';//after creating heroService comment this HEROES import
import { HeroService } from '../hero.service';
import { MessageService } from '../message.service';
import { PromiseService } from '../promise.service';
import $ from 'jquery';


@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.css']
})
export class HeroesComponent implements OnInit {
	// heroes = HEROES ; //this is the array we iterate in html
  heroes:Hero[]; //this is comming from heroService
	selectedHero: Hero; //this is a single object
  id:number;
  name:string;

  

  /*Inject the HeroService*/
  /*Add a private heroService parameter of type HeroService to the constructor.*/
  // constructor(private heroService: HeroService) {
    constructor(private messageservice: MessageService,private heroService: HeroService, private promiseObject: PromiseService) {

    /*When Angular creates a HeroesComponent, the Dependency Injection system sets
     the heroService parameter
     to the singleton instance of HeroService.*/
  }

 
  ngOnInit() {
    // this.loadTasks();
    this.getHeroes();
    console.log(this.getHeroes());
    /* call getHeroes() inside the ngOnInit lifecycle hook and let Angular call ngOnInit at an appropriate time after constructing a HeroesComponent instance.*/
    this.test1();
    // this.usePromise();
    this.useFetchPromise();
    this.useAjaxPromise();
  }

  //now this mehtod will call under the ngOnInit
  getHeroes():void{
    this.heroes = this.heroService.getHeroes();//method of hero-service.ts
  }
  /*
  The HeroService.getHeroes() method has a 
  synchronous signature, which implies that the 
  HeroService can fetch heroes synchronously. 
  The HeroesComponent consumes the getHeroes()
   result as if heroes could be fetched synchronously.
   now because the service currently returns mock heroes,
   and this is not remote server data
   */

// The HeroService.getHeroes method used to return a Hero[]. Now it returns an Observable<Hero[]>.
  /*getHeroes():void {
    this.heroService.getHeroes()
    .subscribe(heroes => this.heroes = heroes);
  }*/

  /**
  The previous version assigns an array of 
  heroes to the component's heroes property. 
  The assignment occurs synchronously, 
  as if the server could return heroes instantly
   or the browser could freeze the UI while it 
   waited for the server's response.
  =======================
  The new version waits for the Observable 
  to emit the array of heroes— which could
   happen now or several minutes from now.
    Then subscribe passes the emitted array
     to the callback, which sets the component's
      heroes property.
  This asynchronous approach will work when the HeroService requests heroes from the server.



  */

  onSelect(hero: Hero){
  this.selectedHero = hero;//so under the array hr will be equivalent to one hero(selectedHero)
	}


  test1(){
    this.messageservice.test('Hello i am comming from message service');
  }
  /*this is my on promise object*/
  usePromise(){
    var p1 = this.promiseObject.getPromise1()
    p1.then(function(response){
        console.log(response);
    }).catch(function(error){
      console.log(error);
    })
  }
/*this is fatch api */
  useFetchPromise(){
    let p = this.promiseObject.fatchGet();
    p.then(function(response){
      return response.json();
    }).then( function(data) {
      console.log(data);
    }).catch(function(error){
      console.log(error);
    })
  }

 /*this is ajax jquery*/

  useAjaxPromise(){
    let p = this.promiseObject.loadTasks();
    p.then(function(response){
      console.log(response);
    }).catch(function(error){
      console.log(error);
    })
  }

  /*saveTask*/
  createTaskInComponent(){
    let task = {id:1,name:'Buy vegitable'};
    let p = this.promiseObject.saveTask(task);
    p.then(function(response){

    })
  }
}

