import { NextFunction, Request, Response } from "express";
import Product from "../models/product";
// import mongoose from "mongoose";
const getall = (_: Request, res: Response, __: NextFunction) => {
    Product.find()
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
    Product.deleteOne({
        _id: req.body.oid,
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

const updateOne = (req: Request, res: Response, _: NextFunction) => {
    Product.updateOne({
        _id: req.body.oid,
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

const createNewProduct = (req: Request, res: Response, _: NextFunction) => {
    let { title, price, description, image } = req.body;

    const prod = new Product({
        title,
        price,
        description,
        image,
    });
    prod
        .save()
        .then((result) =>
            res.status(201).json({
                book: result,
            })
        )
        .catch((err) =>
            res.status(500).json({
                message: err.message,
                err,
            })
        );
};

const getOne = (req: Request, res: Response, _: NextFunction) => {
    Product.findOne({ _id: req.body.oid })
        .then((prod) => res.status(200).json(prod))
        .catch((err) => {
            console.log(err);
            res.status(500).json({
                message: err.message,
                err,
            });
        });
};

export default { getall, deleteOne, updateOne, createNewProduct, getOne };
