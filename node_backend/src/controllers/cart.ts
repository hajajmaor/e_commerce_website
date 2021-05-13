import { NextFunction, Request, Response } from "express";
import Cart from "../models/cart";
import Product from "../models/product";
import Receipt from "../models/receipt";
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
  let { oid } = req.body;
  Cart.deleteOne({
    "item._id": oid,
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

const addToCart = (req: Request, res: Response) => {
  let { oid } = req.body;
  Product.findOne({ _id: oid })
    .then((prod) => {
      const itemCart = new Cart({
        item: prod,
      });
      itemCart
        .save()
        .then((result) =>
          res.status(201).json({
            book: result,
          })
        )
        .catch((err) => {
          console.log(err);

          res.status(500).json({
            message: err.message,
            err,
          });
        });
    })
    .catch((err) =>
      res.status(500).json({
        message: err.message,
        err,
      })
    );
};

const buyCart = async (_: Request, res: Response) => {
  const timeNow = Date.now();
  const items = await Cart.find().exec();
  const cartItems = items.map((item) => item.item);
  const itemsToInsert = cartItems.map(
    (item) => new Receipt({ timestamp: timeNow, item: item })
  );
  Receipt.insertMany(itemsToInsert, { ordered: false })
    .then(async (_) => {
      await Cart.deleteMany({});
      res.status(200).json();
    })
    .catch((err) =>
      res.status(500).json({
        message: err.message,
        err,
      })
    );
};

export default { getall, deleteOne, addToCart, buyCart };
