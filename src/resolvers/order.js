import prisma from '../lib/prisma.js';

const Order = {
  placedBy: parent => prisma.user.findFirst({ where: { id: parent.userId } }),
  shippingAddress: parent =>
    prisma.address.findFirst({ where: { id: parent.addressId } }),
  orderItems: parent =>
    prisma.orderItems.findFirst({ where: { orderId: parent.id } }).products(),
  fees: parent => prisma.orderFees.findFirst({ where: { orderId: parent.id } }),
  paymentMethod: parent =>
    prisma.paymentMethod.findFirst({ where: { id: parent.paymentMethodId } }),
};

export default Order;
