import React from "react";
import { RiVipDiamondLine } from "react-icons/ri";
import { IoMdClose } from "react-icons/io";
import DecorationLvl1 from "./DecorationsSVG/DecorationLvl1";
import DecorationLvl2 from "./DecorationsSVG/DecorationLvl2";
import DecorationLvl3 from "./DecorationsSVG/DecorationLvl3";

export default function DecorationItem(props) {
    /* Passed in deco object to be updated depending on 
     the deco item clicked */

    const lineThickness = "1px";
    const lineColor = "white";

    const { armorPiece } = props;

    //  Returns an icon depending on the deco slot level
    const GenerateDecoIcon = (decorationSlot) => {
        switch (decorationSlot) {
            case 1:
                return (
                    <div className="glass-card-header">
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
                    <div className="glass-card-header">
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
                    <div className="glass-card-header">
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
                    <div className="glass-card-header">
                        <RiVipDiamondLine
                            style={{
                                padding: "10px",
                                position: "relative",
                                bottom: "6px",
                            }}
                        ></RiVipDiamondLine>
                        <IoMdClose
                            style={{
                                position: "absolute",
                                top: "6px",
                                left: "13px",
                                fontSize: "20px",
                            }}
                        ></IoMdClose>
                    </div>
                );
        }
    };

    // Makes sure that all armor pieces are loaded bofore trying to load anything
    if (armorPiece === undefined) {
        return <div></div>;
    }

    return (
        <div className="flex-container">
            <div
                id="deco-container1"
                className="glass-card deco-container-1 rounded-corners white-border-hover"
                style={{padding:"0px"}}
            >
                {GenerateDecoIcon(armorPiece.decoSlot1Lvl)}
                {/* Decoration 1  */}
                <span className="deco-content">Deco Name</span>
            </div>
            <div
                id="deco-container2"
                className=" glass-card deco-container-2 rounded-corners white-border-hover"
                style={{padding:"0px"}}
            >
                {/* Decoration 2  */}
                {GenerateDecoIcon(armorPiece.decoSlot2Lvl)}

                <span className="deco-content">Deco Name</span>
            </div>
            <div
                id="deco-container3"
                className="glass-card deco-container-3 rounded-corners white-border-hover"
                style={{padding:"0px"}}
            >
                {/* Decoration 3  */}
                {GenerateDecoIcon(armorPiece.decoSlot3Lvl)}
                <span className="deco-content">Deco Name</span>
            </div>
        </div>
    );
}
