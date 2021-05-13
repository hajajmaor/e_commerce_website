import { Document } from "mongoose";
import Product from "./product";
import { Schema, model } from "mongoose";
import IProduct from "./interfaces/product-interface";
interface IReceipt extends Document {
  timestamp: Date;
  item: IProduct;
}

const ReceiptSchema: Schema = new Schema(
  {
    timestamp: { type: Date, required: true },
    item: { type: Product.schema, required: true },
  },
  {
    timestamps: true,
  }
);
export default model<IReceipt>("Receipt", ReceiptSchema, "receipt");
