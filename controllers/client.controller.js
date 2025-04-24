const ClientModel = require("../models/client.models");
const ObjectID = require("mongoose").Types.ObjectId;

module.exports.getAllClients = async (req, res) => {
  const clients = await ClientModel.find().select("-password");
  res.status(200).json(clients);
};

module.exports.clientInfo = async (req, res) => {
  console.log(req.params);
  if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }
  try {
    const client = await ClientModel.findById(req.params.id).select("-password");
    if (!client) {
      console.error("ID unknown :", req.params.id);
      return res.status(404).json({ error: "Utilisateur non trouvé" });
    }
    res.json(client);
  } catch (err) {
    console.error("Erreur serveur :", err);
    res.status(500).json({ error: "Erreur serveur" });
  }
};

module.exports.updateClient = async (req, res) => {
  if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }

  try {
    const docs = await ClientModel.findOneAndUpdate(
      { _id: req.params.id },
      {
        $set: {
          bio: req.body.bio,
        },
      },
      { new: true, upsert: true, setDefaultsOnInsert: true }
    ).select("-password");
    if (!docs) {
      return res.status(404).json({ error: "Utilisateur non trouvé" });
    }
    res.json(docs);
  } catch (err) {
    console.log(err);
    return res.status(500).json({ message: err });
  }
};

module.exports.deleteClient = async (req, res) => {
    if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }

  try {
    await ClientModel.findByIdAndDelete({ _id: req.params.id}).exec();
    res.status(200).json({ message: "Successfully deleted"});
  } catch (err) {
    return res.status(500).json({ message: err});
  }

};

