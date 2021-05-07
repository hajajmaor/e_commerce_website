import { Document } from "mongoose";

export default interface IProduct extends Document {
    title: string;
    price: number;
    description: string;
    image: string;
}