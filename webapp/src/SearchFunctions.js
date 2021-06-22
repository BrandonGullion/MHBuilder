// Takes in search text and the desired list to filter.
export function filterList(searchCriteria, arrayToFilter) {

    if(searchCriteria === ""){
        return arrayToFilter;
    }

    let array = [];
    arrayToFilter.forEach((element) => {
        if (element.jewelName.toLowerCase().includes(searchCriteria.toLowerCase())) {
            array.push(element);
        }
    });
    return array;
}
