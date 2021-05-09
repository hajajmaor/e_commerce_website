import { ConnectOptions } from "mongoose";

const options: ConnectOptions = {
  dbName: "e_comm",
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useCreateIndex: true,
  useFindAndModify: false,
  autoIndex: true, // Don't build indexes
  poolSize: 10, // Maintain up to 10 socket connections
  serverSelectionTimeoutMS: 5000, // Keep trying to send operations for 5 seconds
  socketTimeoutMS: 45000, // Close sockets after 45 seconds of inactivity
  family: 4, // Use IPv4, skip trying IPv6
};

let mongo_config = {
  options: options,
  url: `mongodb://database:27017/`,
};

export default mongo_config;
