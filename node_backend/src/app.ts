import express, { Application, json, urlencoded } from "express";
import mongoose from "mongoose";
import config from "./config/mongose-config";
// import bookRoutes from "./routes/book";
import morgan from "morgan";
import productRoutes from "./routes/product";
import cartRoutes from "./routes/cart";
import cors from "cors";
const app: Application = express();
const PORT = process.env.PORT || 3000;

mongoose
  .connect(config.url, config.options)
  .then(() => console.log("connected to mongodb"))
  .catch((err) => console.log(err.message, err));
app.use(cors());
app.use(
  urlencoded({
    extended: true,
  })
);
app.use(json());
app.use(morgan("combined"));

// /** Routes go here */
app.use("/api/product", productRoutes);
app.use("/api/cart", cartRoutes);
app.get("/", (_, res) => res.send("Hello World :)"));

app.listen(PORT, () => console.log(`listening on http://localhost:${PORT}`));
