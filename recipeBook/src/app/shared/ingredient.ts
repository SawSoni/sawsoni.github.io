/*export class Ingredient {
	public name: string;
	public amount: number;

	constructor(name: string, amount: number){
		this.name = name;
		this.amount = amount;
	}
}*/

// or with type scripe we can create class like below shortcut

export class Ingredient {
	constructor(public name: string, public amount: number){

	}
}
