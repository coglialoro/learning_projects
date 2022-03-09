import { Component, EventEmitter, Input, OnInit, Output } from "@angular/core";
import { Note } from "src/app/typings";

@Component({
    selector: "app-note-item",
    templateUrl: "./note-item.component.html",
    styleUrls: ["./note-item.component.css"],
})
export class NoteItemComponent implements OnInit {
    @Input() note?: Note;
    @Output() deletedNote: EventEmitter<Note> = new EventEmitter();
    @Output() editedNote: EventEmitter<Note> = new EventEmitter();
    isEditing: boolean = false;
    text: string = "";
    isMarkdown: boolean = false;

    constructor() {}

    ngOnInit(): void {}

    onDelete(): void {
        this.deletedNote.emit(this.note);
    }

    onEdit(): void {
        this.isEditing = true;
        this.text = this.note?.text || "";
        this.isMarkdown = this.note?.isMarkdown || false;
    }

    onSave(): void {
        if (this.note && this.text) {
            this.editedNote.emit({
                ...this.note,
                text: this.text,
                isMarkdown: this.isMarkdown,
            });
            this.isEditing = false;
        }
    }
}
