import React from "react";
import FixesDisplay from "../Components/Index/FixesDisplay";
import UpdateDisplay from "../Components/Index/UpdateDisplay";
import WeaponBanner from "../Components/Index/WeaponBanner";
import BulletinBoardComponent from "../Components/Index/BulletinBoardComponent";

export default function Index() {
    return (
        <div>
            {/* Banner Tags */}
            <div style={{ display: "flex", justifyContent: "center" }}>
                <div
                    style={{
                        display: "flex",
                        justifyContent: "center",
                        margin: "150px 10% 0 0",
                    }}
                >
                    <div style={{ display: "flex", flexDirection: "column" }}>
                        <label
                            style={{
                                fontSize: "40px",
                                color: "#ccc",
                            }}
                        >
                            Your dream build starts
                        </label>
                        <div
                            style={{
                                display: "flex",
                                justifyContent: "center",
                                margin: "0",
                            }}
                        >
                            <a className="index-button" href="/builder">
                                Here
                            </a>
                        </div>
                    </div>
                </div>
                <div style={{ margin: "80px 0 0 0" }}>
                    <WeaponBanner></WeaponBanner>
                </div>
            </div>
            <div style={{ display: "flex", justifyContent: "center" }}>
                <hr className="linebreak" />
            </div>
            {/* Update and Fix Component */}
            <div
                style={{
                    display: "flex",
                    justifyContent: "center",
                    flexDirection: "column",
                }}
            >
                <BulletinBoardComponent></BulletinBoardComponent>
                <div
                    style={{ display: "flex", justifyContent: "space-evenly", paddingTop:"30px" }}
                >
                    <UpdateDisplay></UpdateDisplay>
                    {/* Center line break */}
                    <div
                        style={{
                            display: "flex",
                            flexDirection: "column",
                            height: "450px",
                            borderColor: "#ccc",
                            borderWidth: "0 0 0 1px",
                            borderStyle: "solid",
                            margin: "10px 70px",
                        }}
                    ></div>
                    <FixesDisplay></FixesDisplay>
                </div>
            </div>
        </div>
    );
}
