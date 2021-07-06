import FireIcon from "./Images/ElementIcons/Element_Water_Icon.png";
import WaterIcon from "./Images/ElementIcons/Element_Water_Icon.png";
import ThunderIcon from "./Images/ElementIcons/Element_Thunder_Icon.png";
import IceIcon from "./Images/ElementIcons/Element_Ice_Icon.png";
import DragonIcon from "./Images/ElementIcons/Element_Dragon_Icon.png";
import SleepIcon from "./Images/ElementIcons/Status_Sleep_Icon.png";
import BlastIcon from "./Images/ElementIcons/Status_Blastblight_Icon.png";
import ParalysisIcon from "./Images/ElementIcons/Status_Paralysis_Icon.png";
import PoisonIcon from "./Images/ElementIcons/Status_Poison_Icon.png";
import React from "react";
import GreatSwordIcon from "./Components/SVGIcons/GreatSwordIcon";
import SwordAndShieldIcon from "./Components/SVGIcons/SwordAndShieldIcon";
import LightBowgunIcon from "./Components/SVGIcons/LightBowgunIcon";
import HeavyBowgunIcon from "./Components/SVGIcons/HeavyBowgunIcon";
import LanceIcon from "./Components/SVGIcons/LanceIcon";
import DualBladeIcon from "./Components/SVGIcons/DualBladeIcon";
import GunLanceIcon from "./Components/SVGIcons/GunLanceIcon";
import HuntingHornIcon from "./Components/SVGIcons/HuntingHornIcon";
import ChargeBladeIcon from "./Components/SVGIcons/ChargeBladeIcon";
import BowIcon from "./Components/SVGIcons/BowIcon";
import HammerIcon from "./Components/SVGIcons/HammerIcon";
import InsectGlaiveIcon from "./Components/SVGIcons/InsectGlaiveIcon";
import LongSwordIcon from "./Components/SVGIcons/LongSwordIcon";
import SwitchAxeIcon from "./Components/SVGIcons/SwitchAxeIcon";


const weaponRarityColors = {
    0: "#ccc",
    1: "#ccc",
    2: "#dced3e",
    3: "#cc354c",
    4: "#207d1e",
    5: "#2b79ad",
    6: "#673ce8",
    7: "#ff1717",
};

export const renderElement = (weapon) => {
    switch (weapon.elementType) {
        case "Fire":
            return (
                <div>
                    <img
                        alt="Fire Element"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={FireIcon}
                    ></img>
                </div>
            );
        case "Water":
            return (
                <div>
                    <img
                        alt="Water Element"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={WaterIcon}
                    ></img>
                </div>
            );
        case "Thunder":
            return (
                <div>
                    <img
                        alt="Thunder Element"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={ThunderIcon}
                    ></img>
                </div>
            );
        case "Dragon":
            return (
                <div>
                    <img
                        alt="Dragon Element"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={DragonIcon}
                    ></img>
                </div>
            );
        case "Ice":
            return (
                <div>
                    <img
                        alt="Ice Element"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={IceIcon}
                    ></img>
                </div>
            );
        case "Sleep":
            return (
                <div>
                    <img
                        alt="Sleep Status"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={SleepIcon}
                    ></img>
                </div>
            );
        case "Paralysis":
            return (
                <div>
                    <img
                        alt="Paralysis Status"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={ParalysisIcon}
                    ></img>
                </div>
            );
        case "Poison":
            return (
                <div>
                    <img
                        alt="Poison Status"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={PoisonIcon}
                    ></img>
                </div>
            );
        case "Blast":
            return (
                <div>
                    <img
                        alt="Blast Status"
                        style={{
                            width: "25px",
                            margin: "0px 0px 0px 10px",
                        }}
                        src={BlastIcon}
                    ></img>
                </div>
            );
        default:
            break;
    }
};

// Takes in weapon type and outputs a tag that should have the same name as
// The icon componenet
export const renderWeaponIcon = (weapon) => {
    switch (weapon.type) {
        case "GreatSword":
            return (
                <GreatSwordIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></GreatSwordIcon>
            );
        case "SwordAndShield":
            return (
                <SwordAndShieldIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></SwordAndShieldIcon>
            );
        case "LightBowgun":
            return (
                <LightBowgunIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></LightBowgunIcon>
            );
        case "HeavyBowgun":
            return (
                <HeavyBowgunIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></HeavyBowgunIcon>
            );
        case "Lance":
            return (
                <LanceIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></LanceIcon>
            );

        case "GunLance":
            return (
                <GunLanceIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></GunLanceIcon>
            );

        case "HuntingHorn":
            return (
                <HuntingHornIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></HuntingHornIcon>
            );
        case "ChargeBlade":
            return (
                <ChargeBladeIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></ChargeBladeIcon>
            );
        case "Bow":
            return (
                <BowIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></BowIcon>
            );
        case "DualBlades":
            return (
                <DualBladeIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></DualBladeIcon>
            );
        case "Hammer":
            return (
                <HammerIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></HammerIcon>
            );
        case "InsectGlaive":
            return (
                <InsectGlaiveIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></InsectGlaiveIcon>
            );
        case "LongSword":
            return (
                <LongSwordIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></LongSwordIcon>
            );
        case "SwitchAxe":
            return (
                <SwitchAxeIcon
                    style={{
                        color: weaponRarityColors[`${weapon.rarity}`],
                        height: "60px",
                        width: "60px",
                    }}
                ></SwitchAxeIcon>
            );
        default:
            break;
    }
};
