import ArmorItem from "../ArmorItem";
import DecorationItem from "../DecorationItem";

export default function HelmDecoGroup(props) {

    const {currentHelm, setCurrentSkills} = props; 

    return (
        <div>
            <ArmorItem armorPiece = {currentHelm} setCurrentSkills={setCurrentSkills}></ArmorItem>
            <DecorationItem armorPiece = {currentHelm} setCurrentSkills={setCurrentSkills} ></DecorationItem>
        </div>
    );
}
