import prisma from '../lib/prisma.js';

const Seller = {
  shopFront: parent =>
    prisma.shopFront.findUnique({ where: { sellerId: parent.id } }),
  products: parent =>
    prisma.product.findMany({ where: { sellerId: parent.id } }),
  user: parent => prisma.user.findUnique({ where: { id: parent.userId } }),
};

export default Seller;
