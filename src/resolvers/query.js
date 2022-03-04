import prisma from '../lib/prisma.js';

const query = {
  products: () => prisma.product.findMany(),
  users: () => prisma.user.findMany(),
  sellers: () => prisma.seller.findMany(),
  user: (_parent, args) =>
    prisma.product.findUnique({ where: { id: args.id } }),
  product: (_parent, args) =>
    prisma.seller.findUnique({ where: { id: args.id } }),
  seller: (_parent, args) =>
    prisma.seller.findUnique({ where: { id: args.id } }),
};

export default query;
