import { Component, OnInit } from "@angular/core";
import { NoteService } from "./services/note.service";
import { Note } from "./typings";

@Component({
    selector: "app-root",
    templateUrl: "./app.component.html",
    styleUrls: ["./app.component.css"],
})
export class AppComponent implements OnInit {
    notes: Note[] = [];

    constructor(private noteService: NoteService) {}

    ngOnInit(): void {
        this.noteService.getNotes().subscribe((notes) => (this.notes = notes));
    }

    addNote(note: Omit<Note, "id" | "created">): void {
        this.noteService.addNote(note);
    }

    editNote(note: Note): void {
        this.noteService.editNote(note);
    }

    deleteNote(note: Note): void {
        this.noteService.deleteNote(note);
    }
}
