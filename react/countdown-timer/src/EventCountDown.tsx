import React from "react";
import { CDEvent } from "./CDEvent";
import CountDown from "./CountDown";

interface EventCountDownProps {
    event: CDEvent;
    removeEvent: () => void;
}

const EventCountDown: React.VFC<EventCountDownProps> = ({
    event,
    removeEvent,
}) => (
    <div className="countdown-event">
        <h3>{event.name}</h3>
        <CountDown date={event.date} />
        <button onClick={() => removeEvent()}>X</button>
    </div>
);

export default EventCountDown;
