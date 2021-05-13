import express from "express";
import controller from "../controllers/cart";

const router = express.Router();

router.delete("/remove_from_cart", controller.deleteOne);
router.purge("/remove_from_cart", controller.deleteOne);
router.get("/get_all", controller.getall);
router.post("/add_to_cart", controller.addToCart);
router.post("/buy", controller.buyCart);
router.get("/buy", controller.buyCart);
// app.route("/image").allOf(["post", "put"], function (req, res) {
export = router;
