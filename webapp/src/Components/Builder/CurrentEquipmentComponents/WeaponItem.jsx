import React, { Fragment } from "react";
import { BsShieldShaded, BsDropletHalf, BsLightning } from "react-icons/bs";
import {
    GiBroadsword,
    GiSwordWound,
    GiSeaDragon,
    GiLightningTrio,
    GiMineExplosion,
} from "react-icons/gi";
import { RiSwordFill, RiZzzLine, RiBubbleChartLine } from "react-icons/ri";
import SharpnessBar from "../SharpnessBar";
import { ImFire } from "react-icons/im";
import { IoSnow } from "react-icons/io5";
import BowgunInfoBar from "./BowgunInfoBar";
import MelodyBar from "./MelodyBar";

export default function WeaponItem(props) {
    const { weapon, dispatch } = props;
    let isSharpness = false;

    if (
        weapon.redSharpness !== 0 ||
        weapon.orangeSharpness !== 0 ||
        weapon.yellowSharpness !== 0 ||
        weapon.greenSharpness !== 0 ||
        weapon.blueSharpness !== 0 ||
        weapon.whiteSharpness !== 0
    ) {
        isSharpness = true;
    }

    const renderElement = (weapon) => {
        switch (weapon.elementType) {
            case "Fire":
                return (
                    <div>
                        <ImFire
                            style={{
                                padding: "6 10 10 10",
                                color: "#bd2117",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></ImFire>
                    </div>
                );
            case "Water":
                return (
                    <div>
                        <BsDropletHalf
                            style={{
                                padding: "6 10 10 10",
                                color: "#47a6ff",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></BsDropletHalf>
                    </div>
                );
            case "Thunder":
                return (
                    <div>
                        <BsLightning
                            style={{
                                padding: "6 10 10 10",
                                color: "#f6ff45",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></BsLightning>
                    </div>
                );
            case "Dragon":
                return (
                    <div>
                        <GiSeaDragon
                            style={{
                                padding: "6 10 10 10",
                                color: "#b372db",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></GiSeaDragon>
                    </div>
                );
            case "Ice":
                return (
                    <div>
                        <IoSnow
                            style={{
                                padding: "6 10 10 10",
                                color: "#6efaff",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></IoSnow>
                    </div>
                );
            case "Sleep":
                return (
                    <div>
                        <RiZzzLine
                            style={{
                                padding: "5 10 10 10",
                                color: "#57cdff",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></RiZzzLine>
                    </div>
                );
            case "Paralysis":
                return (
                    <div>
                        <GiLightningTrio
                            style={{
                                padding: "5 10 10 10",
                                color: "#d6db35",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></GiLightningTrio>
                    </div>
                );
            case "Poison":
                return (
                    <div>
                        <RiBubbleChartLine
                            style={{
                                padding: "5 10 10 10",
                                color: "#df94ff",
                                fontSize: "18px",
                            }}
                            className="icon"
                        ></RiBubbleChartLine>
                    </div>
                );
            case "Blast":
                return (
                    <div>
                        <GiMineExplosion
                            style={{
                                padding: "5 10 10 10",
                                color: "#ffb96e",
                                fontSize: "18px",
                            }}
                        ></GiMineExplosion>
                    </div>
                );
            default:
                break;
        }
    };

    if (weapon !== undefined) {
        return (
            <div
                style={{ fontSize: "14px" }}
                className="glass-card-weapon-item armor-item rounded-corners"
                onClick={() =>
                    dispatch({ type: "SET_WEAPON", payload: weapon })
                }
            >
                {isSharpness ? (
                    <SharpnessBar
                        redSharpness={weapon.redSharpness}
                        orangeSharpness={weapon.orangeSharpness}
                        yellowSharpness={weapon.yellowSharpness}
                        greenSharpness={weapon.greenSharpness}
                        blueSharpness={weapon.blueSharpness}
                        whiteSharpness={weapon.whiteSharpness}
                        purpleSharpness={weapon.purpleSharpness}
                    ></SharpnessBar>
                ) : (
                    <div></div>
                )}

                <div
                    className="glass-card-header"
                    style={{ padding: "0px 15px 10px", fontSize: "2.2rem" }}
                >
                    <GiBroadsword></GiBroadsword>
                </div>
                <div className="glass-card-content armor-item-content">
                    <div>
                        <h4 className=" pad-left-10 pad-top-5">
                            {weapon.name}
                        </h4>
                    </div>
                    <div className="flex-container justify-content-start">
                        <div>
                            <RiSwordFill
                                style={{ padding: "6 10 10 10" }}
                                className="icon"
                            ></RiSwordFill>
                            <label>{weapon.damage}</label>
                        </div>
                        <div>
                            <GiSwordWound
                                style={{ padding: "6 10 10 10" }}
                                className="icon"
                            ></GiSwordWound>
                            <label>{weapon.affinity}</label>
                        </div>
                        <div>
                            <BsShieldShaded
                                style={{ padding: "6 10 10 10" }}
                                className="icon"
                            ></BsShieldShaded>
                            <label>{weapon.defenseIncrease}</label>
                        </div>
                        {/* Element Type Div */}
                        {renderElement(weapon)}
                        {/* Element Damage Div */}
                        <Fragment>
                            <label
                                style={{ margin: "0", padding: "3px 0 0 0" }}
                            >
                                {weapon.elementalDamage > 0
                                    ? weapon.elementalDamage
                                    : ""}
                            </label>
                        </Fragment>

                        <Fragment>
                            {weapon.type === "ChargeBlade" || weapon.type==="GunLance" ? (
                                <Fragment>
                                    <label style={{margin:"0 0 0 10px", padding:"3px 0 0 0"}}>{weapon.phialOrShellingType}</label>
                                </Fragment>
                            ) : (
                                <div></div>
                            )}
                        </Fragment>
                    </div>
                    <Fragment>
                        {weapon.type === "LightBowgun" ||
                        weapon.type === "HeavyBowgun" ? (
                            <BowgunInfoBar weapon={weapon}></BowgunInfoBar>
                        ) : (
                            <Fragment></Fragment>
                        )}
                    </Fragment>
                    <Fragment>
                        {weapon.type === "HuntingHorn" ? <MelodyBar melodies={weapon.melody}></MelodyBar> : <Fragment></Fragment>}
                    </Fragment>
                </div>
            </div>
        );
    } else {
        return <div></div>;
    }
}
