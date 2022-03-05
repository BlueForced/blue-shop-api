import prisma from '../lib/prisma.js';

const ShopFront = {
  pages: parent =>
    prisma.shopFrontPage.findMany({ where: { shopFrontId: parent.id } }),
};

export default ShopFront;
