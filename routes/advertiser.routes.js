const router = require('express').Router();
const authController = require('../controllers/auth.controller');
const advertiserController = require('../controllers/advertiser.controller');

//auth
router.post("/register", authController.signUpAdvertiser);
router.post('/login', authController.signInAdvertiser);
router.get('/logout', authController.logoutAdvertiser);

// client display: 'block'
router.get('/', advertiserController.getAllAdvertisers);
router.get('/:id', advertiserController.advertiserInfo);
router.put('/:id', advertiserController.updateAdvertiser);
router.delete('/:id', advertiserController.deleteAdvertiser);

module.exports = router;