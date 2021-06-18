import React, { useContext } from "react";
import { BuilderStateContext } from "../../../../Contexts/BuilderContext";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function LegDecoGroup(props) {
    const { setCurrentSkills,  } = props;
    const state = useContext(BuilderStateContext);

    return (
        <div>
            <ArmorItem
                armorPiece={state.legs}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                armorPiece={state.legs}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
