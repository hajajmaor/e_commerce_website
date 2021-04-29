import { NextFunction, Request, Response } from "express";
import Cart from "../models/cart";
import Product from "../models/product";
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
const deleteOne = (req: Request, res: Response, _: NextFunction) => {
    let { oid } = req.body
    Cart.deleteOne({
        "item._id": oid
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

const addToCart = (req: Request, res: Response, _: NextFunction) => {
    let { oid } = req.body;
    Product.findOne({ _id: mongoose.Types.ObjectId(oid) })
        .then((prod) => {
            const item = new Cart({
                item: prod
            });
            item.save()
                .then((result) =>
                    res.status(201).json({
                        book: result,
                    })
                )
                .catch((err) =>
                    res.status(500).json({
                        message: err.message,
                        err,
                    }))
        }).catch((err) =>
            res.status(500).json({
                message: err.message,
                err,
            }));

};
export default { getall, deleteOne, addToCart };
