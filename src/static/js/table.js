// Use these as the two alternating row colors
const rowColor1 = 'lightblue';
const rowColor2 = 'lavender';

// A helper function that will make an array of rows from the given data array
// The columns for the row are specified as a string array of property names
function makeRows(data, columns) {
    const rows = [];

    for (let i = 0; i < data.length; i++) {
        const row = document.createElement('div');
        row.classList.add('record-row');
        row.style.backgroundColor = i % 2 ? rowColor1 : rowColor2;

        for (const column of columns) {
            // Check if the value is a string, if so make a new div and set the text
            // If not assume it is already an HTMLElement and add to row directly
            const value = data[i][column];
            if (typeof value === 'string' || typeof value === 'number') {
                const cell = document.createElement('div');
                cell.classList.add('record-cell');

                cell.innerHTML = value;
                row.append(cell);
            } else {
                value.classList.add('record-cell');
                row.append(value);
            }
        }

        rows.push(row);
    }

    return rows;
}