import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { GameComponent } from './game/game.component';
import { HomeComponent } from './home/home.component';
import { RankingComponent } from './ranking/ranking.component';
import { NavComponent } from './nav/nav.component';
import { LoginComponent } from './login/login.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RegistrarseComponent } from './registrarse/registrarse.component';
import { ComojugarComponent } from './comojugar/comojugar.component';

const appRoutes:Routes=[
  {path:'',component:HomeComponent},
  {path:'game',component:GameComponent},
  {path:'ranking',component:RankingComponent},
  {path:'iniciarsesion',component:LoginComponent},
  {path:'registrarse',component:RegistrarseComponent},
  {path:'comojugar',component:ComojugarComponent},
]

@NgModule({
  declarations: [
    AppComponent,
    GameComponent,
    HomeComponent,
    RankingComponent,
    NavComponent,
    LoginComponent,
    RegistrarseComponent,
    ComojugarComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(appRoutes),
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
