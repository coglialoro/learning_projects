import { Pipe, PipeTransform } from "@angular/core";

@Pipe({
    name: "remainingTime",
})
export class RemainingTimePipe implements PipeTransform {
    transform(value: number, now: number): string {
        let remaining = value - now;
        if (remaining <= 0) {
            return "Event is passed";
        }

        remaining = Math.floor(remaining / 1000); // milliseconds => seconds
        // seconds in a year = 365 * 24 * 3600 = 31536000
        const years = Math.floor(remaining / 31536000);
        remaining -= years * 31536000;

        // seconds in a month = 30* 24* 3600 = 2592000
        const months = Math.floor(remaining / 2592000);
        remaining -= months * 2592000;

        // seconds in a day = 24 * 3600 = 86400
        const days = Math.floor(remaining / 86400);
        remaining -= days * 86400;

        // seconds in a hour = 3600
        const hours = Math.floor(remaining / 3600);
        remaining -= hours * 3600;

        // seconds in a minute = 60
        const minutes = Math.floor(remaining / 60);
        remaining -= minutes * 60;

        const seconds = remaining;

        const strings = [];

        if (years) {
            strings.push(`${years} years`);
        }
        if (months) {
            strings.push(`${months} months`);
        }
        if (days) {
            strings.push(`${days} days`);
        }
        if (hours) {
            strings.push(`${hours} hours`);
        }
        if (minutes) {
            strings.push(`${minutes} minutes`);
        }
        if (seconds) {
            strings.push(`${seconds} seconds`);
        }

        return strings.join(", ");
    }
}
