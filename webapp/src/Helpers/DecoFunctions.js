import DecorationLvl1 from "../Components/Builder/CurrentEquipmentComponents/DecorationsSVG/DecorationLvl1";
import DecorationLvl2 from "../Components/Builder/CurrentEquipmentComponents/DecorationsSVG/DecorationLvl2";
import DecorationLvl3 from "../Components/Builder/CurrentEquipmentComponents/DecorationsSVG/DecorationLvl3";
import { RiVipDiamondLine } from "react-icons/ri";
import { IoMdClose } from "react-icons/io";

export const GenerateDecoIcon = (
    decorationSlot,
    lineColor,
    lineThickness,
    noHeader
) => {
    switch (decorationSlot) {
        case 1:
            return (
                <div className={noHeader === true ? "" : "glass-card-header"}>
                    <DecorationLvl1
                        height="20px"
                        width="20px"
                        lineColor={lineColor}
                        lineThickness={lineThickness}
                    ></DecorationLvl1>
                </div>
            );
        case 2:
            return (
                <div className={noHeader === true ? "" : "glass-card-header"}>
                    <DecorationLvl2
                        height="20px"
                        width="20px"
                        lineColor={lineColor}
                        lineThickness={lineThickness}
                    ></DecorationLvl2>
                </div>
            );
        case 3:
            return (
                <div className={noHeader === true ? "" : "glass-card-header"}>
                    <DecorationLvl3
                        height="20px"
                        width="20px"
                        lineColor={lineColor}
                        lineThickness={lineThickness}
                    ></DecorationLvl3>
                </div>
            );
        default:
            return (
                <div className={noHeader === true ? "" : "glass-card-header"}>
                    <RiVipDiamondLine
                        style={{
                            padding: "10px",
                            position: "relative",
                            bottom: "6px",
                        }}
                    ></RiVipDiamondLine>
                    {noHeader ? (
                        <IoMdClose
                            style={{
                                position: "absolute",
                                top: "1px",
                                left: "8px",
                                fontSize: "20px",
                            }}
                        ></IoMdClose>
                    ) : (
                        <IoMdClose
                            style={{
                                position: "absolute",
                                top: "6px",
                                left: "13px",
                                fontSize: "20px",
                            }}
                        ></IoMdClose>
                    )}
                </div>
            );
    }
};

export const generateDecoClasses = (decoLvl, decoPosition, equipmentType) => {
    if (decoLvl > 0 && equipmentType !== "talisman") {
        return `glass-card deco-container-${decoPosition} rounded-corners deco-white-border-hover`;
    } else if (equipmentType === "talisman") {
        return "glass-card talisman-deco-slot rounded-corners deco-white-border-hover";
    } else {
        return `glass-card deco-container-${decoPosition} rounded-corners`;
    }
};

// Returns a string
export const returnDecoString = (state, equipmentType, decoSlot) => {
    if (state.decorations[`${equipmentType}Deco${decoSlot}`] === undefined) {
        return "--";
    } else if (
        state.decorations[`${equipmentType}Deco${decoSlot}`].jewelName ===
        undefined
    ) {
        return "--";
    } else {
        return state.decorations[`${equipmentType}Deco${decoSlot}`].jewelName;
    }
};
