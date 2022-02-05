/*
  Warnings:

  - The primary key for the `sellers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[name]` on the table `sellers` will be added. If there are existing duplicate values, this will fail.
  - The required column `id` was added to the `sellers` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_sellerId_fkey";

-- DropForeignKey
ALTER TABLE "shopFronts" DROP CONSTRAINT "shopFronts_sellerId_fkey";

-- AlterTable
ALTER TABLE "sellers" DROP CONSTRAINT "sellers_pkey",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "sellers_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "sellers_name_key" ON "sellers"("name");

-- AddForeignKey
ALTER TABLE "shopFronts" ADD CONSTRAINT "shopFronts_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES "sellers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES "sellers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
