import React from "react";

export default function UpdateItem(props) {
    // Destructure
    const { updateTitle, updateContent, date } = props;

    return (
        <div>
            <h3 className="update-title">
                {updateTitle}
                <span className="update-date">{date}</span>
            </h3>
            <h5 className="update-content">{updateContent}</h5>
            <div className="linebreak"></div>
        </div>
    );
}
