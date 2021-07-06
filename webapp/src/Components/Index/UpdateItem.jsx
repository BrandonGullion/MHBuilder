import React from "react";

export default function UpdateItem(props) {
    // Destructure
    const { title, content, date } = props;

    return (
        <div style={{marginTop:"20px", color:"#ccc"}}>
            <div style={{ textAlign: "center" }}>
                <h3 style={{}}>{title} --- {date}</h3>
            </div>
            <h5 style={{textAlign:"center", marginTop:"10px"}}>{content}</h5>
        </div>
    );
}
