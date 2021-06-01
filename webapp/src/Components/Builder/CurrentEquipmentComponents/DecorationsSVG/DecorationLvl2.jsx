import React from "react";

export default function DecorationLvl2(props) {
    const { lineThickness, lineColor, height, width } = props;

    return (
        <svg
            style={{padding:"10px", position:"relative", bottom:"7px"}}
            height={height}
            width={width}
            version="1.1"
            viewBox="0 0 16.369 16.133"
            xmlns="http://www.w3.org/2000/svg"
        >
            <g
                transform="translate(-32.826 -7.812)"
                fill="none"
                stroke={lineColor}
            >
                <g strokeWidth={lineThickness}>
                    <path d="m10.583 7.9375h7.9375l3.9688 3.5719-7.9375 8.3344-7.9375-8.3344z" />
                    <path d="m37.042 7.9375h7.9375l3.9688 3.5719-7.9375 8.3344-7.9375-8.3344z" />
                    <path d="m62.177 7.9375h7.9375l3.9688 3.5719-7.9375 8.3344-7.9375-8.3344z" />
                </g>
                <g strokeWidth={lineThickness}>
                    <path d="m14.552 21.167-2.6458 3.9688h5.2917l-2.6458-3.9688" />
                    <path d="m35.719 19.844-2.6458 3.9688h5.2917l-2.6458-3.9688" />
                    <path d="m46.302 19.844-2.6458 3.9688h5.2917l-2.6458-3.9688" />
                    <path d="m59.531 18.521-2.6458 3.9688h5.2917l-2.6458-3.9688" />
                    <path d="m72.76 18.521-2.6458 3.9688h5.2917l-2.6458-3.9688" />
                    <path d="m66.146 22.49-2.6458 3.9688h5.2917l-2.6458-3.9688" />
                </g>
            </g>
        </svg>
    );
}
