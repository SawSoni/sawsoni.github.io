/*This component simply receives a hero object through its hero property and displays it.
*/
import { Component, OnInit, Input } from '@angular/core';
import { Hero } from '../hero';

@Component({
  selector: 'app-hero-detail',
  templateUrl: './hero-detail.component.html',
  styleUrls: ['./hero-detail.component.css']
})



export class HeroDetailComponent implements OnInit {
	/*Decorator that marks a class field as an input property and
	 supplies configuration metadata. Declares a data-bound input property,
	 which Angular automatically updates during change detection.*/
	 
	 /*You used the @Input decorator to make the hero property available for 
	 binding by the external HeroesComponent.*/

	@Input()
	hero: Hero;
	/*The hero property must be an Input property, annotated with the @Input() decorator,
	 because the external HeroesComponent will bind to it .*/

  constructor() { }

  ngOnInit() {
  }

}
