import { Component, OnInit } from '@angular/core';
import { Recipe } from  '../recipe.model';
@Component({
  selector: 'app-recipe-list',
  templateUrl: './recipe-list.component.html',
  styleUrls: ['./recipe-list.component.css']
})
export class RecipeListComponent implements OnInit {
	recipes: Recipe[] = [
		new Recipe('A Test Recipe','This is a simpal test','https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971556_1280.jpg'),
		new Recipe('A Test Recipe','This is a simpal test','https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971556_1280.jpg')
	];// this Recipe will be our model which we created this the way to inform type script create recipe like my model and it will be an array
  constructor() { }

  ngOnInit() {
  }

}
