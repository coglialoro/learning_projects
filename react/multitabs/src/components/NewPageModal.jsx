import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { addPageAction } from "../state/pages/actions";

const NewPageModal = ({ hideModal }) => {
	const [url, setUrl] = useState("");
	const [title, setTitle] = useState("");

	const dispatch = useDispatch();

	const addPage = (e) => {
		e.preventDefault();
		dispatch(addPageAction(url, title));
		hideModal();
	};

	const onUrlChange = (e) => setUrl(e.target.value);

	const onTitleChange = (e) => setTitle(e.target.value);

	return (
		<form className="modal" onSubmit={addPage}>
			<label htmlFor="url">Url</label>
			<input type="text" name="url" value={url} onChange={onUrlChange} />
			<label htmlFor="title">Title</label>
			<input type="text" name="title" value={title} onChange={onTitleChange} />
			<button type="submit">Add Page</button>
			<button
				type="button"
				onClick={() => {
					hideModal();
				}}
			>
				Close
			</button>
		</form>
	);
};

export default NewPageModal;
