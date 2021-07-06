import React from "react";

export default function FixesItem(props) {

    const {title, content, date} = props;
    
    return (
        <div style={{ marginTop: "20px", color: "#ccc" }}>
            <div style={{ textAlign: "center", display: "flex" }}>
                <h3>{title} ---</h3>
                <h3 style={{ marginLeft: "5px" }}>{date}</h3>
            </div>
            <h5 style={{ textAlign: "center", marginTop: "10px" }}>
                {content}
            </h5>
        </div>
    );
}
