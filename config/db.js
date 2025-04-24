const mongoose = require("mongoose");
require("dotenv").config({path: './.env'});


mongoose
  .connect(
    `mongodb+srv://${process.env.DB_USER_PASS}@cluster0.zbxoa.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`,
    {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    }
  )

  .then(() => console.log("connected to MongoDB"))
  .catch((err) => console.log("Failed to connect to MongoDB", err));