const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();

const SLIDESHOW_DIR = process.env.SLIDESHOW_DIR
const SLIDESHOW_PORT = process.env.SLIDESHOW_PORT || 3000;


/////

function is_image (path) {
    return path.endsWith('.jpg') ||
    path.endsWith('.JPG') ||
    path.endsWith('.JPEG') ||
    path.endsWith('.jpeg');
}

/////

app.get(['/','/index.html'],(req,res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
})

app.get('/getImageList', (req, res) => {
    fs.readdir(path.join(SLIDESHOW_DIR,"images"), (err, files) => {
        if (err) {
            res.status(500).send('Error reading directory');
            return;
        }

        // Filter .jpg files and sort by name
        const slides = files.filter(file => is_image(file));

        res.json(slides.sort());
    });
});

app.use('/images', express.static(path.join(SLIDESHOW_DIR, 'images')));

/////

app.listen(SLIDESHOW_PORT, () => {
    console.log(`Server running at http://localhost:${SLIDESHOW_PORT}`);
    console.log(`Slideshow directory set to ${SLIDESHOW_DIR}`); 
});
