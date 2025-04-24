const router = require('express').Router();
const authController = require('../controllers/auth.controller');
const shopkeeperController = require('../controllers/shopkeeper.controller');

//auth
router.post("/register", authController.signUpShopkeeper);
router.post('/login', authController.signInShopkeeper);
router.get('/logout', authController.logoutShopkeeper);

// client display: 'block'
router.get('/', shopkeeperController.getAllShopkeeper);
router.get('/:id', shopkeeperController.shopkeeperInfo);
router.put('/:id', shopkeeperController.updateShopkeeper);
router.delete('/:id', shopkeeperController.deleteShopkeeper);

module.exports = router;