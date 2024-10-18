import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MenuItem } from '../models/menu-item.model'; 

@Injectable({
  providedIn: 'root',
})
export class MealService {
  private baseUrl = 'http://localhost:8080'; // Change to your backend URL

  constructor(private http: HttpClient) {}

  getHealthyRecipes(cuisineType: string, city: string): Observable<MenuItem[]> {
    return this.http.get<MenuItem[]>(`${this.baseUrl}/api/healthy-recipes?cuisineType=${cuisineType}&city=${city}`);
  }
}
