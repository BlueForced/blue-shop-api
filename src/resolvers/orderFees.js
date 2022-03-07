import prisma from '../lib/prisma.js';

const OrderFees = {
  promotionsUsed: parent =>
    prisma.promotionUses.findMany({ where: { orderFeesId: parent.id } }),
};

export default OrderFees;
