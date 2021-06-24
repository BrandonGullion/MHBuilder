import FireIcon from "./Images/ElementIcons/Element_Water_Icon.png";
import WaterIcon from "./Images/ElementIcons/Element_Water_Icon.png";
import ThunderIcon from "./Images/ElementIcons/Element_Thunder_Icon.png";
import IceIcon from "./Images/ElementIcons/Element_Ice_Icon.png";
import DragonIcon from "./Images/ElementIcons/Element_Dragon_Icon.png";
import SleepIcon from "./Images/ElementIcons/Status_Sleep_Icon.png";
import BlastIcon from "./Images/ElementIcons/Status_Blastblight_Icon.png";
import ParalysisIcon from "./Images/ElementIcons/Status_Paralysis_Icon.png";
import PoisonIcon from "./Images/ElementIcons/Status_Poison_Icon.png";

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
