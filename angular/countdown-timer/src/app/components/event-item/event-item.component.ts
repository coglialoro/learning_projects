import {
    Component,
    Input,
    OnInit,
    Output,
    EventEmitter,
    OnDestroy,
} from "@angular/core";
import { CountDownEvent } from "src/app/typings";
import { faTrash } from "@fortawesome/free-solid-svg-icons";

@Component({
    selector: "app-event-item",
    templateUrl: "./event-item.component.html",
    styleUrls: ["./event-item.component.css"],
})
export class EventItemComponent implements OnInit, OnDestroy {
    @Input() event?: CountDownEvent;
    @Output() eventDeleted: EventEmitter<string> = new EventEmitter();
    deleteIcon = faTrash;
    intervalId: number = 0;
    now: number = Date.now();

    constructor() {}

    ngOnInit(): void {
        this.intervalId = window.setInterval(() => {
            this.now = Date.now();
        }, 1000);
    }

    ngOnDestroy(): void {
        window.clearInterval(this.intervalId);
    }

    onDelete() {
        this.eventDeleted.emit(this.event?.id);
    }
}
