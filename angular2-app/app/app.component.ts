import {Component } from "@angular/core";
 
 @Component({
 	selector:'my-app',
 	template : `<div>
 					<h1>{{pageHeader}}</h1>
 					<h2>{{getFullName()}}</h2>
 					
 					<my-employee></my-employee>
 				<div>`
 })
export class AppComponent {
	pageHeader: string = 'Employee Details';
	// imagePath : string = '../images/student_logo_small.png';
	firstName : string = 'Soni';
	lastName : string = 'Saw';

	getFullName(): string {
		return this.firstName +' '+ this.lastName;
	}
}
