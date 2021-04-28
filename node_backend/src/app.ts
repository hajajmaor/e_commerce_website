import express, { Application, json } from "express";
// import mongoose from "mongoose";
// import config from "./config/mongose-config";
// import bookRoutes from "./routes/book";
import morgan from "morgan";

const app: Application = express();
const PORT = process.env.PORT || 3000;

// mongoose.connect(config.url, config.options)
//     .then(() => console.log("connected to mongodb"))
//     .catch(err => console.log(err.message, err))
//     ;

app.use(json());
app.use(morgan('combined'))


// /** Routes go here */
// app.use('/api/books', bookRoutes);



app.get('/', (_, res) =>
    res.send('Hello World :)')
);

app.listen(PORT, () => console.log(`listening on http://localhost:${PORT}`));

