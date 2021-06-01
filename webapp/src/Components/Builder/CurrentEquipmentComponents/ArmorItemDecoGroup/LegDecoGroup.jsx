import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function LegDecoGroup(props) {
    
    const {setCurrentSkills, currentLegs} = props;

    return (
        <div>
            <ArmorItem armorPiece={currentLegs} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece={currentLegs} setCurrentSkills={setCurrentSkills}></DecorationItem>
        </div>
    );
}
