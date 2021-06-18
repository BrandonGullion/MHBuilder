import React, { useContext } from "react";
import { BuilderStateContext } from "../../../../Contexts/BuilderContext";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function ArmDecoGroup(props) {
    const { setCurrentSkills } = props;
    const state = useContext(BuilderStateContext);

    return (
        <div>
            <ArmorItem
                armorPiece={state.arms}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                armorPiece={state.arms}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
