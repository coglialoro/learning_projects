import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { BrowserModule } from "@angular/platform-browser";

import { AppComponent } from "./app.component";
import { NoteItemComponent } from "./components/note-item/note-item.component";
import { MarkedPipe } from './pipes/marked.pipe';
import { CreateNoteComponent } from './components/create-note/create-note.component';

@NgModule({
    declarations: [AppComponent, NoteItemComponent, MarkedPipe, CreateNoteComponent],
    imports: [BrowserModule, FormsModule],
    providers: [],
    bootstrap: [AppComponent],
})
export class AppModule {}
