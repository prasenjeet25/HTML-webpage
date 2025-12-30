const express = require('express');
const app = express();

const PORT = 4000;

const studentRouter = require('./routes/students');

app.use(express.json())
app.use('/students', studentRouter);

app.listen(PORT, () => {
  console.log(`Server started at port ${PORT}`);
});
