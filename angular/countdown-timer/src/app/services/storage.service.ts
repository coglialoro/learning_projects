import { Injectable } from "@angular/core";

@Injectable({
    providedIn: "root",
})
export class StorageService {
    localStorage?: Storage;

    constructor() {
        this.localStorage = window.localStorage;
    }

    getItem<T>(key: string): T | null {
        const data = this.localStorage?.getItem(key);
        if (data) {
            return JSON.parse(data) as T;
        } else {
            return null;
        }
    }

    setItem<T>(key: string, data: T): void {
        this.localStorage?.setItem(key, JSON.stringify(data));
    }
}
