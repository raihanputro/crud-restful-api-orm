const Router = require('express').Router();

const cartHelper = require('../helpers/cartHelper');
const { responseError } = require('../helpers/responseHelper');
const { idValidation, cartDataValidation } = require('../helpers/validationHelper');

const list = async ( req, res ) => {
    try {
        const response = await cartHelper.getCartList(res);

        return response;   
    } catch (error) {
        return responseError(res, 404, 'Cannot get item list!');
    }
};

const detail = async ( req, res ) => {

    idValidation(req.params);

    const id = parseInt(req.params['id']);

    try {
        const response = await cartHelper.getCartDetail(id, res);

        return response;   
    } catch (error) {
        return responseError(res, 404, `Cannot get cart detail with id ${id}!`);
    }
};

const add = async ( req, res ) => {
    try {
        cartDataValidation(req.body);

        const { user_id, item_id, qty } = req.body;

        const response = await cartHelper.postDataCart({ user_id, item_id, qty }, res);

        return response;   
    } catch (error) {
        return responseError(res, 404, `Cannot add cart!`);
    }
};

const update = async ( req, res ) => {

    idValidation(req.params);

    const id = parseInt(req.params['id']);

    try {
        cartDataValidation(req.body);
        const { user_id, item_id, qty } = req.body;

        const response = await cartHelper.updateDataCart({ id, user_id, item_id, qty }, res);

        return response;   
    } catch (error) {
        return responseError(res, 404, `Cannot find cart with id ${id}!`);
    }
};

const remove = async ( req, res ) => {

    idValidation(req.params);

    const id = parseInt(req.params['id']);

    try {
        const response = await cartHelper.deleteDataCart(id, res);

        return response;   
    } catch (error) {
        return responseError(res, 404, `Cannot find cart with id ${id}!`);
    }
}


Router.get('/', list);
Router.get('/detail/:id', detail);
Router.post('/add', add);
Router.put('/update/:id', update);
Router.delete('/remove/:id', remove)

module.exports = Router; 