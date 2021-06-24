import React from "react";

export default function GreatSwordIcon(props) {
    const { iconStyle } = props;
    const { color, height, width } = iconStyle;

    return (
        <div>
            <svg
                version="1.0"
                xmlns="http://www.w3.org/2000/svg"
                width={width}
                height={height}
                viewBox="0 0 400.000000 400.000000"
                preserveAspectRatio="xMidYMid meet"
            >
                <g
                    transform="translate(0.000000,400.000000) scale(0.100000,-0.100000)"
                    fill={color}
                    stroke="none"
                >
                    <path
                        d="M2290 3119 c-371 -22 -614 -118 -805 -320 -120 -127 -224 -308 -289
-505 l-26 -80 2 -581 c2 -320 6 -585 10 -589 4 -4 164 64 355 150 192 86 351
156 356 156 4 0 7 -11 7 -24 0 -45 49 -180 88 -245 50 -83 120 -153 185 -185
50 -26 53 -26 299 -26 l248 0 0 170 0 170 -144 0 -144 0 -46 61 c-52 69 -76
138 -76 219 l0 55 75 29 c45 17 75 34 75 43 0 8 -27 50 -60 93 l-60 79 0 239
c0 247 12 352 54 469 25 71 254 400 376 542 l68 79 -36 6 c-48 8 -353 5 -512
-5z m155 -108 c-163 -76 -388 -234 -510 -356 -81 -80 -173 -207 -213 -292
l-27 -58 -3 -478 -3 -478 -72 -34 c-144 -67 -361 -165 -365 -165 -2 0 -2 242
0 538 l4 537 32 92 c17 51 46 121 63 155 92 183 283 379 451 464 124 62 398
111 638 112 l85 1 -80 -38z m151 -58 c-73 -96 -240 -349 -263 -400 -54 -118
-73 -252 -73 -525 0 -219 8 -275 49 -340 l28 -44 -166 -74 c-91 -40 -212 -95
-269 -122 -57 -26 -106 -48 -108 -48 -3 0 -4 206 -2 458 l3 457 29 55 c45 86
96 149 192 236 146 133 218 187 375 277 78 44 222 115 237 117 2 0 -12 -21
-32 -47z m-357 -1543 c0 -34 -4 -38 -109 -105 -60 -38 -113 -71 -118 -73 -6
-2 -15 19 -21 45 -20 91 -28 81 109 143 137 62 138 62 139 -10z m62 -166 l22
-36 -97 -97 -97 -96 -19 25 c-11 14 -29 39 -39 57 l-20 32 112 75 c62 41 113
75 114 76 1 0 11 -16 24 -36z m123 -110 c13 -5 16 -24 16 -106 l0 -99 -87 7
c-151 12 -148 6 -48 112 89 94 92 96 119 86z m220 -27 c0 -9 -1 -51 -2 -92
l-2 -75 -50 0 -50 0 0 89 0 90 38 4 c56 6 67 3 66 -16z"
                    />
                    <path
                        d="M2000 2378 c-52 -27 -80 -73 -80 -133 0 -84 55 -145 137 -152 91 -8
163 56 163 146 0 121 -114 193 -220 139z"
                    />
                    <path
                        d="M2001 1952 c-48 -24 -73 -62 -78 -119 -12 -121 90 -201 203 -158 122
46 129 222 11 275 -53 24 -92 25 -136 2z"
                    />
                </g>
            </svg>
        </div>
    );
}
