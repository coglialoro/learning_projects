import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";

import { AppComponent } from "./components/app/app.component";
import { RemainingTimePipe } from "./pipes/remaining-time.pipe";
import { AddEventComponent } from "./components/add-event/add-event.component";
import { ReactiveFormsModule } from "@angular/forms";
import { EventItemComponent } from './components/event-item/event-item.component';
import { EventsListComponent } from './components/events-list/events-list.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

@NgModule({
    declarations: [AppComponent, RemainingTimePipe, AddEventComponent, EventItemComponent, EventsListComponent],
    imports: [BrowserModule, ReactiveFormsModule, FontAwesomeModule],
    providers: [],
    bootstrap: [AppComponent],
})
export class AppModule {}
