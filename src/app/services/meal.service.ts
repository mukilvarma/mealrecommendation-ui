import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MenuItem } from '../models/menu-item.model'; 
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class MealService {
  private baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  getHealthyRecipes(cuisineType: string, city: string): Observable<MenuItem[]> {
    return this.http.get<MenuItem[]>(`${this.baseUrl}/api/healthy-recipes?cuisineType=${cuisineType}&city=${city}`);
  }
}
