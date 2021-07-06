import React, { useContext } from "react";
import { HomePageStateContext } from "../../Contexts/HomePage";
import UpdateItem from "./UpdateItem";

export default function UpdateDisplay() {
    const state = useContext(HomePageStateContext);
    const { updates } = state;

    return (
        <div style={{ display: "flex", flexDirection: "column"}}>
            <div style={{ textAlign:"center", color: "#ccc", fontSize: "24px" }}>Updates</div>
            {updates.map((update, updateId) => (
                <UpdateItem
                    key={updateId}
                    date={update.dateCreated}
                    title={update.title}
                    content={update.content}
                ></UpdateItem>
            ))}
        </div>
    );
}
