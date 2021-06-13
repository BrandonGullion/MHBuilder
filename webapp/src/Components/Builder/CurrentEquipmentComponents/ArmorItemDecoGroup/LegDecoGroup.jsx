import React from "react";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function LegDecoGroup(props) {
    const { setCurrentSkills, currentLegs, skills, dispatch } = props;

    return (
        <div>
            <ArmorItem
                armorPiece={currentLegs}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                armorPiece={currentLegs}
                dispatch={dispatch}
                skills={skills}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
