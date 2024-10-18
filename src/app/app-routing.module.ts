import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RecommendationsComponent } from './components/recommendations/recommendations.component';

const routes: Routes = [
  { path: '', redirectTo: '/recommendations', pathMatch: 'full' }, // Default route
  { path: 'recommendations', component: RecommendationsComponent }, // Route to RecommendationsComponent
  // Add other routes here if needed
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
