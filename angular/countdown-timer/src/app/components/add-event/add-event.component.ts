import { Component, OnInit, Output, EventEmitter } from "@angular/core";
import { FormControl, FormGroup, Validators } from "@angular/forms";
import { CountDownEvent } from "../../typings";

@Component({
    selector: "app-add-event",
    templateUrl: "./add-event.component.html",
    styleUrls: ["./add-event.component.css"],
})
export class AddEventComponent implements OnInit {
    addEventForm: FormGroup = new FormGroup({
        name: new FormControl("", Validators.required),
        time: new FormControl("", Validators.required),
    });

    @Output() eventAdded: EventEmitter<Omit<CountDownEvent, "id">> =
        new EventEmitter();

    constructor() {}

    ngOnInit(): void {}

    onSubmit(): void {
        if (this.addEventForm.valid) {
            const { name, time } = this.addEventForm.value;
            this.eventAdded.emit({ name, time: Date.parse(time) });
            this.addEventForm.reset();
        }
    }
}
