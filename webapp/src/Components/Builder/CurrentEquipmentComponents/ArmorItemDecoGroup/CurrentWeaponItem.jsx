import React from "react";
import { BsShieldShaded } from "react-icons/bs";
import { GiBroadsword, GiSwordWound } from "react-icons/gi";
import { RiSwordFill } from "react-icons/ri";
import SharpnessBar from "../../SharpnessBar";

export default function CurrentWeaponItem(props) {
    const { weapon, dispatch } = props;

    if (weapon !== undefined) {
        return (
            <div
                className="glass-card-current-weapon armor-item rounded-corners"
                onClick={() =>
                    dispatch({ type: "SET_WEAPON", payload: weapon })
                }
            >
                <SharpnessBar
                    redSharpness={weapon.redSharpness}
                    orangeSharpness={weapon.orangeSharpness}
                    yellowSharpness={weapon.yellowSharpness}
                    greenSharpness={weapon.greenSharpness}
                    blueSharpness={weapon.blueSharpness}
                    whiteSharpness={weapon.whiteSharpness}
                    purpleSharpness={weapon.purpleSharpness}
                ></SharpnessBar>
                <div
                    className="glass-card-header"
                    style={{ padding: "0px 15px 10px", fontSize: "2.2rem" }}
                >
                    <GiBroadsword></GiBroadsword>
                </div>
                <div className="glass-card-content armor-item-content">
                    <div className="flex-container justify-space-around">
                        <h4 className="pad-left-10 pad-top-5">{weapon.name}</h4>
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
                    </div>
                </div>
            </div>
        );
    } else {
        return <div></div>;
    }
}
