import { Injectable } from '@angular/core';
import { ServicesModule } from './services.module';
import { HttpClient } from '@angular/common/http';
import gql from 'graphql-tag';
import { Apollo } from 'apollo-angular';
import { Person } from 'src/app/shared/api';
import { PersonsQuery } from 'src/app/shared/graphql';

@Injectable({
    providedIn: ServicesModule
})
export class DemoService {

    constructor(private apollo: Apollo) { }

    public async getAllPersons(): Promise<Person[]> {

        interface IPersonResult { persons: Person[] };

        return this.apollo.query<IPersonResult>({
            query: PersonsQuery,
            fetchPolicy: 'network-only'
        })
        .toPromise()
        .then(({ data }) => {
            if (data == null) {
                return null;
            }
            return data.persons;
        });
    }
}
