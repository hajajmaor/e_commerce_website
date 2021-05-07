import express from "express";
import controller from "../controllers/cart";

const router = express.Router();

router.delete("/remove_from_cart", controller.deleteOne);
router.purge("/remove_from_cart", controller.deleteOne);
// router.post("/create", controller);
// router.all("/get_data_about_product", controller.getOne);
// router.post("/update", controller.updateOne);
// router.put("/update", controller.updateOne);
router.get("/get_all", controller.getall);
router.post("/add_to_cart", controller.addToCart);
export = router;
