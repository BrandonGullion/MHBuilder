import React from "react";
import { BsShieldShaded } from "react-icons/bs";
import Element_Dragon_Icon from "../../../Images/ElementIcons/Element_Dragon_Icon.png";
import Element_Fire_Icon from "../../../Images/ElementIcons/Element_Fire_Icon.png";
import Element_Ice_Icon from "../../../Images/ElementIcons/Element_Ice_Icon.png";
import Element_Thunder_Icon from "../../../Images/ElementIcons/Element_Thunder_Icon.png";
import Element_Water_Icon from "../../../Images/ElementIcons/Element_Water_Icon.png";

export default function DefenseDisplay(props) {
    const { armorPiece } = props;

    return (
        <div className="flex-container justify-space-around">
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
                <img
                    alt="Fire Element"
                    src={Element_Fire_Icon}
                    style={{ width: "20px", margin: "0px 5px" }}
                ></img>
                <label>{armorPiece.fireRes}</label>
            </div>

            {/* Water Res Display */}
            <div className="display-inline-block">
                <img
                    alt="Water Element"
                    src={Element_Water_Icon}
                    style={{ width: "20px", margin: "0px 5px" }}
                ></img>
                <label>{armorPiece.waterRes}</label>
            </div>

            {/* Thunder Res Display */}
            <div className="display-inline-block">
                <img
                    alt="Thunder Element"
                    src={Element_Thunder_Icon}
                    style={{ width: "20px", margin: "0px 5px" }}
                ></img>
                <label>{armorPiece.thunderRes}</label>
            </div>

            {/* Ice Res Display */}
            <div className="display-inline-block">
                <img
                    alt="Ice Element"
                    src={Element_Ice_Icon}
                    style={{ width: "20px", margin: "0px 5px" }}
                ></img>
                <label>{armorPiece.iceRes}</label>
            </div>

            {/* Dragon Res Display */}
            <div className="display-inline-block">
                <img
                    alt="Dragon Element"
                    src={Element_Dragon_Icon}
                    style={{ width: "20px", margin: "0px 5px" }}
                ></img>
                <label style={{ textAlign: "center", margin: "0" }}>
                    {armorPiece.dragonRes}
                </label>
            </div>
        </div>
    );
}
