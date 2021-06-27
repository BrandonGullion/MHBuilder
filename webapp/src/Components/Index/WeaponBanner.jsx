import React from "react";
import BowIcon from "../SVGIcons/BowIcon";
import ChargeBladeIcon from "../SVGIcons/ChargeBladeIcon";
import DualBladeIcon from "../SVGIcons/DualBladeIcon";
import GreatSwordIcon from "../SVGIcons/GreatSwordIcon";
import GunLanceIcon from "../SVGIcons/GunLanceIcon";
import HammerIcon from "../SVGIcons/HammerIcon";
import HeavyBowgunIcon from "../SVGIcons/HeavyBowgunIcon";
import HuntingHornIcon from "../SVGIcons/HuntingHornIcon";
import LongSwordIcon from "../SVGIcons/LongSwordIcon";
import SwordAndShieldIcon from "../SVGIcons/SwordAndShieldIcon";
import SwitchAxeIcon from "../SVGIcons/SwitchAxeIcon";
import InsectGlaiveIcon from "../SVGIcons/InsectGlaiveIcon";
import LanceIcon from "../SVGIcons/LanceIcon";
import LightBowgunIcon from "../SVGIcons/LightBowgunIcon";

export default function WeaponBanner() {
    return (
        <div style={{ display: "flex", flexDirection: "column" }}>
            <div style={{ display: "flex" }}>
                <BowIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></BowIcon>
                <ChargeBladeIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></ChargeBladeIcon>
                <DualBladeIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></DualBladeIcon>
                <GreatSwordIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></GreatSwordIcon>
            </div>
            <div style={{ display: "flex" }}>
                <GunLanceIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></GunLanceIcon>
                <HammerIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></HammerIcon>
                <HeavyBowgunIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></HeavyBowgunIcon>
                <HuntingHornIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></HuntingHornIcon>
            </div>
            <div style={{ display: "flex" }}>
                <InsectGlaiveIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></InsectGlaiveIcon>
                <LanceIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></LanceIcon>
                <LightBowgunIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></LightBowgunIcon>
                <LongSwordIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></LongSwordIcon>
            </div>

            <div style={{ display: "flex", margin: "0px 0px 0px 100px" }}>
                <SwordAndShieldIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></SwordAndShieldIcon>
                <SwitchAxeIcon
                    style={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></SwitchAxeIcon>
            </div>
        </div>
    );
}
