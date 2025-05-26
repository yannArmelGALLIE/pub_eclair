const mongoose = require("mongoose");
require("dotenv").config({ path: "./config/.env" });

mongoose
  .connect(
    `mongodb+srv://${process.env.DB_USER_PASS}@cluster0.zbxoa.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`
  )
  .then(async () => {
    console.log("Connecté à MongoDB");

    const collection = mongoose.connection.db.collection("clients");
    const indexesToDrop = ["name_1", "surname_1"];

    for (const indexName of indexesToDrop) {
      try {
        const result = await collection.dropIndex(indexName);
        console.log(`Index supprimé : ${indexName}`, result);
      } catch (err) {
        console.warn(`Impossible de supprimer l'index ${indexName} : ${err.message}`);
      }
    }

    await mongoose.disconnect();
    console.log("Déconnecté de MongoDB");
  })
  .catch((err) => console.log("Connexion échouée :", err));
