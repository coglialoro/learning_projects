import { Component, EventEmitter, Input, OnInit, Output } from "@angular/core";
import { CountDownEvent } from "src/app/typings";

@Component({
    selector: "app-events-list",
    templateUrl: "./events-list.component.html",
    styleUrls: ["./events-list.component.css"],
})
export class EventsListComponent implements OnInit {
    @Input() events: CountDownEvent[] = [];
    @Output() eventDeleted: EventEmitter<string> = new EventEmitter();

    constructor() {}

    ngOnInit(): void {}

    onEventDeleted(id: string): void {
        this.eventDeleted.emit(id);
    }
}
