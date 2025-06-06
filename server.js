const app = require("./app");
const {checkClient, checkAdvertiser, requireAuth} = require('./middleware/auth.middleware');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const clientRoutes = require('./routes/client.routes');
const advertiserRoutes = require('./routes/advertiser.routes');
const cors = require('cors');
require("dotenv").config({path: './config/.env'});
require('./config/db');


const corsOptions = {
    origin : process.env.CLIENT_URL,
    credentials : true,
    'allowedHeaders': ['sessionId', 'content-Type'],
    'exposedHeaders': ['sessionId'],
    'methods': 'GET,HEAD,PUT,PATCH,POST,DELETE',
    'preflightContinue': false
}

app.use(cors(corsOptions));


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : true}));
app.use(cookieParser());

// jwt
app.get('*', checkClient);
app.get('*', checkAdvertiser);
app.get('/jwtid', requireAuth, (req, res) => {
    res.status(200).send(res.locals.client._id)
});
app.get('/jwtid', requireAuth, (req, res) => {
    res.status(200).send(res.locals.advertiser._id)
});

// Routes
app.use('/api/client', clientRoutes);
app.use('/api/advertiser', advertiserRoutes);


//server
app.listen(process.env.PORT, () => {
    console.log(`Server Listening on port http://localhost:${process.env.PORT}`);
})