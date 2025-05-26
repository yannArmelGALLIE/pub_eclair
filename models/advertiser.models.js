const mongoose = require('mongoose');
const { isEmail, trim} = require('validator');
const bcrypt = require('bcrypt');

const AdvertiserSchema = new mongoose.Schema(
    {
        nameShop : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            unique: true,
            trim: true
        },
        advertiserLastName : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            unique: true,
            trim: true
        },
        advertiserFirstName : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            unique: true,
            trim: true
        },
        email : {
            type: String,
            required: true,
            validate: [isEmail],
            lowercase: true,
            unique: true,
            trim: true
        },
        phoneNumber : {
            type: String,
            required: true,
            minLength: 8,
            maxLength: 20,
            unique: true,
            trim: true
        },
        password: {
            type: String,
            required: true,
            max: 1024,
            minLength: 8,
        },
        location: {
            type: String,
            trim: true,
        } 
    },
    {
        timestamps: true,
    }
);
AdvertiserSchema.pre("save", async function name(next) {
        const salt = await bcrypt.genSalt();
        this.password = await bcrypt.hash(this.password, salt);
        next();
})

AdvertiserSchema.statics.login = async function name(email, password) {
    const advertiser = await this.findOne({ email });
    if (advertiser) {
        const auth = await bcrypt.compare(password, advertiser.password);
        if (auth) {
            return advertiser;
        }
        throw Error('incorrect password');
    }
    throw Error('incorrect email')
};

module.exports = mongoose.model('advertiser', AdvertiserSchema);