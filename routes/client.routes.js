const router = require('express').Router();
const authController = require('../controllers/auth.controller');
const clientController = require('../controllers/client.controller');

//auth
router.post("/register", authController.signUpClient);
router.post('/login', authController.signInClient);
router.get('/logout', authController.logoutClient);

// client display: 'block'
router.get('/', clientController.getAllClients);
router.get('/:id', clientController.clientInfo);
router.put('/:id', clientController.updateClient);
router.delete('/:id', clientController.deleteClient);

module.exports = router;