import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ArmDecoGroup(props) {

    const {setCurrentSkills, currentArms} = props;

    return (
        <div>
            <ArmorItem armorPiece={currentArms} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece={currentArms} setCurrentSkills={setCurrentSkills}></DecorationItem>
        </div>
    );
}
