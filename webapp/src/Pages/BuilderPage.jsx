import React from "react";
import CurrentEquipment from "../Components/Builder/CurrentEquipmentComponents/CurrentEquipment";
import SelectEquipment from "../Components/Builder/SelectEquipmentComponents/SelectEquipment";
import Stats from "../Components/Builder/StatsComponents/Stats";
import { BuilderContext } from "../Contexts/BuilderContext";

export default function BuilderPage() {
    // Components that are loaded only when data is present
    return (
        <div className="builder-page row">
            <BuilderContext>
                <CurrentEquipment></CurrentEquipment>
                <SelectEquipment></SelectEquipment>
                <Stats></Stats>
            </BuilderContext>
        </div>
    );
}
