import React, { useContext } from "react";
import { Popup } from "semantic-ui-react";
import {
    GiShoulderArmor,
    GiVisoredHelm,
    GiLegArmor,
    GiGauntlet,
    GiBeltArmor,
} from "react-icons/gi";
import { BsSlashSquare } from "react-icons/bs";
import ArmorPopUp from "./ArmorPopUp";
import { BuilderDispatchContext } from "../../../Contexts/BuilderContext";

export default function EquipmentSet(props) {
    const dispatch = useContext(BuilderDispatchContext);

    // Set the passed in armor set array value
    const armorArray = props.armorArray;

    // Create instances of each prop as a fall back
    let helm = {};
    let chest = {};
    let arms = {};
    let coil = {};
    let legs = {};

    let currentSet = armorArray[0].armorSetName;

    // Sets the appropriate armor type to corresponding prop
    armorArray.forEach((armor) => {
        switch (armor.type) {
            case "Helm":
                helm = armor;
                break;
            case "Chest":
                chest = armor;
                break;
            case "Arms":
                arms = armor;
                break;
            case "Coil":
                coil = armor;
                break;
            case "Legs":
                legs = armor;
                break;
            default:
                break;
        }
    });

    return (
        <div style={{ width: "300px" }}>
            <div>
                <p className="pad-left-10 pad-tb-10 current-set-label">
                    {currentSet} Set
                </p>
            </div>
            <div className="flex-container justify-space-around">
                {/* Helm Armor Piece */}
                {helm.name !== undefined ? (
                    <Popup
                        content={<ArmorPopUp key={helm.id} armorPiece={helm}></ArmorPopUp>}
                        trigger={
                            <div className="white-border-hover">
                                <GiVisoredHelm
                                    className="glass-card-header armor-item-icon rounded-corners"
                                    onClick={() => {
                                        dispatch({
                                            type: "SET_HELM",
                                            payload: helm,
                                        });
                                        dispatch({
                                            type: "SET_CURRENT_SKILLS",
                                        });
                                    }}
                                ></GiVisoredHelm>
                            </div>
                        }
                    ></Popup>
                ) : (
                    <div className="select-equipment-no-armor">
                        <BsSlashSquare className="glass-card-header armor-item-icon rounded-corners"></BsSlashSquare>
                    </div>
                )}
                {/* Chest Armor Piece */}
                {/* Helm Armor Piece */}
                {chest.name !== undefined ? (
                    <Popup
                        content={<ArmorPopUp key={chest.id} armorPiece={chest}></ArmorPopUp>}
                        trigger={
                            <div className="white-border-hover">
                                <GiShoulderArmor
                                    className="glass-card-header armor-item-icon rounded-corners"
                                    onClick={() => {
                                        dispatch({
                                            type: "SET_CHEST",
                                            payload: chest,
                                        });
                                        dispatch({
                                            type: "SET_CURRENT_SKILLS",
                                        });
                                    }}
                                ></GiShoulderArmor>
                            </div>
                        }
                    ></Popup>
                ) : (
                    <div className="select-equipment-no-armor">
                        <BsSlashSquare className="glass-card-header armor-item-icon rounded-corners"></BsSlashSquare>
                    </div>
                )}
                {/* Arms Armor Piece */}
                {arms.name !== undefined ? (
                    <Popup
                        content={
                            <ArmorPopUp
                                key={arms.id}
                                armorPiece={arms}
                            ></ArmorPopUp>
                        }
                        trigger={
                            <div className="white-border-hover">
                                <GiGauntlet
                                    onClick={() => {
                                        dispatch({
                                            type: "SET_ARMS",
                                            payload: arms,
                                        });
                                        dispatch({
                                            type: "SET_CURRENT_SKILLS",
                                        });
                                    }}
                                    className="glass-card-header armor-item-icon rounded-corners"
                                ></GiGauntlet>
                            </div>
                        }
                    ></Popup>
                ) : (
                    <div className="select-equipment-no-armor">
                        <BsSlashSquare className="glass-card-header armor-item-icon rounded-corners"></BsSlashSquare>
                    </div>
                )}
                {/* Coil Armor Piece */}
                {coil.name !== undefined ? (
                    <Popup
                        content={<ArmorPopUp key={coil.id} armorPiece={coil}></ArmorPopUp>}
                        trigger={
                            <div className="white-border-hover">
                                <GiBeltArmor
                                    onClick={() => {
                                        dispatch({
                                            type: "SET_COIL",
                                            payload: coil,
                                        });
                                        dispatch({
                                            type: "SET_CURRENT_SKILLS",
                                        });
                                    }}
                                    className="glass-card-header armor-item-icon rounded-corners"
                                ></GiBeltArmor>
                            </div>
                        }
                    ></Popup>
                ) : (
                    <div className="select-equipment-no-armor">
                        <BsSlashSquare className="glass-card-header armor-item-icon rounded-corners"></BsSlashSquare>
                    </div>
                )}

                {/* Legs Armor Piece */}
                {legs.name !== undefined ? (
                    <Popup
                        content={<ArmorPopUp key={legs.id} armorPiece={legs}></ArmorPopUp>}
                        trigger={
                            <div className="white-border-hover">
                                <GiLegArmor
                                    onClick={() => {
                                        dispatch({
                                            type: "SET_LEGS",
                                            payload: legs,
                                        });
                                        dispatch({
                                            type: "SET_CURRENT_SKILLS",
                                        });
                                    }}
                                    className="glass-card-header armor-item-icon rounded-corners"
                                ></GiLegArmor>
                            </div>
                        }
                    ></Popup>
                ) : (
                    <div className="select-equipment-no-armor">
                        <BsSlashSquare className="glass-card-header armor-item-icon rounded-corners"></BsSlashSquare>
                    </div>
                )}
            </div>
        </div>
    );
}
