/*
  Warnings:

  - A unique constraint covering the columns `[productId,userId]` on the table `ratings` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "ratings_productId_userId_key" ON "ratings"("productId", "userId");
