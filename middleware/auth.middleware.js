const jwt = require('jsonwebtoken');
const ClientModel = require('../models/client.models');
const AdvertiserModel = require('../models/advertiser.models');

module.exports.checkClient = (req, res, next) => {
    const token = req.cookies.jwt
    if (token) {
        jwt.verify(token, process.env.TOKEN_SECRET, async(err, decodedToken) => {
            if (err) {
                res.locals.client = null;
                res.cookie('jwt', '', {maxAge: 1});
                next();
            } else {
                console.log('decoded token' + decodedToken);
                let client = await ClientModel.findById(decodedToken.id);
                res.locals.client = client;
                console.log(res.locals.client);
                next();
            }
        })
    } else {
        res.locals.client = null;
        next();
    }
}

module.exports.checkAdvertiser = (req, res, next) => {
    const token = req.cookies.jwt
    if (token) {
        jwt.verify(token, process.env.TOKEN_SECRET, async(err, decodedToken) => {
            if (err) {
                res.locals.advertiser = null;
                res.cookie('jwt', '', {maxAge: 1});
                next();
            } else {
                console.log('decoded token' + decodedToken);
                let advertiser = await AdvertiserModel.findById(decodedToken.id);
                res.locals.advertiser = advertiser;
                console.log(res.locals.advertiser);
                next();
            }
        })
    } else {
        res.locals.advertiser = null;
        next();
    }
}

module.exports.requireAuth = (req, res, next) => {
    const token = req.cookies.jwt;
    if (token) {
        jwt.verify(token, process.env.TOKEN_SECRET, async(err, decodedToken) => {
            if (err) {
                console.log(err)
            } else {
                console.log(decodedToken.id);
                next();
            }
        })
    } else {
        console.log('No token');
    }
};