import React, { useState } from "react";
import Page from "./components/Page";
import { useSelector } from "react-redux";
import NewPageModal from "./components/NewPageModal";

const App = () => {
    const pages = useSelector((state) => state.pages);
    const [showModal, setShowModal] = useState(false);

    const hideModal = () => {
        setShowModal(false);
    };

    return (
        <div className="app">
            <button
                onClick={() => {
                    setShowModal(true);
                }}
            >
                +
            </button>
            {showModal && <NewPageModal hideModal={hideModal} />}
            {pages.map((page, index) => (
                <Page key={page.id} page={{ ...page, zIndex: index }} />
            ))}
        </div>
    );
};

export default App;
