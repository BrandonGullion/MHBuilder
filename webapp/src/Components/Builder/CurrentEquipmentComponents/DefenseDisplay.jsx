import React from "react";
import { BsShieldShaded, BsDropletHalf, BsLightning } from "react-icons/bs";
import { GiSeaDragon } from "react-icons/gi";
import { ImFire } from "react-icons/im";
import { IoSnow } from "react-icons/io5";

export default function DefenseDisplay(props) {
    const { armorPiece } = props;

    return <div className="flex-container justify-space-around">
        {/* Defense Display */}
        <div className="display-inline-block">
            <BsShieldShaded
                style={{ padding: "6 10 10 10" }}
                className="icon"
            ></BsShieldShaded>
            <label>{armorPiece.defense}</label>
        </div>

        {/* Fire Res Display */}
        <div className="display-inline-block">
            <ImFire
                className="icon"
                style={{
                    padding: "6 10 10 10",
                    color: "#bd2117",
                }}
            ></ImFire>
            <label>{armorPiece.fireRes}</label>
        </div>

        {/* Water Res Display */}
        <div className="display-inline-block">
            <BsDropletHalf
                className="icon"
                style={{
                    padding: "6 10 10 10",
                    color: "#47a6ff",
                }}
            ></BsDropletHalf>
            <label>{armorPiece.waterRes}</label>
        </div>

        {/* Thunder Res Display */}
        <div className="display-inline-block">
            <BsLightning
                className="icon"
                style={{
                    padding: "6 10 10 10",
                    color: "#f6ff45",
                }}
            ></BsLightning>
            <label>{armorPiece.thunderRes}</label>
        </div>

        {/* Ice Res Display */}
        <div className="display-inline-block">
            <IoSnow
                className="icon"
                style={{
                    color: "#6efaff",
                    padding: "6 10 10 10",
                }}
            ></IoSnow>
            <label>{armorPiece.iceRes}</label>
        </div>

        {/* Dragon Res Display */}
        <div className="display-inline-block">
            <GiSeaDragon
                style={{
                    padding: "6 10 10 10",
                    color: "#b372db",
                }}
                className="icon"
            ></GiSeaDragon>
            <label style={{ textAlign: "center", margin: "0" }}>
                {armorPiece.dragonRes}
            </label>
        </div>
    </div>;
}
