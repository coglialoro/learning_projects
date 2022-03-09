import { Component, EventEmitter, OnInit, Output } from "@angular/core";
import { Note } from "src/app/typings";

@Component({
    selector: "app-create-note",
    templateUrl: "./create-note.component.html",
    styleUrls: ["./create-note.component.css"],
})
export class CreateNoteComponent implements OnInit {
    text: string = "";
    isMarkdown: boolean = false;
    @Output() createdNote: EventEmitter<Omit<Note, "id" | "created">> =
        new EventEmitter();

    constructor() {}

    ngOnInit(): void {}

    onSave(): void {
        if (this.text) {
            this.createdNote.emit({
                text: this.text,
                isMarkdown: this.isMarkdown,
            });
            this.text = "";
            this.isMarkdown = false;
        }
    }
}
