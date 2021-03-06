import React, { useContext } from "react";
import { HomePageStateContext } from "../../Contexts/HomePage";
import FixesItem from "./FixesItem";

export default function FixesDisplay() {

    const state = useContext(HomePageStateContext);
    const {fixes} = state;

    return (
        <div style={{ display: "flex", flexDirection: "column" }}>
            <div
                style={{
                    textAlign: "center",
                    color: "#ccc",
                    fontSize: "24px",
                }}
            >
                Current bugs / Fixes
            </div>
            {fixes.map((fix, fixId) => (
                <FixesItem
                    key={fixId}
                    date={fix.dateCreated}
                    title={fix.title}
                    content={fix.content}
                ></FixesItem>
            ))}
        </div>
    );
}
