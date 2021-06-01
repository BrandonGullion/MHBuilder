import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ChestDecoGroup(props) {

    const {currentChest, setCurrentSkills} = props;

    return (
        <div>
            <ArmorItem armorPiece={currentChest} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece={currentChest} setCurrentSkills={setCurrentSkills}></DecorationItem>
        </div>
    );
}
