const ClientModel = require('../models/client.models');
const ShopkeeperModel = require("../models/shopkeeper.models");
const jwt = require('jsonwebtoken');
const { signUpClientErrors, signInErrors } = require('../utils/errors.utils');

//Cookies
const maxAge = 3 * 24 * 60 * 1000;
const createToken = (id) => {
    return jwt.sign({id}, process.env.TOKEN_SECRET, {
        expiresIn: maxAge
    })
}

//Client
module.exports.signUpClient = async (req, res) => {
    const {name, surname, email, password} = req.body 

    try {
        const client = await ClientModel.create({name, surname, email, password });
        res.status(201).json({ client: client._id});
    }
    catch(err) {
        const errors = signUpErrors(err);
        res.status(200).send({ errors });
    }


}

module.exports.signInClient = async (req, res) => {
    const {email, password} = req.body

    try {
        const client = await ClientModel.login(email,password);
        const token = createToken(client._id);
        res.cookie('jwt', token, { httpOnly: true, maxAge});
        res.status(200).json({client : client._id})
    } catch (err) {
        const errors = signInErrors(err)
        res.status(200).send({ errors });
    }
}

module.exports.logoutClient = async (req, res) => {
    res.cookie('jwt', '', {maxAge: 1 });
    res.redirect('/');
}

//Shopkeepers
module.exports.signUpShopkeeper = async (req, res) => {
    const {nameShop, nameShopkeeper, surnameShopkeeper, email, password} = req.body 

    try {
        const shopkeeper = await ShopkeeperModel.create({nameShop, nameShopkeeper, surnameShopkeeper, email, password });
        res.status(201).json({ shopkeeper: shopkeeper._id});
    }
    catch(err) {
        const errors = signUpErrors(err);
        res.status(200).send({ errors });
    }


}

module.exports.signInShopkeeper = async (req, res) => {
    const {nameShop, password} = req.body

    try {
        const shopkeeper = await ShopkeeperModel.login(nameShop,password);
        const token = createToken(shopkeeper._id);
        res.cookie('jwt', token, { httpOnly: true, maxAge});
        res.status(200).json({shopkeeper : shopkeeper._id})
    } catch (err) {
        const errors = signInErrors(err)
        res.status(200).send({ errors });
    }
}

module.exports.logoutShopkeeper = async (req, res) => {
    res.cookie('jwt', '', {maxAge: 1 });
    res.redirect('/');
}