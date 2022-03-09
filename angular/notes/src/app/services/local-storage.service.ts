import { Injectable } from "@angular/core";

@Injectable({
    providedIn: "root",
})
export class LocalStorageService {
    constructor() {}

    getItem<T>(key: string): T | null {
        const dataStr = window.localStorage.getItem(key);
        if (dataStr) {
            return JSON.parse(dataStr) as T;
        }
        return null;
    }

    setItem<T>(key: string, value: T): void {
        window.localStorage.setItem(key, JSON.stringify(value));
    }
}
