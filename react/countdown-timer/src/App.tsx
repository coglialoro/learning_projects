import React, { useEffect, useState } from "react";
import NewEvent from "./NewEvent";
import EventCountDown from "./EventCountDown";
import { setInterval } from "timers";
import { CDEvent, ParsedCDEvent } from "./CDEvent";

const App: React.VFC = () => {
    let initialEvents: CDEvent[] = [];

    const lsEvents = localStorage.getItem("events");

    if (lsEvents !== null) {
        const parsedJSON: ParsedCDEvent[] = JSON.parse(lsEvents);
        initialEvents = parsedJSON.map((event) => ({
            name: event.name,
            date: new Date(event.date),
        }));
    }

    const [events, setEvents] = useState<CDEvent[]>(initialEvents);

    useEffect(() => {
        const interval = setInterval(() => {
            localStorage.setItem("events", JSON.stringify(events));
        }, 5000);
        return () => clearInterval(interval);
    }, [events]);

    const addEvent = (event: CDEvent) =>
        setEvents((currentEvents) => [...currentEvents, event]);

    const removeEvent = (index: number) =>
        setEvents((currentEvents) => [
            ...currentEvents.slice(0, index),
            ...currentEvents.slice(index + 1),
        ]);

    return (
        <div className="app">
            <NewEvent addEvent={addEvent} />
            {events.map((event, index) => (
                <EventCountDown
                    key={index}
                    event={event}
                    removeEvent={() => removeEvent(index)}
                />
            ))}
        </div>
    );
};

export default App;
