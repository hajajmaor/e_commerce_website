import { Document } from "mongoose";
import Product from "./product";
interface ICart extends Document {
    item: IProduct;
}
import { Schema, model } from "mongoose";
import IProduct from "./interfaces/product-interface";

const CartSchema: Schema = new Schema(
    {
        item: { type: Product.schema, required: true }
    },
    {
        timestamps: true
    }
);
export default model<ICart>('Cart', CartSchema, 'cart');