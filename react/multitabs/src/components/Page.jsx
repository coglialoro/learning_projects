import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faWindowClose } from "@fortawesome/free-solid-svg-icons";
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import {
	deletePageAction,
	setPagePositionAction,
	setPageSizeAction,
} from "../state/pages/actions";

const Page = ({
	page: { id, url, height, width, top, left, zIndex, title },
	minWidth = 50,
	minHeight = 50,
}) => {
	const [position, setPosition] = useState({ top, left });
	const [size, setSize] = useState({ width, height });
	const [pointerEvents, setPointerEvents] = useState("auto");

	const dispatch = useDispatch();

	let x1, x2, y1, y2;
	let dragStartL, dragStartT, dragStartW, dragStartH;

	const moveStart = (e) => {
		e.preventDefault();
		x2 = e.clientX;
		y2 = e.clientY;
		document.onmouseup = moveEnd;
		document.onmousemove = moveUpdate;
		setPointerEvents("none");
	};

	const moveUpdate = (e) => {
		e.preventDefault();
		x1 = x2 - e.clientX;
		y1 = y2 - e.clientY;
		x2 = e.clientX;
		y2 = e.clientY;
		setPosition((position) => {
			return {
				top: position.top - y1,
				left: position.left - x1,
			};
		});
	};

	const moveEnd = () => {
		document.onmouseup = null;
		document.onmousemove = null;
		setPointerEvents("auto");
		setPosition((position) => {
			dispatch(setPagePositionAction(id, position.top, position.left));
			return position;
		});
	};

	const getDragStart = (dragUpdateFn) => {
		return (e) => {
			e.preventDefault();
			x2 = e.clientX;
			y2 = e.clientY;
			setSize((size) => {
				dragStartH = size.height;
				dragStartW = size.width;
				return size;
			});
			setPosition((position) => {
				dragStartT = position.top;
				dragStartL = position.left;
				return position;
			});
			document.onmouseup = dragEnd;
			document.onmousemove = dragUpdateFn;
			setPointerEvents("none");
		};
	};

	const nwDragUpdate = (e) => {
		e.preventDefault();
		const x = Math.min(e.clientX, dragStartL + dragStartW - minWidth);
		const y = Math.min(e.clientY, dragStartT + dragStartH - minHeight);
		x1 = x2 - x;
		y1 = y2 - y;
		x2 = x;
		y2 = y;
		setPosition((position) => {
			return {
				top: position.top - y1,
				left: position.left - x1,
			};
		});
		setSize((size) => {
			return {
				width: size.width + x1,
				height: size.height + y1,
			};
		});
	};

	const nDragUpdate = (e) => {
		e.preventDefault();
		const y = Math.min(e.clientY, dragStartT + dragStartH - minHeight);
		y1 = y2 - y;
		y2 = y;
		setPosition((position) => {
			return {
				top: position.top - y1,
				left: position.left,
			};
		});
		setSize((size) => {
			return {
				width: size.width,
				height: size.height + y1,
			};
		});
	};

	const neDragUpdate = (e) => {
		e.preventDefault();
		const x = Math.max(e.clientX, dragStartL + minWidth);
		const y = Math.min(e.clientY, dragStartT + dragStartH - minHeight);
		x1 = x2 - x;
		y1 = y2 - y;
		x2 = x;
		y2 = y;
		setPosition((position) => {
			return {
				top: position.top - y1,
				left: position.left,
			};
		});
		setSize((size) => {
			return {
				width: size.width - x1,
				height: size.height + y1,
			};
		});
	};

	const wDragUpdate = (e) => {
		e.preventDefault();
		const x = Math.min(e.clientX, dragStartL + dragStartW - minWidth);
		x1 = x2 - x;
		x2 = x;
		setPosition((position) => {
			return {
				top: position.top,
				left: position.left - x1,
			};
		});
		setSize((size) => {
			return {
				width: size.width + x1,
				height: size.height,
			};
		});
	};

	const eDragUpdate = (e) => {
		e.preventDefault();
		const x = Math.max(e.clientX, dragStartL + minWidth);
		x1 = x2 - x;
		x2 = x;
		setSize((size) => {
			return {
				width: size.width - x1,
				height: size.height,
			};
		});
	};

	const swDragUpdate = (e) => {
		e.preventDefault();
		const x = Math.min(e.clientX, dragStartL + dragStartW - minWidth);
		const y = Math.max(e.clientY, dragStartT + minHeight);
		x1 = x2 - x;
		y1 = y2 - y;
		x2 = x;
		y2 = y;
		setPosition((position) => {
			return {
				top: position.top,
				left: position.left - x1,
			};
		});
		setSize((size) => {
			return {
				width: size.width + x1,
				height: size.height - y1,
			};
		});
	};

	const sDragUpdate = (e) => {
		e.preventDefault();
		const y = Math.max(e.clientY, dragStartT + minHeight);
		y1 = y2 - y;
		y2 = y;
		setSize((size) => {
			return {
				width: size.width,
				height: size.height - y1,
			};
		});
	};

	const seDragUpdate = (e) => {
		e.preventDefault();
		const x = Math.max(e.clientX, dragStartL + minWidth);
		const y = Math.max(e.clientY, dragStartT + minHeight);
		x1 = x2 - x;
		y1 = y2 - y;
		x2 = x;
		y2 = y;
		setSize((size) => {
			return {
				width: size.width - x1,
				height: size.height - y1,
			};
		});
	};

	const dragEnd = () => {
		document.onmouseup = null;
		document.onmousemove = null;
		setPointerEvents("auto");
		setPosition((position) => {
			dispatch(setPagePositionAction(id, position.top, position.left));
			return position;
		});
		setSize((size) => {
			dispatch(setPageSizeAction(id, size.width, size.height));
			return size;
		});
	};

	const closePage = () => {
		dispatch(deletePageAction(id));
	};

	const divStyle = {
		top: position.top + "px",
		left: position.left + "px",
		width: size.width + "px",
		height: size.height + "px",
		zIndex,
	};

	const iFrameStyle = {
		flexGrow: 1,
		pointerEvents,
	};

	return (
		<div className="resizable" style={divStyle}>
			<div className="nw" onMouseDown={getDragStart(nwDragUpdate)}></div>
			<div className="n" onMouseDown={getDragStart(nDragUpdate)}></div>
			<div className="ne" onMouseDown={getDragStart(neDragUpdate)}></div>
			<div className="w" onMouseDown={getDragStart(wDragUpdate)}></div>
			<div className="frame">
				<div className="frame-header" onMouseDown={moveStart}>
					{title}
					<FontAwesomeIcon
						icon={faWindowClose}
						onClick={closePage}
						color="white"
						className="close-icon"
					/>
				</div>
				<iframe src={url} style={iFrameStyle}></iframe>
			</div>
			<div className="e" onMouseDown={getDragStart(eDragUpdate)}></div>
			<div className="sw" onMouseDown={getDragStart(swDragUpdate)}></div>
			<div className="s" onMouseDown={getDragStart(sDragUpdate)}></div>
			<div className="se" onMouseDown={getDragStart(seDragUpdate)}></div>
		</div>
	);
};

export default Page;
