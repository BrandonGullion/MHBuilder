import React from "react";
import HelmDecoGroup from "./ArmorItemDecoGroup/HelmDecoGroup";
import ChestDecoGroup from "./ArmorItemDecoGroup/ChestDecoGroup";
import ArmDecoGroup from "./ArmorItemDecoGroup/ArmDecoGroup";
import CoilDecoGroup from "./ArmorItemDecoGroup/CoilDecoGroup";
import LegDecoGroup from "./ArmorItemDecoGroup/LegDecoGroup";
import WeaponDecoGroup from "./ArmorItemDecoGroup/WeaponDecoGroup";

export default function CurrentEquipment(props) {

    const {
        setCurrentSkills,
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
                setCurrentSkills={setCurrentSkills}
            ></WeaponDecoGroup>
            <div
                className="glass-card-header"
                style={{ margin: "10px 0px 5px 0px" }}
            >
                <h2 className="pad-left-10">Current Armor</h2>
            </div>
            <HelmDecoGroup
                setCurrentSkills={setCurrentSkills}
            ></HelmDecoGroup>
            <ChestDecoGroup
                setCurrentSkills={setCurrentSkills}
            ></ChestDecoGroup>
            <ArmDecoGroup
                setCurrentSkills={setCurrentSkills}
            ></ArmDecoGroup>
            <CoilDecoGroup
                setCurrentSkills={setCurrentSkills}
            ></CoilDecoGroup>
            <LegDecoGroup
                setCurrentSkills={setCurrentSkills}
            ></LegDecoGroup>
        </div>
    );
}
