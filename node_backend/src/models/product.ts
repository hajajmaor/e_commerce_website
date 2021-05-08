import IProduct from "./interfaces/product-interface";
import { Schema, model } from "mongoose";
import urlRegex from "../config/regexs";

const ProductSchema: Schema = new Schema(
    {
        title: { type: String, required: true },
        price: { type: Number, required: true, min: [0, 'Must be positive'] },
        description: { type: String, required: true },
        image: {
            type: String,
            required: true
            // function (this: IProduct) {
            //     return this.image.match(urlRegex);
            // }
        }
    },
    {
        timestamps: true
    }
);
ProductSchema.index({ title: 1 }, { unique: true });
export default model<IProduct>('Product', ProductSchema, 'product');
