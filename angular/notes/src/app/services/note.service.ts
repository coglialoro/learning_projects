import { Injectable } from "@angular/core";
import { LocalStorageService } from "./local-storage.service";
import { v4 as uuid } from "uuid";
import { Note } from "../typings";
import { Observable, of } from "rxjs";

@Injectable({
    providedIn: "root",
})
export class NoteService {
    private key = "notes";
    notes: Note[] = [];

    constructor(private storageService: LocalStorageService) {
        this.notes = storageService.getItem(this.key) ?? [];
    }

    getNotes(): Observable<Note[]> {
        return of(this.notes);
    }

    addNote(note: Omit<Note, "id" | "created">): void {
        this.notes.push({ ...note, id: uuid(), created: Date.now() });
        this.storageService.setItem(this.key, this.notes);
    }

    editNote(note: Note): void {
        const index = this.notes.findIndex((n) => n.id === note.id);
        this.notes[index] = note;
        this.storageService.setItem(this.key, this.notes);
    }

    deleteNote(note: Note): void {
        const index = this.notes.findIndex((n) => n.id === note.id);
        this.notes.splice(index, 1);
        this.storageService.setItem(this.key, this.notes);
    }
}
