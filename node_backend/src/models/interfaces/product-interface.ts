import { Document } from "mongoose";

export default interface IProduct extends Document {
    _id: string;
    title: string;
    price: number;
    description: string;
    image: string;
}