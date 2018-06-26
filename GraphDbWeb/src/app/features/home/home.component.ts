import { Component, OnInit } from '@angular/core';
import { DemoService } from 'src/app/shared/modules/services';
import { Person } from 'src/app/shared/api';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

    persons: Person[] = [];

    constructor(private demoService: DemoService) { }

    async ngOnInit(): Promise<void> {
        let persons = await this.demoService.getAllPersons();
        console.log(persons);
    }
}
