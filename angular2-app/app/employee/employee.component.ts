import { Component} from '@angular/core';

@Component({
	
	selector: 'my-employee',
	templateUrl: `app/employee/employee.component.html`,
	styleUrls : ['app/employee/employee.component.css']
})
export class EmployeeComponent {
	firstName: string = 'soni';
	lastName: string = 'saw';
	gender: string = 'Female';
	age : number = 30;

	isDisabled : boolean = false;
}