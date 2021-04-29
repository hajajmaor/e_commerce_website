import { Document } from "mongoose";
import IProduct from "./product"
interface ICart extends Document {
    item: typeof IProduct;
}
import { Schema, model } from "mongoose";

const CartSchema: Schema = new Schema(
    {
        item: { type: IProduct, required: true }
        // title: { type: String, required: true },
        // price: { type: Number, required: true, min: [0, 'Must be positive'] },
        // description: { type: String, required: true },
        // image: {
        //     type: String,
        //     required: function (this: IProduct) {
        //         return this.image.match(urlRegex);
        //     }
        // }
    },
    {
        timestamps: true
    }
);
// ProductSchema.index({ title: 1 }, { unique: true });
export default model<ICart>('Cart', CartSchema);