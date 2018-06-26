import { Component, OnInit, AfterViewInit } from '@angular/core';
import { DemoService } from 'src/app/shared/modules/services';
import { Person } from 'src/app/shared/api';
import { colorSets } from '@swimlane/ngx-charts/release/utils';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, AfterViewInit {

    visible: boolean = false;
    view = [];
    colorScheme = colorSets[8];

    graph: any = { 
        nodes: [],
        links: []        
    };

    constructor(private demoService: DemoService) { }

    ngOnInit(): void {
    }

    ngAfterViewInit(): void {
        this.loadPeople();        
    }

    async loadPeople(): Promise<void> {
        let persons = await this.demoService.getAllPersons();

        for(let person of persons) {
            this.graph.nodes.push({...person, value: person.name });
        }

        for(let node of this.graph.nodes) {
            this.addNodeLinks(node);
        }

        console.log('Graph', this.graph);
        this.view = [800, 600];
        this.visible = true;
    }

    private addNodeLinks(person: Person): void {
        if(person.friendOf == null) {
            return;
        }

        for(let friend of person.friendOf) {
            this.graph.links.push({
                source: person,
                target: this.graph.nodes.find(n => n.id == friend.id),
            });
            this.addNodeLinks(friend);
        }      
    }

    selectNode(event: any): void {
        console.log('Select Event', event);
    }
}
