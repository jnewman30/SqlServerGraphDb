import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ForceDirectedGraphModule } from '@swimlane/ngx-charts';

import {
    MatCommonModule,
    MatIconModule,
    MatButtonModule,
    MatCardModule,
    MatListModule
} from '@angular/material';

import { LayoutModule } from 'src/app/shared/modules/layout';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';

@NgModule({
    imports: [
        CommonModule,
        HomeRoutingModule,
        LayoutModule,
        ForceDirectedGraphModule,

        /* Angular Material */
        MatCommonModule,
        MatIconModule,
        MatButtonModule,
        MatCardModule,
        MatListModule
    ],
    declarations: [HomeComponent],
    exports: [HomeComponent]
})
export class HomeModule { }
