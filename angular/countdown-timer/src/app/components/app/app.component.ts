import { Component, OnInit } from "@angular/core";
import { CountdownEventService } from "src/app/services/countdown-event.service";
import { CountDownEvent } from "src/app/typings";

@Component({
    selector: "app-root",
    templateUrl: "./app.component.html",
    styleUrls: ["./app.component.css"],
})
export class AppComponent implements OnInit {
    events: CountDownEvent[] = [];

    constructor(private eventService: CountdownEventService) {}

    ngOnInit(): void {
        this.eventService
            .getEvents()
            .subscribe((events) => (this.events = events));
    }

    handleAddEvent(event: Omit<CountDownEvent, "id">): void {
        this.eventService.addEvent(event.name, event.time);
    }

    handleDeleteEvent(id: string): void {
        this.eventService.removeEvent(id);
    }
}
