import prisma from '../lib/prisma.js';

const User = {
  ratings: parent => prisma.rating.findMany({ where: { userId: parent.id } }),
  questions: parent =>
    prisma.question.findMany({ where: { authorId: parent.id } }),
  answers: parent => prisma.answer.findMany({ where: { authorId: parent.id } }),
  orders: parent => prisma.order.findMany({ where: { userId: parent.id } }),
  addresses: parent =>
    prisma.address.findMany({ where: { userId: parent.id } }),
  sellerAccount: parent =>
    prisma.seller.findFirst({ where: { userId: parent.id } }),
  shoppingCart: parent =>
    prisma.cartItem.findMany({ where: { userId: parent.id } }),
};

export default User;
