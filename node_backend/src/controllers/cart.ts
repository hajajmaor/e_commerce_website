import { NextFunction, Request, Response } from "express";
import Cart from "../models/cart";
import mongoose from "mongoose";

const getall = (_: Request, res: Response, __: NextFunction) => {
    Cart.find()
        .exec()
        .then((results) => res.status(200).send(results))
        .catch((err) => {
            console.log(err);
            res.status(500).json({
                message: err.message,
                err,
            });
        });
};
//TODO: get the oid, get the product, send to this function as body
const deleteOne = (req: Request, res: Response, _: NextFunction) => {
    Cart.deleteOne({
        item: req.body
    })
        .then((_) => res.status(200))
        .catch((err) => {
            console.log(err);
            res.status(500).json({
                message: err.message,
                err,
            });
        });
};


export default { getall, deleteOne, };
