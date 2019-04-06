/*to Create this file Using the Angular CLI, 
create a service called hero.(ng generate service hero)this is the command*/
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
/*
HeroService.getHeroes() will return an Observable
 in part because it will eventually use the Angular
 HttpClient.get method to fetch the heroes 
 and HttpClient.get() returns an Observable.
 Angular's HttpClient methods return RxJS Observables. 
 you'll simulate getting data from the server with the RxJS of() function.
AFTER IMPORTING THIS WE WILL UPDATE THE getHeroes()

*/
import { MessageService } from './message.service';
import { Hero } from './hero';
import { HEROES } from './mockheroes';

/*A provider is something that can create or deliver a service; 
in this case, it instantiates the HeroService class to provide the service.

Now, you need to make sure that the HeroService is registered as the 
provider of this service. You are registering it with an injector,
 which is the object that is 
responsible for choosing and injecting the provider where it is required.*/

/*registers a provider with the root injector for your service by including provider
 metadata in the @Injectable decorator.
 */

 /*When you provide the service at the root level, Angular 
 creates a single, shared instance of HeroService and injects 
 into any class that asks for it. Registering the provider in the
  @Injectable metadata also allows Angular to optimize an 
 app by removing the service if it turns out not to be used after all.*/

@Injectable({
  providedIn: 'root'
})

/*The HeroService is now ready to plug into the HeroesComponent.*/
export class HeroService {
/* This declares a private messageService property. Angular will inject the singleton MessageService into that property when it creates the HeroService.
This is a typical "service-in-service" scenario: you inject the MessageService into the HeroService which is injected into the HeroesComponent
*/
  

  constructor() { }
  // constructor(private messageService: MessageService) { }
  /*
  Add a getHeroes method to return the mock heroes.
  */
  /*getHeroes():Hero[] {
    console.log(HEROES);
  	return HEROES;
  }*/
  //Replace the getHeroes method with this one.
    getHeroes(): Observable<Hero[]> {
      return of(HEROES);
    }
  
  /*update getHeroes()*/

  /*getHeroes():Observable<Hero[]>{
	 //TODO: send the message _after_ fetching the heroes
  	this.messageService.add('HeroService: fetched heroes');//send a message when the heroes are fetched.
  	return of(HEROES);
  	//of(HEROES) returns an Observable<Hero[]> that emits a single value, the array of mock heroes.
  }*/
  /*The HeroService.getHeroes method used to return a Hero[]. Now it returns an Observable<Hero[]>.*/

}
