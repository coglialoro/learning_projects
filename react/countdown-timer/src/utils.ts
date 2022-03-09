import { Time } from "./Time";

export const getRemainingTime = (date: Date): Time => {
    let remainingTime = date.getTime() - Date.now();
    remainingTime = Math.floor(remainingTime / 1000);
    const days = Math.floor(remainingTime / 86400);
    remainingTime = remainingTime % 86400;
    const hours = Math.floor(remainingTime / 3600);
    remainingTime = remainingTime % 3600;
    const minutes = Math.floor(remainingTime / 60);
    const seconds = remainingTime % 60;
    return { days, hours, minutes, seconds };
};

export const getTimeString = (time: Time): string => {
    const { days, hours, minutes, seconds } = time;
    const a = [];
    if (days > 0) {
        a.push("" + days + " day" + (days > 1 ? "s" : ""));
    }

    if (hours > 0) {
        a.push("" + hours + " hour" + (hours > 1 ? "s" : ""));
    }

    if (minutes > 0) {
        a.push("" + minutes + " minute" + (minutes > 1 ? "s" : ""));
    }

    if (seconds > 0) {
        a.push("" + seconds + " second" + (seconds > 1 ? "s" : ""));
    }

    return a.join(", ");
};

export const isZero = (time: Time): boolean =>
    time.seconds === 0 &&
    time.minutes === 0 &&
    time.hours === 0 &&
    time.days === 0;
