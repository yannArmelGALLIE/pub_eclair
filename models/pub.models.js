const mongoose = require('mongoose');

const PubSchema = new mongoose.Schema(
    {
        posterId : {
            type: String,
            required: true,
        },
        message: {
            type: String,
            trim: true,
            maxlength: 500,
        },
        picture : {
            type: String,
        },
        video: {
            type: String,
        },
    },
    {
        timestamps: true,
    }
)

module.exports = mongoose.model('pub', PubSchema);