import prisma from '../lib/prisma.js';

const ShopFrontPage = {
  entities: parent =>
    prisma.shopEntity.findMany({ where: { shopFrontPageId: parent.id } }),
};

export default ShopFrontPage;
