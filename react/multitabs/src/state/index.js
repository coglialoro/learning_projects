import { combineReducers, compose, createStore } from "redux";
import persistState from "redux-localstorage";
import pagesReducer from "./pages/reducer";

const enhancer = compose(persistState());
const store = createStore(
	combineReducers({
		pages: pagesReducer,
	}),
	enhancer
);

export default store;
