const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const imagesDirectory = path.join(__dirname, '../images');

function is_image (path) {
    return path.endsWith('.jpg') ||
    path.endsWith('.JPG') ||
    path.endsWith('.JPEG') ||
    path.endsWith('.jpeg');
}

/////

app.use(express.static('/images'));

app.get('/getSlides', (req, res) => {
    fs.readdir(imagesDirectory, (err, files) => {
        if (err) {
            res.status(500).send('Error reading directory');
            return;
        }

        // Filter .jpg files and sort by name
        const slides = files.filter(file => is_image(file));

        res.json(slides.sort());
    });
});

const port = 3000;
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
