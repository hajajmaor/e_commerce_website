import { Document, Types } from "mongoose";
interface IProduct extends Document {
    title: string;
    price: number;
    description: string;
    image: string;
}
import { Schema, model } from "mongoose";

const ProductSchema: Schema = new Schema(
    {
        title: { type: String, required: true },
        price: { type: Number, required: true, min: [0, 'Must be positive'] },
        description: { type: String, required: true },
        image: {
            type: String,
            required: function (this: IProduct) {
                return this.image.match(urlRegex);
            }
        }
    },
    {
        timestamps: true
    }
);
ProductSchema.index({ title: 1 }, { unique: true });
export default model<IProduct>('Product', ProductSchema);