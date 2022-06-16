import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComojugarComponent } from './comojugar.component';

describe('ComojugarComponent', () => {
  let component: ComojugarComponent;
  let fixture: ComponentFixture<ComojugarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ComojugarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ComojugarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
