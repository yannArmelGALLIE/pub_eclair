const ShopkeeperModel = require("../models/shopkeeper.models");
const ObjectID = require("mongoose").Types.ObjectId;

module.exports.getAllShopkeeper = async (req, res) => {
  const shopkeepers = await ShopkeeperModel.find().select("-password");
  res.status(200).json(shopkeepers);
};

module.exports.shopkeeperInfo = async (req, res) => {
  console.log(req.params);
  if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }
  try {
    const shopkeeper = await ShopkeeperModel.findById(req.params.id).select("-password");
    if (!shopkeeper) {
      console.error("ID unknown :", req.params.id);
      return res.status(404).json({ error: "Utilisateur non trouvé" });
    }
    res.json(shopkeeper);
  } catch (err) {
    console.error("Erreur serveur :", err);
    res.status(500).json({ error: "Erreur serveur" });
  }
};

module.exports.updateShopkeeper = async (req, res) => {
  if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }

  try {
    const docs = await ShopkeeperModel.findOneAndUpdate(
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

module.exports.deleteShopkeeper = async (req, res) => {
    if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }

  try {
    await ShopkeeperModel.findByIdAndDelete({ _id: req.params.id}).exec();
    res.status(200).json({ message: "Successfully deleted"});
  } catch (err) {
    return res.status(500).json({ message: err});
  }

};

