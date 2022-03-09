import Note from "./typings/Note";
import StringifiedNote from "./typings/StringifiedNote";

export const loadFromLocalStorage = (): Note[] => {
    let initialNotes: Note[] = [];

    const storedNotes = localStorage.getItem("notes");

    if (storedNotes !== null) {
        const parsedNotes: StringifiedNote[] = JSON.parse(storedNotes);
        parsedNotes.forEach((note) =>
            initialNotes.push({
                id: note.id,
                body: note.body,
                isMarkdown: note.isMarkdown || false,
                createdAt: new Date(note.createdAt),
            })
        );
    }

    return initialNotes;
};

export const saveToLocalStorage = (notes: Note[]) => {
    localStorage.setItem("notes", JSON.stringify(notes));
};
