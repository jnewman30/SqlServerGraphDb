import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LayoutComponent } from './layout.component';

import {
    MatCommonModule,
    MatToolbarModule,
    MatButtonModule,
    MatIconModule
} from '@angular/material';

@NgModule({
    imports: [
        CommonModule,

        /* Angular Material */
        MatCommonModule,
        MatToolbarModule,
        MatButtonModule,
        MatIconModule
    ],
    declarations: [LayoutComponent],
    exports: [LayoutComponent]
})
export class LayoutModule { }
