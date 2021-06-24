import React from "react";
import BowIcon from "../SVGIcons/BowIcon";
import ChargeBladeIcon from "../SVGIcons/ChargeBladeIcon";
import DualBladeIcon from "../SVGIcons/DualBladeIcon";
import GreatSwordIcon from "../SVGIcons/GreatSwordIcon";
import GunLanceIcon from "../SVGIcons/GunLanceIcon";
import HammerIcon from "../SVGIcons/HammerIcon";
import HBGIcon from "../SVGIcons/HBGIcon";
import HuntingHornIcon from "../SVGIcons/HuntingHornIcon";
import LongSwordIcon from "../SVGIcons/LongSwordIcon";
import SnSIcon from "../SVGIcons/SnSIcon";
import SwitchAxeIcon from "../SVGIcons/SwitchAxeIcon";
import InsectGlaiveIcon from "../SVGIcons/HBGIcon";
import LanceIcon from "../SVGIcons/LanceIcon";
import LBGIcon from "../SVGIcons/LBGIcon";

export default function WeaponBanner() {
    return (
        <div style={{ display: "flex", flexDirection: "column" }}>
            <div style={{ display: "flex" }}>
                <BowIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></BowIcon>
                <ChargeBladeIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></ChargeBladeIcon>
                <DualBladeIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></DualBladeIcon>
                <GreatSwordIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></GreatSwordIcon>
            </div>
            <div style={{ display: "flex" }}>
                <GunLanceIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></GunLanceIcon>
                <HammerIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></HammerIcon>
                <HBGIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></HBGIcon>
                <HuntingHornIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></HuntingHornIcon>
            </div>
            <div style={{ display: "flex" }}>
                <InsectGlaiveIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></InsectGlaiveIcon>
                <LanceIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></LanceIcon>
                <LBGIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></LBGIcon>
                <LongSwordIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></LongSwordIcon>
            </div>

            <div style={{ display: "flex", margin: "0px 0px 0px 100px" }}>
                <SnSIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></SnSIcon>
                <SwitchAxeIcon
                    iconStyle={{
                        color: "#ccc",
                        width: "100px",
                        height: "100px",
                    }}
                ></SwitchAxeIcon>
            </div>
        </div>
    );
}
