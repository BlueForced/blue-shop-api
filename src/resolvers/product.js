import prisma from '../lib/prisma.js';

const product = {
  seller: parent =>
    prisma.seller.findUnique({ where: { id: parent.sellerId } }),
  category: parent =>
    prisma.category.findUnique({ where: { id: parent.categoryId } }),
  media: parent =>
    prisma.productMedia.findMany({ where: { productId: parent.id } }),
  variants: parent =>
    prisma.product.findMany({
      where: { variantToId: parent.variantToId },
    }),
  questions: parent =>
    prisma.question.findUnique({ where: { productId: parent.id } }),
  orders: parent => prisma.orders.findMany({ where: { productId: parent.id } }),

  ratingScore: async parent => {
    return (
      await prisma.rating.aggregate({
        where: { productId: parent.id },
        _avg: {
          rating: true,
        },
      })
    )._avg.rating;
  },

  ratingCount: async parent => {
    return (
      await prisma.rating.aggregate({
        where: { productId: parent.id },
        _count: {
          rating: true,
        },
      })
    )._count.rating;
  },
};

export default product;
