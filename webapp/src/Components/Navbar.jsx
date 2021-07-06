import React, { Fragment } from "react";
import { FaRegEdit } from "react-icons/fa";
import { BiHomeAlt } from "react-icons/bi";
import { HiOutlineMail } from "react-icons/hi";

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
                <a href="/contact">
                    <HiOutlineMail className="sidebar-icon"></HiOutlineMail>
                </a>
            </div>
        </Fragment>
    );
}