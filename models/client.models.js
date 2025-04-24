const mongoose = require('mongoose');
const { isEmail} = require('validator');
const bcrypt = require('bcrypt');

const ClientSchema = new mongoose.Schema(
    {
        name : {
            type: String,
            required: true,
            minLength: 3,
            maxLength: 55,
            unique: true,
            trim: true
        },
        surname : {
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
ClientSchema.pre("save", async function name(next) {
        const salt = await bcrypt.genSalt();
        this.password = await bcrypt.hash(this.password, salt);
        next();
})

ClientSchema.statics.login = async function name(email, password) {
    const client = await this.findOne({ email });
    if (user) {
        const auth = await bcrypt.compare(password, client.password);
        if (auth) {
            return client;
        }
        throw Error('incorrect password');
    }
    throw Error('incorrect email')
};

module.exports = mongoose.model('client', ClientSchema);