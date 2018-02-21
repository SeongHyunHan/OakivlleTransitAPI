const extract = require('extract-zip');

const filename = 'oakville_transit';

const extractZip = () => {
    extract(`./GTFS/oakville_transit.zip`, {dir: 'C:/Users/hans/Documents/Seong/OakvilleTransitAPI/GTFS/'}, (err) => {
        console.log(err);
    })
}

module.exports = {
    extractZip
}