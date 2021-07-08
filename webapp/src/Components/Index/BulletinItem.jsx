import React from "react";

export default function BulletinItem(props) {
    const { bulletin } = props;
    const { title, content, dateCreated } = bulletin;

    return (
        <div style={{ color: "#ccc" }}>
            <div style={{ textAlign: "center" }}>
                <h3 style={{ fontSize: "22px" }}>
                    {title} --- {dateCreated}
                </h3>
            </div>
            <h5
                style={{
                    textAlign: "center",
                    marginTop: "10px",
                    marginRight: "auto",
                    marginLeft: "auto",
                    marginBottom: "30px",
                    fontSize: "16px",
                    width: "80%",
                }}
            >
                {content}
            </h5>
        </div>
    );
}
