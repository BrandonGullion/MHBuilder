import React, { Fragment } from "react";
import { BsShieldShaded } from "react-icons/bs";
import {
    GiBroadsword,
    GiSwordWound,
} from "react-icons/gi";
import { RiSwordFill } from "react-icons/ri";
import SharpnessBar from "../../SharpnessBar";
import BowgunInfoBar from "../BowgunInfoBar";
import { renderElement } from "../../../../WeaponFunctions";
import MelodyBar from "../MelodyBar";
export default function WeaponItem(props) {
    const { weapon } = props;
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

    if (weapon !== undefined) {
        return (
            <div
                style={{ fontSize: "14px", margin:"5px 0px" }}
                className="glass-card-current-weapon armor-item rounded-corners"
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
                            {weapon.type === "ChargeBlade" ||
                            weapon.type === "GunLance" ? (
                                <Fragment>
                                    <label
                                        style={{
                                            margin: "0 0 0 10px",
                                            padding: "3px 0 0 0",
                                        }}
                                    >
                                        {weapon.phialOrShellingType}
                                    </label>
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
                        {weapon.type === "HuntingHorn" ? (
                            <MelodyBar melodies={weapon.melody}></MelodyBar>
                        ) : (
                            <Fragment></Fragment>
                        )}
                    </Fragment>
                </div>
            </div>
        );
    } else {
        return <div></div>;
    }
}
