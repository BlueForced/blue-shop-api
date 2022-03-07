/*
  Warnings:

  - You are about to drop the `OrderItems` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "OrderItems" DROP CONSTRAINT "OrderItems_orderId_fkey";

-- DropForeignKey
ALTER TABLE "_OrderItemsToProduct" DROP CONSTRAINT "_OrderItemsToProduct_A_fkey";

-- DropTable
DROP TABLE "OrderItems";

-- CreateTable
CREATE TABLE "ordersItems" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,

    CONSTRAINT "ordersItems_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ordersItems" ADD CONSTRAINT "ordersItems_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderItemsToProduct" ADD FOREIGN KEY ("A") REFERENCES "ordersItems"("id") ON DELETE CASCADE ON UPDATE CASCADE;
