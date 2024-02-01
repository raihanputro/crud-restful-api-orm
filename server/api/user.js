const Router = require('express').Router();

const userHelper = require('../helpers/userHelper');
const { responseSuccess, responseError } = require('../helpers/responseHelper');
const { idValidation, userDataValidation } = require('../helpers/validationHelper');

const list = async ( req, res ) => {
    try {
        const response = await userHelper.getUserList();

        return responseSuccess(res, 200, 'Success get user list!', response);
    } catch (error) {
        return responseError(res, 404, 'Cannot get user list!');
    }
};

const listByRole = async ( req, res ) => {
    try {
        const role = req.params['role'].toLowerCase();

        const response = await userHelper.getUserListByRole(role);

        return responseSuccess(res, 200, `Success get user list by role ${role}!`, response);
    } catch (error) {
        return responseError(res, 404, `Cannot get user list! by role ${role}!`);
    }
};

const detail = async ( req, res ) => {
    try {

        idValidation(req.params);

        const id = parseInt(req.params['id']);

        const response = await userHelper.getUserDetail(id);

        return responseSuccess(res, 200, 'Success get user detail!', response);
    } catch (error) {
        return responseError(res, 404, 'Cannot get user detail!');
    }
};

const add = async ( req, res ) => {
    try {
        userDataValidation(req.body);

        const { email, password, username, address, phone, role } = req.body;

        const response = await userHelper.postDataUser({ email, password, username, address, phone, role });

        return responseSuccess(res, 200, 'Success add user!', response);
    } catch (error) {
        return responseError(res, 404, 'Cannot add user!');
    }
};

const update = async ( req, res ) => {
    try {
        idValidation(req.params);

        const id = parseInt(req.params['id']);

        const { email, password, username, address, phone, role } = req.body;

        const response = await userHelper.updateDataUser({id, email, password, username, address, phone, role });

        return responseSuccess(res, 200, 'Success update user!', response);
    } catch (error) {
        return responseError(res, 404, 'Cannot update user!');
    }
}

const remove = async ( req, res ) => {
    try {
        idValidation(req.params);

        const id = parseInt(req.params['id']);

        const response = await userHelper.deleteDataUser(id);

        return responseSuccess(res, 200, 'Success remove user!', response);
    } catch (error) {
        return responseError(res, 404, 'Cannot remove user!');
    }
};

Router.get('/', list);
Router.get('/role/:role', listByRole);
Router.get('/detail/:id', detail);
Router.post('/add', add);
Router.put('/update/:id', update);
Router.delete('/remove/:id', remove);

module.exports = Router;