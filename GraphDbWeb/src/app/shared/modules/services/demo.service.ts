import { Injectable } from '@angular/core';
import { ServicesModule } from './services.module';
import { HttpClient } from '@angular/common/http';
import gql from 'graphql-tag';
import { Apollo } from 'apollo-angular';

@Injectable({
  providedIn: ServicesModule
})
export class DemoService {

  constructor(private apollo: Apollo) { }

  public getAllPersons(): Promise<any> {
    return this.apollo.query({
      query: gql`
      {
        persons {
          id
          name
          livesIn {
            id
            name
            stateName
          }
          friendOf {
            id
            name
            livesIn {
              id
              name
              stateName
            }
          }
        }
      }
      `,
    }).toPromise();
  }
}
