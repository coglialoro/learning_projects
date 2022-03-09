export const ADD_PAGE = "ADD_PAGE";
export const DELETE_PAGE = "DELETE_PAGE";
export const SET_PAGE_SIZE = "SET_PAGE_SIZE";
export const SET_PAGE_POSITION = "SET_PAGE_POSITION";
export const SET_PAGE_TITLE = "SET_PAGE_TITLE";

export const addPageAction = (url, title) => {
	return {
		type: ADD_PAGE,
		payload: {
			url,
			title,
		},
	};
};

export const deletePageAction = (id) => {
	return {
		type: DELETE_PAGE,
		payload: {
			id,
		},
	};
};

export const setPageSizeAction = (id, width, height) => {
	return {
		type: SET_PAGE_SIZE,
		payload: {
			id,
			width,
			height,
		},
	};
};

export const setPagePositionAction = (id, top, left) => {
	return {
		type: SET_PAGE_POSITION,
		payload: {
			id,
			top,
			left,
		},
	};
};

export const setPageTitleAction = (id, title) => {
	return {
		type: SET_PAGE_TITLE,
		payload: {
			id,
			title,
		},
	};
};
