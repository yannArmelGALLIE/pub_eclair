const mongoose = require('mongoose');
const { isEmail} = require('validator');
const bcrypt = require('bcrypt');

const ShopkeeperSchema = new mongoose.Schema(
    {
        nameShop : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            unique: true,
            trim: true
        },
        nameShopkeeper : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            unique: true,
            trim: true
        },
        surnameShopkeeper : {
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
        password: {
            type: String,
            required: true,
            max: 1024,
            minLength: 6,
        }, 
    },
    {
        timestamps: true,
    }
);
ShopkeeperSchema.pre("save", async function name(next) {
        const salt = await bcrypt.genSalt();
        this.password = await bcrypt.hash(this.password, salt);
        next();
})

ShopkeeperSchema.statics.login = async function name(email, password) {
    const shopkeeper = await this.findOne({ email });
    if (shopkeeper) {
        const auth = await bcrypt.compare(password, shopkeeper.password);
        if (auth) {
            return shopkeeper;
        }
        throw Error('incorrect password');
    }
    throw Error('incorrect email')
};

module.exports = mongoose.model('shopkeeper', ShopkeeperSchema);