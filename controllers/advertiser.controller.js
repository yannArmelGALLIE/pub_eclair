const AdvertiserModel = require("../models/advertiser.models");
const ObjectID = require("mongoose").Types.ObjectId;

module.exports.getAllAdvertisers = async (req, res) => {
  const advertisers = await AdvertiserModel.find().select("-password");
  res.status(200).json(advertisers);
};

module.exports.advertiserInfo = async (req, res) => {
  console.log(req.params);
  if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }
  try {
    const advertiser = await AdvertiserModel.findById(req.params.id).select("-password");
    if (!advertiser) {
      console.error("ID unknown :", req.params.id);
      return res.status(404).json({ error: "Utilisateur non trouvé" });
    }
    res.json(advertiser);
  } catch (err) {
    console.error("Erreur serveur :", err);
    res.status(500).json({ error: "Erreur serveur" });
  }
};

module.exports.updateAdvertiser = async (req, res) => {
  if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }

  try {
    const docs = await AdvertiserModel.findOneAndUpdate(
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

module.exports.deleteAdvertiser = async (req, res) => {
    if (!ObjectID.isValid(req.params.id)) {
    return res.status(400).send("ID unknown : " + req.params.id);
  }

  try {
    await AdvertiserModel.findByIdAndDelete({ _id: req.params.id}).exec();
    res.status(200).json({ message: "Successfully deleted"});
  } catch (err) {
    return res.status(500).json({ message: err});
  }

};

