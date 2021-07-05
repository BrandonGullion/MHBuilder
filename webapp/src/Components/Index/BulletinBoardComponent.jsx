import React, { useContext } from "react";
import { HomePageStateContext } from "../../Contexts/HomePage";
import BulletinItem from "./BulletinItem";

export default function BulletinBoardComponent() {
    const state = useContext(HomePageStateContext);
    const { bulletins } = state;

    return (
        <div
            style={{
                display: "flex",
                flexDirection: "column",
                justifyContent: "center",
                marginBottom: "50px",
                marginTop:"50px",
            }}
        >
            <label
                style={{ textAlign: "center", fontSize: "30px", color: "#ccc" }}
            >
                Bulletin Board
            </label>
            {bulletins.map((bulletin) => (
                <BulletinItem bulletin={bulletin}></BulletinItem>
            ))}
        </div>
    );
}
