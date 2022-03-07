import prisma from '../lib/prisma.js';

const Address = {
  orders: parent => prisma.order.findMany({ where: { addressId: parent.id } }),
};

export default Address;
