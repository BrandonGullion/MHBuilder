import { useContext } from "react";
import { BuilderStateContext } from "../../../../Contexts/BuilderContext";
import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function HelmDecoGroup(props) {
    const { setCurrentSkills } = props;
    const state = useContext(BuilderStateContext);

    return (
        <div>
            <ArmorItem
                armorPiece={state.helm}
                setCurrentSkills={setCurrentSkills}
            ></ArmorItem>
            <DecorationItem
                equipment={state.helm}
                setCurrentSkills={setCurrentSkills}
            ></DecorationItem>
        </div>
    );
}
