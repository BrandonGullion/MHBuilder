import React from "react";
import HelmDecoGroup from "./ArmorItemDecoGroup/HelmDecoGroup";
import ChestDecoGroup from "./ArmorItemDecoGroup/ChestDecoGroup";
import ArmDecoGroup from "./ArmorItemDecoGroup/ArmDecoGroup";
import CoilDecoGroup from "./ArmorItemDecoGroup/CoilDecoGroup";
import LegDecoGroup from "./ArmorItemDecoGroup/LegDecoGroup";
import WeaponDecoGroup from "./ArmorItemDecoGroup/WeaponDecoGroup";

export default function CurrentEquipment(props) {

    const {currentWeapon, currentHelm, currentChest, currentArms, currentCoil, currentLegs, setCurrentSkills} = props;

    return (
        <div className="glass-card current-equipment-pane">
            <div className="glass-card-header">
                <h2 className="pad-left-10">Current Equipment</h2>
            </div>
            <div className="glass-card-content">
                <WeaponDecoGroup
                    currentWeapon={currentWeapon}
                    setCurrentSkills={setCurrentSkills}
                ></WeaponDecoGroup>
                <HelmDecoGroup
                    currentHelm={currentHelm}
                    setCurrentSkills={setCurrentSkills}
                ></HelmDecoGroup>
                <ChestDecoGroup
                    currentChest={currentChest}
                    setCurrentSkills={setCurrentSkills}
                ></ChestDecoGroup>
                <ArmDecoGroup
                    currentArms={currentArms}
                    setCurrentSkills={setCurrentSkills}
                ></ArmDecoGroup>
                <CoilDecoGroup
                    currentCoil={currentCoil}
                    setCurrentSkills={setCurrentSkills}
                ></CoilDecoGroup>
                <LegDecoGroup
                    currentLegs={currentLegs}
                    setCurrentSkills={setCurrentSkills}
                ></LegDecoGroup>
            </div>
        </div>
    );
}
