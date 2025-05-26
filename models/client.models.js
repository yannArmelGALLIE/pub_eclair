const mongoose = require('mongoose');
const { isEmail, trim} = require('validator');
const bcrypt = require('bcrypt');

const ClientSchema = new mongoose.Schema(
    {
        lastName : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            trim: true
        },
        firstname : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
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
        phoneNumber: {
            type: String,
            required: true,
            minLength: 8,
            maxLength: 20,
            unique: true,
            trim: true,
        },
        password: {
            type: String,
            required: true,
            max: 1024,
            minLength: 8,
        }, 
    },
    {
        timestamps: true,
    }
);
ClientSchema.pre("save", async function name(next) {
        const salt = await bcrypt.genSalt();
        this.password = await bcrypt.hash(this.password, salt);
        next();
})

ClientSchema.statics.login = async function name(email, password) {
    const client = await this.findOne({ email });
    if (client) {
        const auth = await bcrypt.compare(password, client.password);
        if (auth) {
            return client;
        }
        throw Error('incorrect password');
    }
    throw Error('incorrect email')
};

module.exports = mongoose.model('client', ClientSchema);