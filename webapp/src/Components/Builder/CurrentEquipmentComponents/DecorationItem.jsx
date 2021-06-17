import React, { useContext, useEffect, useState } from "react";
import { RiVipDiamondLine } from "react-icons/ri";
import { IoMdClose } from "react-icons/io";
import DecorationLvl1 from "./DecorationsSVG/DecorationLvl1";
import DecorationLvl2 from "./DecorationsSVG/DecorationLvl2";
import DecorationLvl3 from "./DecorationsSVG/DecorationLvl3";
import Modal from "react-modal";
import ModalDecoContent from "./ModalDecoContent";
import { BuilderContext, BuilderDispatchContext, BuilderStateContext } from "../../../Contexts/BuilderContext";


export default function DecorationItem(props) {
    /* Passed in deco object to be updated depending on 
     the deco item clicked */
    const lineThickness = "1px";
    const lineColor = "white";

    const { armorPiece, dispatch, skills } = props;
    const [modalState, setModalState] = useState({
        isOpen: false,
        currentDecoSlot: 0,
    });


    // Sets the armor type to the modal state for dispatch function once the armor piece
    // information has been recieved from the api
    useEffect(() => {
        if (armorPiece !== undefined) {
            setModalState((prevState) => ({
                ...prevState,
                armor: armorPiece,
            }));
        }
    }, [armorPiece]);

    const customStyle = {
        overlay: {
            backgroundColor: "rgba(10,10,20,0.5)",
        },
        content: {
            backgroundColor: "#3d464d",
            top: "40%",
            left: "40%",
            transform: "translate(-30%,-30%)",
        },
    };

    Modal.setAppElement("#root");

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

    const generateDecoClasses = (decoLvl, decoPosition) => {
        return decoLvl > 0
            ? `glass-card deco-container-${decoPosition} rounded-corners deco-white-border-hover`
            : `glass-card deco-container-${decoPosition} rounded-corners`;
    };

    // Opens the modal only if you are able to put a deco in said slot
    const openModal = (currentDecoPosition, armorPieceSlotLvl) => {
        if (armorPieceSlotLvl > 0) {
            setModalState((prevState) => ({
                ...prevState,
                isOpen: true,
                currentDecoSlot: currentDecoPosition,
            }));
        }
    };

    // Closes the modal
    const closeModal = () => {
        setModalState((prevState) => ({
            ...prevState,
            isOpen: false,
            currentDecoSlot: 0,
        }));
    };

    // Makes sure that all armor pieces are loaded bofore trying to load anything
    if (armorPiece === undefined) {
        return <div></div>;
    }

    if (armorPiece.type !== undefined) {
        let armorType = `${armorPiece.type
            .charAt(0)
            .toLowerCase()}${armorPiece.type.slice(1)}`;
    }

    return (
        <div className="flex-container">
            <Modal isOpen={modalState.isOpen} style={customStyle}>
                <ModalDecoContent
                    modalState={modalState}
                    skills={skills}
                    closeModal={closeModal}
                    dispatch={dispatch}
                ></ModalDecoContent>
            </Modal>
            <div
                id="deco-container1"
                className={generateDecoClasses(armorPiece.decoSlot1Lvl, 1)}
                onClick={() => openModal(1, armorPiece.decoSlot1Lvl)}
            >
                {GenerateDecoIcon(armorPiece.decoSlot1Lvl)}
                {/* Decoration 1  */}
                <span className="deco-content">{}</span>
            </div>
            <div
                id="deco-container2"
                className={generateDecoClasses(armorPiece.decoSlot2Lvl, 2)}
                onClick={() => openModal(2, armorPiece.decoSlot2Lvl)}
            >
                {/* Decoration 2  */}
                {GenerateDecoIcon(armorPiece.decoSlot2Lvl)}

                <span className="deco-content">Deco Name</span>
            </div>
            <div
                id="deco-container3"
                className={generateDecoClasses(armorPiece.decoSlot3Lvl, 3)}
                style={{ padding: "0px" }}
                onClick={() => openModal(3, armorPiece.decoSlot3Lvl)}
            >
                {/* Decoration 3  */}
                {GenerateDecoIcon(armorPiece.decoSlot3Lvl)}
                <span className="deco-content">Deco Name</span>
            </div>
        </div>
    );
}
