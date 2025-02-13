const express = require('express');
const server = express();
const indexRoutes = require('./routes/indexRoutes');
const cors = require('cors');
const port = process.env.PORT || 3000;

server.use(express.json());
server.use(cors({ origin: "http://127.0.0.1:5500" }));
server.use(express.static('public'));


server.get('/', (req, res) => {
  res.json('Hello World!');
});
server.use("/", indexRoutes);


server.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});