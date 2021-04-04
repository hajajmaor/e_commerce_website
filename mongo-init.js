// conn = new Mongo();
db = db.getSiblingDB('e_comm');
db.product.insertMany([
    {
        "title": "Milk",
        "price": 5.5,
        "description": "Milk box 1 liter",
        "image_url": "https://images.theconversation.com/files/380230/original/file-20210122-19-14xvflf.jpg"
    },
    {
        "title": "Chocolate",
        "price": 8,
        "description": "Chocolate box 1 KG",
        "image_url": "http://www.bakerssupplies.pk/image/cache/Bakware%202/others/new/gcb-600x600.jpg"
    },
    {
        "title": "6 Pack of water",
        "price": 13,
        "description": "6 Pack of 2 liter water bottels",
        "image_url": "https://images-na.ssl-images-amazon.com/images/I/71vOQZRq-nL._SL1000_.jpg"
    },
    {
        "title": "Suger",
        "price": 3,
        "description": "1 KG of sugar",
        "image_url": "https://www.foodbusinessnews.net/ext/resources/2020/4/WoodenSpoonSugar_Lead.jpg"
    },
    {
        "title": "phone charget",
        "price": "30",
        "description": "5V 2A charger",
        "image": "https://www.maxbhi.com/images/detailed/31/charger-for-blu-studio-mini-lte-usb-mobile-phone-wall-charger-maxbhi-5-3-1.jpg"
    }
], { ordered: false });