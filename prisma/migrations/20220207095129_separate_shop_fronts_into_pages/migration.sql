/*
  Warnings:

  - You are about to drop the column `shopFrontId` on the `shopEntities` table. All the data in the column will be lost.
  - Added the required column `shopFrontPageId` to the `shopEntities` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ShopPageType" AS ENUM ('HOME', 'NORMAL');

-- DropForeignKey
ALTER TABLE "shopEntities" DROP CONSTRAINT "shopEntities_shopFrontId_fkey";

-- AlterTable
ALTER TABLE "shopEntities" DROP COLUMN "shopFrontId",
ADD COLUMN     "shopFrontPageId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "ShopFrontPage" (
    "id" TEXT NOT NULL,
    "shopFrontId" TEXT NOT NULL,
    "type" "ShopPageType" NOT NULL,

    CONSTRAINT "ShopFrontPage_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ShopFrontPage" ADD CONSTRAINT "ShopFrontPage_shopFrontId_fkey" FOREIGN KEY ("shopFrontId") REFERENCES "shopFronts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shopEntities" ADD CONSTRAINT "shopEntities_shopFrontPageId_fkey" FOREIGN KEY ("shopFrontPageId") REFERENCES "ShopFrontPage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
