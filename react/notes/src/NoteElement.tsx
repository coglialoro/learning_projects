import marked from "marked";
import React, { useState } from "react";
import Note from "./typings/Note";

interface NoteElementProps {
    note: Note;
    editNote: (id: string, body: string) => void;
    deleteNote: (id: string) => void;
}

const NoteElement: React.VFC<NoteElementProps> = ({ note, editNote, deleteNote }) => {
    
    const [isEditMode, setIsEditMode] = useState<boolean>(false);
    const [body, setBody] = useState<string>(note.body);

    const onSaveEditHandler = () => {
        if(body !== ""){
            editNote(note.id, body);
            setIsEditMode(false);
        }
    }

    return (
        <>
            {
                isEditMode ? 
                (<div>
                    <textarea
                        value={body}
                        onChange={(e) => setBody(e.target.value)}
                        rows={10}
                        cols={50}
                        style={{resize: "none"}}
                    />
                    <button onClick={onSaveEditHandler}>Save</button>
                    <button onClick={() => setIsEditMode(false)}>Cancel</button>
                </div>) :
                (
                    <>
                        {note.isMarkdown ? (<div>
                    <p dangerouslySetInnerHTML={{__html:marked(note.body)}}></p>
                    <p>{note.createdAt.toLocaleString()}</p>
                    <button onClick={() => setIsEditMode(true)}>Edit</button>
                    <button onClick={() => deleteNote(note.id)}>Delete</button>
                </div>) : (<div>
                    <p>{note.body}</p>
                    <p>{note.createdAt.toLocaleString()}</p>
                    <button onClick={() => setIsEditMode(true)}>Edit</button>
                    <button onClick={() => deleteNote(note.id)}>Delete</button>
                </div>)}
                    </>
                )
            }
        </>
    );


}

export default NoteElement;
