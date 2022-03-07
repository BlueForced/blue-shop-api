import prisma from '../lib/prisma.js';

const PromotionUses = {
  promotion: parent =>
    prisma.promotion.findFirst({ where: { id: parent.promotionId } }),
};

export default PromotionUses;
