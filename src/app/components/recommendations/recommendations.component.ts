import { Component, OnInit } from '@angular/core';
import { MealService } from '../../services/meal.service';
import { MenuItem } from '../../models/menu-item.model'; // Create this model as needed

@Component({
  selector: 'app-recommendations',
  templateUrl: './recommendations.component.html',
  styleUrls: ['./recommendations.component.css'],
})
export class RecommendationsComponent implements OnInit {
  cuisineType: string = '';
  city: string = '';
  recipes: MenuItem[] = [];

  constructor(private mealService: MealService) {}

  ngOnInit(): void {}

  fetchHealthyRecipes() {
    this.mealService.getHealthyRecipes(this.cuisineType, this.city).subscribe((data) => {
      this.recipes = data;
    });
  }
}
