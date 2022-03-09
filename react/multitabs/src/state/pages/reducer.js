import { generate } from "shortid";
import {
	ADD_PAGE,
	DELETE_PAGE,
	SET_PAGE_POSITION,
	SET_PAGE_SIZE,
	SET_PAGE_TITLE,
} from "./actions";

const initialState = [];

const reducer = (state = initialState, action) => {
	switch (action.type) {
		case ADD_PAGE:
			return [
				...state,
				{
					id: generate(),
					title: action.payload.title,
					url: action.payload.url,
					top: 50,
					left: 50,
					width: 640,
					height: 480,
				},
			];
		case DELETE_PAGE:
			return state.filter((page) => page.id !== action.payload.id);
		case SET_PAGE_POSITION:
			return state.map((page) => {
				if (page.id === action.payload.id) {
					return {
						...page,
						top: action.payload.top,
						left: action.payload.left,
					};
				} else {
					return page;
				}
			});
		case SET_PAGE_SIZE:
			return state.map((page) => {
				if (page.id === action.payload.id) {
					return {
						...page,
						width: action.payload.width,
						height: action.payload.height,
					};
				} else {
					return page;
				}
			});
		case SET_PAGE_TITLE:
			return state.map((page) => {
				if (page.id === action.payload.id) {
					return {
						...page,
						title: action.payload.title,
					};
				} else {
					return page;
				}
			});
		default:
			return state;
	}
};

export default reducer;
