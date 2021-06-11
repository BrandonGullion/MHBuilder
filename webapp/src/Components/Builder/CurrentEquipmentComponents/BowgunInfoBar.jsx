import React from "react";
import { IoReloadOutline } from "react-icons/io5";
import { GiBombingRun } from "react-icons/gi";

export default function BowgunInfoBar(props) {
    const { weapon } = props;

    let bowgunSpecs = weapon.bowGunSpecs.split("//");

    return (
        <div style={{ padding: "0 0 0 5px" }}>
            <div>
                <label style={{ margin: "2px 5px" }}>
                    Dev : {bowgunSpecs[0]}
                </label>
                <label style={{ margin: "2px 10px" }}>
                    <IoReloadOutline></IoReloadOutline>
                    {bowgunSpecs[1]}
                </label>
                <label style={{margin:"2px 10px"}}>Reload : {bowgunSpecs[2]}</label>
            </div>
            <div>
                <label style={{margin:"2px 10px"}}>
                    <GiBombingRun style={{ fontSize: "20px" }}></GiBombingRun>{" "}
                    {bowgunSpecs[3]}
                </label>
                <label style={{margin:"5px 10px 10px 10px"}}>Special : {bowgunSpecs[4]}</label>
            </div>
        </div>
    );
}
