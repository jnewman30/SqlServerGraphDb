import { LivesIn } from "./lives-in";

export class Person {
    id: number;
    name: string;
    livesIn: LivesIn[];
    friendOf: Person[];
}
