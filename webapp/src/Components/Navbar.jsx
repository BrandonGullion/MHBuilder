import React, { Fragment } from "react";
import { FaRegEdit } from "react-icons/fa";
import { BiHomeAlt, BiHelpCircle } from "react-icons/bi";
import { HiOutlineMail } from "react-icons/hi";
import {MdDeveloperMode} from "react-icons/md";


export default function Navbar(){
    return (
        <Fragment>
            <div className="sidebar">
                <a href="/">
                    <BiHomeAlt className="sidebar-icon"></BiHomeAlt>
                </a>
                <a href="/builder">
                    <FaRegEdit className="sidebar-icon"></FaRegEdit>
                </a>
                <a href="/">
                    <HiOutlineMail className="sidebar-icon"></HiOutlineMail>
                </a>
                <a href="/">
                    <BiHelpCircle className="sidebar-icon"></BiHelpCircle>
                </a>
                <a href="/dev">
                    <MdDeveloperMode className="sidebar-icon"></MdDeveloperMode>
                </a>
            </div>
        </Fragment>
    );
}