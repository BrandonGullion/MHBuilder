let trArray = document.getElementsByTagName("tr");
let weaponType = "SwitchAxe";
let phialOrShellingTypeArray = [];
let objectArray = [];
let nameArray = [];
let attackArray = [];
let elementArray = [];
let elementDamageArray = [];
let redSharpnessArray = [];
let orangeSharpnessArray = [];
let yellowSharpnessArray = [];
let greenSharpnessArray = [];
let blueSharpnessArray = [];
let whiteSharpnessArray = [];
let purpleSharpnessArray = [];
let defenseBoostArray = [];
let affinityArray = [];
let rarityArray = [];
let decoArray = [];
let rampageSkillStringArray = [];

// Gets the tables data
for (let i = 0; i < trArray.length; i++) {
    // This will return all of the names of the weapons
    const getCellName = (cell) => {
        let nameCell = cell.getElementsByTagName("a");
        if (nameCell[0] !== undefined) {
            nameArray.push(nameCell[0].innerText);
        }
    };
    const getCellSharpness = (cell) => {
        // Cells 2 - 7 are the sharpness
        let sharpnessDiv = cell.getElementsByTagName("div");
        if (sharpnessDiv.length !== 0) {
            redSharpnessArray.push(
                sharpnessDiv[1] === undefined
                    ? 0
                    : sharpnessDiv[1].style.width.slice(0, -1)
            );
            orangeSharpnessArray.push(
                sharpnessDiv[2] === undefined
                    ? 0
                    : sharpnessDiv[2].style.width.slice(0, -1)
            );
            yellowSharpnessArray.push(
                sharpnessDiv[3] === undefined
                    ? 0
                    : sharpnessDiv[3].style.width.slice(0, -1)
            );
            greenSharpnessArray.push(
                sharpnessDiv[4] === undefined
                    ? 0
                    : sharpnessDiv[4].style.width.slice(0, -1)
            );
            blueSharpnessArray.push(
                sharpnessDiv[5] === undefined
                    ? 0
                    : sharpnessDiv[5].style.width.slice(0, -1)
            );
            whiteSharpnessArray.push(
                sharpnessDiv[6] === undefined
                    ? 0
                    : sharpnessDiv[6].style.width.slice(0, -1)
            );
            purpleSharpnessArray.push(
                sharpnessDiv[7] === undefined
                    ? 0
                    : sharpnessDiv[7].style.width.slice(0, -1)
            );
        }
    };
    const getDecoSlots = (cell) => {
        let images = cell.getElementsByTagName("img");
        if (images.length === 0) {
            decoArray.push([0, 0, 0]);
        } else if (images.length === 1) {
            decoArray.push([returnDecoLvl(images[0].src), 0, 0]);
        } else if (images.length === 2) {
            decoArray.push([
                returnDecoLvl(images[0].src),
                returnDecoLvl(images[1].src),
                0,
            ]);
        } else if (images.length === 3) {
            decoArray.push([
                returnDecoLvl(images[0].src),
                returnDecoLvl(images[1].src),
                returnDecoLvl(images[2].src),
            ]);
        }
    };
    const getAttack = (cell) => {
        if (cell.innerText !== "") {
            attackArray.push(cell.innerText);
        }
    };
    const getElement = (cell) => {
        if (cell.innerText !== "") {
            if (cell.innerText === "None") {
                elementArray.push("None");
                elementDamageArray.push(0);
            } else if (cell.innerText === "--") {
                elementArray.push("None");
                elementDamageArray.push(0);
            } else {
                let cellText = cell.innerText;
                let textArray = cellText.split(/\s+/);
                elementArray.push(textArray[0]);
                elementDamageArray.push(textArray[1]);
            }
        }
    };
    const getAffinity = (cell) => {
        if (cell.innerText !== "") {
            affinityArray.push(cell.innerText.slice(0, -1));
        }
    };
    const getDefense = (cell) => {
        if (cell.innerText !== "") {
            defenseBoostArray.push(cell.innerText);
        }
    };
    const getRarity = (cell) => {
        if (cell.innerText !== "Rare") {
            let textArray = cell.innerText.split(/\s+/);
            rarityArray.push(textArray[1]);
        }
    };
    const getRampageSkills = (cell) => {
        let listItems = cell.getElementsByTagName("a");
        if (listItems.length === 0) {
            rampageSkillStringArray.push("Any");
        } else {
            let prepString = "";
            listItems[2] === undefined
                ? (prepString = `${listItems[0].innerText}/${listItems[1].innerText}`)
                : (prepString = `${listItems[0].innerText}/${listItems[1].innerText}/${listItems[2].innerText}`);
            rampageSkillStringArray.push(prepString);
        }
    };

    const getPhialType = (cell) => {
        phialOrShellingTypeArray.push(cell.innerText);
    }

    const returnDecoLvl = (imgSource) => {
        switch (imgSource) {
            case "https://monsterhunterrise.wiki.fextralife.com/file/Monster-Hunter-Rise/gem_level_1_icon_monster_hunter_rise_wiki_guide_24px.png":
                return 1;
            case "https://monsterhunterrise.wiki.fextralife.com/file/Monster-Hunter-Rise/gem_level_2_icon_monster_hunter_rise_wiki_guide_24px.png":
                return 2;
            case "https://monsterhunterrise.wiki.fextralife.com/file/Monster-Hunter-Rise/gem_level_3_icon_monster_hunter_rise_wiki_guide_24px.png":
                return 3;

            default:
                break;
        }
    };

    // If the data cells is 8 (size of table) then move onto next phase
    if (trArray[i].cells.length === 9) {
        // Both the sharpness and the name are contained in the same cell
        getCellName(trArray[i].cells.item(0));
        getCellSharpness(trArray[i].cells.item(0));
        getDecoSlots(trArray[i].cells.item(0));
        getAttack(trArray[i].cells.item(1));
        getElement(trArray[i].cells.item(2));
        getAffinity(trArray[i].cells.item(3));
        getPhialType(trArray[i].cells.item(4));
        getDefense(trArray[i].cells.item(5));
        getRarity(trArray[i].cells.item(6));
        getRampageSkills(trArray[i].cells.item(7));
    }
}
// Removes the first deco element because its a header
decoArray.shift();
phialOrShellingTypeArray.shift();
rampageSkillStringArray.shift();

function generateObjects() {
    let currentDecoArray = [];

    for (let i = 0; i < nameArray.length; i++) {
        currentDecoArray = decoArray[i];

        let weaponObject = {
            name: nameArray[i],
            type: weaponType,
            rarity: rarityArray[i],
            defenseIncrease: defenseBoostArray[i],
            phialOrShellingType: phialOrShellingTypeArray[i],
            damage: attackArray[i],
            elementType: elementArray[i],
            elementalDamage: elementDamageArray[i],
            affinity: affinityArray[i],
            redSharpness: redSharpnessArray[i],
            orangeSharpness: orangeSharpnessArray[i],
            yellowSharpness: yellowSharpnessArray[i],
            greenSharpness: greenSharpnessArray[i],
            blueSharpness: blueSharpnessArray[i],
            whiteSharpness: whiteSharpnessArray[i],
            purpleSharpness: purpleSharpnessArray[i],
            decoSlot1Lvl: currentDecoArray[0],
            decoSlot2Lvl: currentDecoArray[1],
            decoSlot3Lvl: currentDecoArray[2],
            stringRampageSkills: rampageSkillStringArray[i],
        };

        objectArray.push(weaponObject);
    }
}
generateObjects();
console.log(objectArray);
