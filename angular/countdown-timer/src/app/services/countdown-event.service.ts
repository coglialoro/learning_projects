import { Injectable } from "@angular/core";
import { v4 as uuid } from "uuid";
import { StorageService } from "./storage.service";

import { CountDownEvent } from "../typings";
import { Observable, of } from "rxjs";

@Injectable({
    providedIn: "root",
})
export class CountdownEventService {
    private key: string = "countdown-events";
    countDownEvents: CountDownEvent[];

    constructor(private storageService: StorageService) {
        this.countDownEvents = storageService.getItem(this.key) || [];
    }

    private saveToLocalStorage(): void {
        this.storageService.setItem(this.key, this.countDownEvents);
    }

    getEvents(): Observable<CountDownEvent[]> {
        return of(this.countDownEvents);
    }

    addEvent(name: string, time: number): void {
        this.countDownEvents.push({ id: uuid(), name, time });
        this.saveToLocalStorage();
    }

    removeEvent(id: string) {
        const index = this.countDownEvents.findIndex(
            (event) => event.id === id
        );
        this.countDownEvents.splice(index, 1);
        this.saveToLocalStorage();
    }
}
