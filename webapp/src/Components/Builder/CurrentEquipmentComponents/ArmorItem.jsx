import React from "react";
import {
    GiVisoredHelm,
    GiShoulderArmor,
    GiGauntlet,
    GiBeltArmor,
    GiLegArmor,
} from "react-icons/gi";
import DefenseDisplay from "./DefenseDisplay";


export default function ArmorItem(props) {
    const {armorPiece}  = props;
    // Create the armor icon depending on the passed in type
    function renderArmorType(armorType) {
        switch (armorType) {
            case "Helm":
                return <GiVisoredHelm></GiVisoredHelm>;
            case "Chest":
                return <GiShoulderArmor></GiShoulderArmor>;
            case "Arms":
                return <GiGauntlet></GiGauntlet>;
            case "Coil":
                return <GiBeltArmor></GiBeltArmor>;
            case "Legs":
                return <GiLegArmor></GiLegArmor>;
            default:
                return <GiVisoredHelm></GiVisoredHelm>;
        }
    }

    if(armorPiece === undefined){
        return<div></div>
    }

    return (
        <div className="glass-card armor-item rounded-corners">
            <div
                className="glass-card-header"
                style={{ padding: "0px 15px 10px", fontSize: "2.2rem" }}
            >
                {renderArmorType(armorPiece.type)}
            </div>
            <div className="glass-card-content armor-item-content">
                <h4 className="pad-left-10 pad-top-5">{armorPiece.name}</h4>
                <DefenseDisplay armorPiece={armorPiece}></DefenseDisplay>
            </div>
        </div>
    );
}
