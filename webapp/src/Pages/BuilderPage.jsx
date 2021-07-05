import React, { useContext, useEffect, useState } from "react";
import CurrentEquipment from "../Components/Builder/CurrentEquipmentComponents/CurrentEquipment";
import SelectEquipment from "../Components/Builder/SelectEquipmentComponents/SelectEquipment";
import Stats from "../Components/Builder/StatsComponents/Stats";
import * as ReactBootStrap from "react-bootstrap";
import { BuilderStateContext } from "../Contexts/BuilderContext";

export default function BuilderPage() {
    // Components that are loaded only when data is present

    const state = useContext(BuilderStateContext);

    const [loading, setLoading] = useState(true);

    async function stall(stallTime = 1000) {
        await new Promise((resolve) => setTimeout(resolve, stallTime));
    }

    useEffect(async () => {
        if (
            state.weapons.length > 0 &&
            state.armors.length > 0 &&
            state.skills.length > 0
        ) {
            await stall();
            setLoading(false);
        }
    }, [state.weapons, state.armors, state.skills]);

    return (
        <div className="builder-page row">
            <div
                style={{
                    visibility: `${loading ? "visible" : "hidden"}`,
                    position: "absolute",
                    color: "#ccc",
                    backgroundColor: "#3c444b",
                    margin: "0",
                    display: "flex",
                    justifyContent: "center",
                    alignItems: "center",
                    width: "100%",
                    height: "100%",
                    zIndex: "50",
                }}
            >
                <span style={{ fontSize: "30px", margin: "0px 20px 0px 0px" }}>
                    Loading...
                </span>
                <ReactBootStrap.Spinner animation="border"></ReactBootStrap.Spinner>
            </div>
            <CurrentEquipment></CurrentEquipment>
            <SelectEquipment></SelectEquipment>
            <Stats></Stats>
        </div>
    );
}
