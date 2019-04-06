import { Component, OnInit } from '@angular/core';
import $ from 'jquery';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
	relative:string = 'relative';
	absolute:string = 'absolute';
	relDiv = '';
  constructor() { }

  ngOnInit() {


  }
  /*this the way if we donot have to give parent fix width and absolute the child */
  relativeParent(containerSelector){
  	var maxX = $(containerSelector).width;
  	var maxY = $(containerSelector).height;

  	$(containerSelector).children().each(function(i){
  		if(maxX < parseInt($(this).css('left')) + $(this).width()){
  			maxX = parseInt($(this).css('left')) + $(this).width();
  		}

  		if(maxY < parseInt($(this).css('top')) + $(this).height()){
  			maxY = parseInt($(this).css('top')) + $(this).height();

  		}
  	});

  	return {
  		'width':maxX,
  		'height':maxY
  	}	
  }
/*
  	this.relDiv = this.relativeParent(this.relative);
  	this.relDiv.width(this.relDiv.width);
  	this.relDiv.height(this.relDiv.height);*/
}
