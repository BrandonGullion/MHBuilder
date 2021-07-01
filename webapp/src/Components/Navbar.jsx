import React, { Fragment } from "react";
import { FaRegEdit } from "react-icons/fa";
import { BiHomeAlt } from "react-icons/bi";
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
                <a href="/dev">
                    <MdDeveloperMode className="sidebar-icon"></MdDeveloperMode>
                </a>
                <a href="/login">Login</a>

                <a href="/dev">Dev</a>
            </div>
        </Fragment>
    );
}