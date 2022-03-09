import React, { useEffect, useState } from "react";
import Note from "./typings/Note";
import {
    loadFromLocalStorage,
    saveToLocalStorage,
} from "./local-storage-utils";
import { nanoid } from "nanoid";
import AddNote from "./AddNote";
import NoteElement from "./NoteElement";


const App: React.VFC = () => {
    const [notes, setNotes] = useState<Note[]>(loadFromLocalStorage());

    useEffect(() => {
        saveToLocalStorage(notes);
    }, [notes]);

    const addNote = (body: string, isMarkdown: boolean) => {
        setNotes((currentNotes) => [
            ...currentNotes,
            { id: nanoid(), body, isMarkdown, createdAt: new Date() },
        ]);
    }
        
    const deleteNote = (id: string) =>
        setNotes((currentNotes) =>
            currentNotes.filter((note) => note.id !== id)
        );

    const editNote = (id: string, body: string) =>
        setNotes((currentNotes) =>
            currentNotes.map((note) =>
                note.id === id ? { ...note, body } : note
            )
        );

    return (
        <div>
            <AddNote addNote={addNote} />
            <div>
                {notes.length === 0 ? (
                    <h3>No notes yet</h3>
                ) : (
                    notes.map((note) => (
                        <NoteElement
                            key={note.id}
                            note={note}
                            editNote={editNote}
                            deleteNote={deleteNote}
                        />
                    ))
                )}
            </div>
        </div>
    );
};

export default App;
