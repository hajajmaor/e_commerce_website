import express from "express";
import controller from "../controllers/cart";

const router = express.Router();

router.delete("/remove", controller.deleteOne);
router.purge("/remove", controller.deleteOne);
// router.post("/create", controller);
// router.all("/get_data_about_product", controller.getOne);
// router.post("/update", controller.updateOne);
// router.put("/update", controller.updateOne);
router.get("/get_all", controller.getall);

export = router;
