import React, { useContext } from "react";
import CurrentEquipment from "../Components/Builder/CurrentEquipmentComponents/CurrentEquipment";
import SelectEquipment from "../Components/Builder/SelectEquipmentComponents/SelectEquipment";
import Stats from "../Components/Builder/StatsComponents/Stats";
import * as ReactBootStrap from "react-bootstrap";
import { BuilderStateContext } from "../Contexts/BuilderContext";

export default function BuilderPage() {
    // Components that are loaded only when data is present

    const state = useContext(BuilderStateContext);

    return (
        <div className="builder-page row">
            <div
                style={{
                    visibility:`${state.loading ? "visible" : "hidden"}`,
                    position: "absolute",
                    backgroundColor: "white",
                    margin:"0",
                    display:"flex",
                    justifyContent:"center",
                    alignItems:"center",
                    width: "100%",
                    height: "100%",
                    zIndex: "50",
                }}
            >
                <span style={{fontSize:"30px", margin:"0px 20px 0px 0px"}}>Loading...</span>
                <ReactBootStrap.Spinner animation="border"></ReactBootStrap.Spinner>
            </div>
            <CurrentEquipment></CurrentEquipment>
            <SelectEquipment></SelectEquipment>
            <Stats></Stats>
        </div>
    );
}
