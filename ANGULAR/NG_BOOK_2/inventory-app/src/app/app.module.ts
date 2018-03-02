import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { PriceDisplayComponent } from './price-display/price-display.component';
import { ProductDepartmentComponent } from './product-department/product-department.component';


@NgModule({
  declarations: [
    AppComponent,
    PriceDisplayComponent,
    ProductDepartmentComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
