import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {
    MatCommonModule,
    MatIconModule,
    MatButtonModule
} from '@angular/material';

import { LayoutModule } from 'src/app/shared/modules/layout';

import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';

@NgModule({
    imports: [
        CommonModule,
        HomeRoutingModule,
        LayoutModule,

        /* Angular Material */
        MatCommonModule,
        MatIconModule,
        MatButtonModule
    ],
    declarations: [HomeComponent],
    exports: [HomeComponent]
})
export class HomeModule { }
