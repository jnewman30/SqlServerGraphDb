import { Component, OnInit } from '@angular/core';
import { DemoService } from 'src/app/shared/modules/services';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

    data: any[] = [];

    constructor(private demoService: DemoService) { }

    ngOnInit() {
        this.demoService.getAllPersons().then(console.log);
    }

}
