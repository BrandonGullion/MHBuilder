import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function CoilDecoGroup(props) {

    const {currentCoil, setCurrentSkills, skills} = props;
    
    return (
        <div>
            <ArmorItem armorPiece={currentCoil} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece={currentCoil} skills={skills} setCurrentSkills={setCurrentSkills}></DecorationItem>
        </div>
    );
}
