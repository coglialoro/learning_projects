import React, { useState } from "react";

export interface AddNoteProps {
    addNote: (body: string, isMarkdown: boolean) => void;
}

const AddNote: React.VFC<AddNoteProps> = ({ addNote }) => {
    const [body, setBody] = useState<string>("");

    const onAddHandler = (e: React.MouseEvent<HTMLButtonElement>) => {
        e.preventDefault();
        if (body !== "") {
            addNote(body, false);
            setBody("");
        }
    };

    const onAddMarkdownHandler = (e: React.MouseEvent<HTMLButtonElement>) => {
        e.preventDefault();
        if (body !== "") {
            addNote(body, true);
            setBody("");
        }
    };

    return (
        <form>
            <textarea
                value={body}
                onChange={(e) => setBody(e.target.value)}
                placeholder="Type your note here..."
                rows={10}
                cols={50}
                style={{ resize: "none" }}
            />
            <button onClick={onAddHandler}>Add</button>
            <button onClick={onAddMarkdownHandler}>Add with markdown</button>
        </form>
    );
};

export default AddNote;
