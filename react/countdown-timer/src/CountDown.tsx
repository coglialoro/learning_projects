import React, { useEffect, useState } from "react";
import { getRemainingTime, getTimeString, isZero } from "./utils";
import { Time } from "./Time";

interface CountDownProps {
    date: Date;
}

const CountDown: React.VFC<CountDownProps> = ({ date }) => {
    const [time, setTime] = useState<Time>(getRemainingTime(date));

    useEffect(() => {
        const interval = setInterval(() => {
            setTime(getRemainingTime(date));
        }, 1000);
        return () => clearInterval(interval);
    }, [date]);

    useEffect(() => {
        if (isZero(time)) {
            alert("Event reached");
        }
    }, [time]);

    return <p className="countdown">{getTimeString(time)}</p>;
};

export default CountDown;
