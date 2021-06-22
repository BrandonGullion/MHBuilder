import React, { useContext, useEffect, useState } from "react";
import { RiVipDiamondLine } from "react-icons/ri";
import { IoMdClose } from "react-icons/io";
import DecorationLvl1 from "./DecorationsSVG/DecorationLvl1";
import DecorationLvl2 from "./DecorationsSVG/DecorationLvl2";
import DecorationLvl3 from "./DecorationsSVG/DecorationLvl3";
import Modal from "react-modal";
import ModalDecoContent from "./ModalDecoContent";
import {
    BuilderDispatchContext,
    BuilderStateContext,
} from "../../../Contexts/BuilderContext";

export default function DecorationItem(props) {
    const dispatch = useContext(BuilderDispatchContext);
    const state = useContext(BuilderStateContext);

    let equipmentType = "";

    /* Passed in deco object to be updated depending on 
     the deco item clicked */
    const lineThickness = "1px";
    const lineColor = "white";

    // The armor piece should not be accessed through context due to one
    // component affecting many different armor types
    const { equipment } = props;

    const [modalState, setModalState] = useState({
        isOpen: false,
        currentDecoSlot: 0,
        currentDecoLvl:0,
        armor:{},
    });

    // Sets the armor type to the modal state for dispatch function once the armor piece
    // information has been recieved from the api
    useEffect(() => {
        if (equipment !== undefined) {
            setModalState((prevState) => ({
                ...prevState,
                armor: equipment,
            }));
        }
    }, [equipment]);

    // Style for the modal
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

    // Linking the modal to the root element to avoid errors
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

    // Returns a string
    const returnDecoString = (state, equipmentType, decoSlot) => {
        if (
            state.decorations[`${equipmentType}Deco${decoSlot}`] === undefined
        ) {
            return "--";
        } else if (
            state.decorations[`${equipmentType}Deco${decoSlot}`].jewelName ===
            undefined
        ) {
            return "--";
        } else {
            return state.decorations[`${equipmentType}Deco${decoSlot}`]
                .jewelName;
        }
    };

    // Opens the modal only if you are able to put a deco in said slot
    const openModal = (currentDecoPosition, equipmentSlotLvl) => {
        if (equipmentSlotLvl > 0) {
            setModalState((prevState) => ({
                ...prevState,
                isOpen: true,
                currentDecoSlot: currentDecoPosition,
                currentDecoLvl: equipmentSlotLvl,
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
    if (equipment === undefined) {
        return <div></div>;
    }

    if (equipment.type !== undefined) {
        // it must be a weapon
        if (equipment.damage !== undefined) {
            equipmentType = "weapon";
        }
        // It must be armor
        else {
            equipmentType = `${equipment.type
                .charAt(0)
                .toLowerCase()}${equipment.type.slice(1)}`;
        }
    }

    return (
        <div className="flex-container">
            <Modal isOpen={modalState.isOpen} style={customStyle}>
                <ModalDecoContent
                    modalState={modalState}
                    closeModal={closeModal}
                    dispatch={dispatch}
                ></ModalDecoContent>
            </Modal>
            <div
                id="deco-container1"
                className={generateDecoClasses(equipment.decoSlot1Lvl, 1)}
                onClick={() => openModal(1, equipment.decoSlot1Lvl)}
            >
                {GenerateDecoIcon(equipment.decoSlot1Lvl)}
                {/* Decoration 1  */}
                <span className="deco-content">
                    {returnDecoString(state, equipmentType, 1)}
                </span>
            </div>
            <div
                id="deco-container2"
                className={generateDecoClasses(equipment.decoSlot2Lvl, 2)}
                onClick={() => openModal(2, equipment.decoSlot2Lvl)}
            >
                {/* Decoration 2  */}
                {GenerateDecoIcon(equipment.decoSlot2Lvl)}

                <span className="deco-content">
                    {returnDecoString(state, equipmentType, 2)}
                </span>
            </div>
            <div
                id="deco-container3"
                className={generateDecoClasses(equipment.decoSlot3Lvl, 3)}
                style={{ padding: "0px" }}
                onClick={() => openModal(3, equipment.decoSlot3Lvl)}
            >
                {/* Decoration 3  */}
                {GenerateDecoIcon(equipment.decoSlot3Lvl)}
                <span className="deco-content">
                    {returnDecoString(state, equipmentType, 3)}
                </span>
            </div>
        </div>
    );
}
