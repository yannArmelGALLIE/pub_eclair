const ClientModel = require('../models/client.models');
const AdvertiserModel = require("../models/advertiser.models");
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

//Advertiser
module.exports.signUpAdvertiser = async (req, res) => {
    const {nameShop, nameAdvertiser, surnameAdvertiser, email, password} = req.body 

    try {
        const advertiser = await AdvertiserModel.create({nameShop, nameAdvertiser, surnameAdvertiser, email, password });
        res.status(201).json({ advertiser: advertiser._id});
    }
    catch(err) {
        const errors = signUpErrors(err);
        res.status(200).send({ errors });
    }


}

module.exports.signInAdvertiser = async (req, res) => {
    const {nameShop, password} = req.body

    try {
        const advertiser = await AdvertiserModel.login(nameShop,password);
        const token = createToken(advertiser._id);
        res.cookie('jwt', token, { httpOnly: true, maxAge});
        res.status(200).json({advertiser : advertiser._id})
    } catch (err) {
        const errors = signInErrors(err)
        res.status(200).send({ errors });
    }
}

module.exports.logoutAdvertiser = async (req, res) => {
    res.cookie('jwt', '', {maxAge: 1 });
    res.redirect('/');
}