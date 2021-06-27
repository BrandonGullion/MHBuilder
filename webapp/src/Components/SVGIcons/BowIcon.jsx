import React from "react";

export default function BowIcon(props) {
    const { style } = props;
    const { color, height, width } = style;

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
                        d="M1204 3109 c-18 -5 -48 -27 -68 -49 -33 -37 -36 -45 -36 -103 l0 -64
105 -102 105 -102 0 -114 0 -113 30 -25 c17 -14 30 -28 30 -31 0 -3 -19 -6
-41 -6 -35 0 -48 -6 -80 -39 -39 -39 -45 -57 -40 -128 l3 -33 -117 0 -116 0
-95 -66 -94 -65 0 -70 0 -69 80 -56 c44 -30 82 -60 85 -65 4 -5 62 -9 131 -9
l124 0 0 -64 c0 -55 4 -69 26 -95 27 -32 80 -53 114 -44 14 4 20 0 20 -11 0
-9 -4 -16 -10 -16 -5 0 -19 -9 -30 -20 -18 -18 -20 -33 -20 -129 l0 -110 -101
-98 c-85 -83 -102 -105 -110 -142 -13 -60 2 -100 56 -150 39 -36 51 -41 90
-41 64 0 87 15 193 124 l93 96 141 0 141 0 69 40 c44 25 82 40 104 40 31 0 34
-3 34 -30 0 -29 -2 -30 -43 -30 -111 0 -138 -102 -47 -184 51 -46 103 -59 197
-50 66 6 80 11 122 45 90 70 96 85 95 231 0 127 0 128 -30 165 -17 21 -53 55
-80 75 l-49 38 -277 0 c-318 0 -315 -1 -233 80 25 24 45 51 45 58 0 12 10 13
50 8 85 -11 148 2 192 42 l38 34 0 109 0 109 69 0 69 0 153 -155 153 -155 385
0 386 0 -178 178 -177 177 0 70 0 70 151 150 c83 83 159 162 170 178 l20 27
-384 0 -385 0 -138 -149 -139 -149 -77 -1 -78 -1 0 105 c0 102 -1 105 -31 140
l-31 35 -110 0 c-74 0 -107 3 -103 11 4 5 -16 33 -44 61 -90 90 -95 88 236 88
l287 0 73 73 73 73 0 120 c0 115 -1 122 -29 165 -36 58 -95 107 -146 120 -23
7 -69 8 -111 4 -85 -8 -142 -43 -175 -107 -17 -34 -18 -44 -9 -74 16 -46 49
-67 100 -62 38 3 40 2 40 -24 0 -26 -3 -28 -39 -28 -28 0 -60 12 -109 40 l-69
40 -138 0 -139 0 -111 110 c-120 118 -130 123 -211 99z m137 -136 c32 -31 59
-61 59 -67 0 -7 -20 -32 -45 -56 l-45 -44 -60 59 c-67 67 -77 101 -38 142 34
37 63 29 129 -34z m872 8 l52 -50 3 -90 4 -90 -52 -56 -53 -55 -282 0 -281 0
-27 -28 c-22 -22 -27 -38 -27 -76 0 -43 4 -52 50 -100 l50 -53 0 -131 0 -132
-40 0 -40 0 0 101 0 101 -90 93 -90 93 0 113 0 113 42 43 42 43 149 0 148 0
73 -40 c66 -37 79 -40 147 -40 45 0 80 5 87 12 7 7 12 43 12 92 0 100 -11 116
-84 116 l-51 1 37 34 c35 33 42 35 104 35 65 0 66 0 117 -49z m387 -638 c0 -4
-48 -56 -107 -115 l-108 -108 -60 0 -60 0 116 115 116 115 51 0 c29 0 52 -3
52 -7z m410 0 c0 -4 -48 -56 -107 -115 l-108 -108 -60 0 -60 0 116 115 116
115 51 0 c29 0 52 -3 52 -7z m-305 -113 l-110 -109 -57 -1 c-32 0 -58 3 -58 7
0 3 46 53 102 110 l102 103 65 0 66 0 -110 -110z m-1281 59 c23 -26 26 -40 26
-100 l0 -69 -80 0 -80 0 0 77 c0 65 3 80 22 100 32 34 79 31 112 -8z m483 9
c20 -19 23 -31 23 -100 l0 -78 -80 0 -80 0 0 100 0 100 57 0 c44 0 62 -5 80
-22z m-707 -303 l0 -115 -93 0 -94 0 -73 53 c-40 28 -75 57 -77 64 -2 6 28 34
68 62 l72 51 99 0 98 0 0 -115z m1580 5 l0 -40 -745 0 -745 0 0 40 0 40 745 0
745 0 0 -40z m-1330 -192 c0 -67 -2 -74 -32 -105 -38 -39 -72 -42 -105 -11
-20 19 -23 31 -23 105 l0 83 80 0 80 0 0 -72z m200 -64 l0 -135 -50 -53 c-45
-48 -50 -57 -50 -99 0 -34 6 -53 24 -74 l24 -28 285 -3 285 -3 51 -54 51 -54
0 -82 0 -82 -58 -59 c-58 -57 -60 -58 -115 -58 -49 0 -61 4 -92 31 -19 17 -35
35 -35 40 0 5 22 9 48 9 26 0 53 5 60 12 7 7 12 44 12 94 0 74 -2 84 -22 98
-42 30 -119 21 -208 -24 l-80 -40 -157 0 -157 0 -38 37 -38 37 0 115 0 115 90
92 90 91 0 107 0 106 40 0 40 0 0 -136z m280 54 c0 -108 -16 -128 -102 -128
l-58 0 0 105 0 105 80 0 80 0 0 -82z m563 -34 c64 -64 117 -118 117 -120 0 -2
-26 -4 -58 -4 l-57 0 -120 120 -120 120 60 0 60 0 118 -116z m212 -4 l120
-120 -60 0 -60 0 -120 120 -120 120 60 0 60 0 120 -120z m203 7 c61 -62 112
-116 112 -120 0 -4 -26 -7 -58 -7 l-57 0 -120 120 -120 120 65 0 65 0 113
-113z m-1548 -632 c49 -50 50 -47 -33 -124 -52 -49 -84 -56 -117 -26 -36 32
-26 73 33 137 28 31 57 57 62 57 6 1 31 -19 55 -44z"
                    />
                </g>
            </svg>
        </div>
    );
}