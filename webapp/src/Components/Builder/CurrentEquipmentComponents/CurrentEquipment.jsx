import React from "react";
import HelmDecoGroup from "./ArmorItemDecoGroup/HelmDecoGroup";
import ChestDecoGroup from "./ArmorItemDecoGroup/ChestDecoGroup";
import ArmDecoGroup from "./ArmorItemDecoGroup/ArmDecoGroup";
import CoilDecoGroup from "./ArmorItemDecoGroup/CoilDecoGroup";
import LegDecoGroup from "./ArmorItemDecoGroup/LegDecoGroup";
import WeaponDecoGroup from "./ArmorItemDecoGroup/WeaponDecoGroup";

export default function CurrentEquipment(props) {
    const {
        skills,
        currentWeapon,
        currentHelm,
        currentChest,
        currentArms,
        currentCoil,
        currentLegs,
        setCurrentSkills,
        dispatch,
    } = props;

    return (
        <div
            className="glass-card-no-background current-equipment-pane"
            style={{ marginLeft: "20px" }}
        >
            <div className="glass-card-header">
                <h2 className="pad-left-10">Current Weapon</h2>
            </div>
            <WeaponDecoGroup
                skills={skills}
                currentWeapon={currentWeapon}
                dispatch={dispatch}
                setCurrentSkills={setCurrentSkills}
            ></WeaponDecoGroup>
            <div
                className="glass-card-header"
                style={{ margin: "10px 0px 5px 0px" }}
            >
                <h2 className="pad-left-10">Current Armor</h2>
            </div>
            <HelmDecoGroup
                dispatch={dispatch}
                skills={skills}
                currentHelm={currentHelm}
                setCurrentSkills={setCurrentSkills}
            ></HelmDecoGroup>
            <ChestDecoGroup
                dispatch={dispatch}
                skills={skills}
                currentChest={currentChest}
                setCurrentSkills={setCurrentSkills}
            ></ChestDecoGroup>
            <ArmDecoGroup
                dispatch={dispatch}
                skills={skills}
                currentArms={currentArms}
                setCurrentSkills={setCurrentSkills}
            ></ArmDecoGroup>
            <CoilDecoGroup
                skills={skills}
                dispatch={dispatch}
                currentCoil={currentCoil}
                setCurrentSkills={setCurrentSkills}
            ></CoilDecoGroup>
            <LegDecoGroup
                currentLegs={currentLegs}
                dispatch={dispatch}
                skills={skills}
                setCurrentSkills={setCurrentSkills}
            ></LegDecoGroup>
        </div>
    );
}
