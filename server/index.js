const express = require('express');
const server = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON request bodies
server.use(express.json());
server.use(express.static('public'));


server.get('/', (req, res) => {
  res.json('Hello World!');
});


server.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});