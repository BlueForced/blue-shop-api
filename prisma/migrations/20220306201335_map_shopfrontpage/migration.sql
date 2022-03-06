/*
  Warnings:

  - You are about to drop the `ShopFrontPage` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ShopFrontPage" DROP CONSTRAINT "ShopFrontPage_shopFrontId_fkey";

-- DropForeignKey
ALTER TABLE "shopEntities" DROP CONSTRAINT "shopEntities_shopFrontPageId_fkey";

-- DropTable
DROP TABLE "ShopFrontPage";

-- CreateTable
CREATE TABLE "shopFrontsPages" (
    "id" TEXT NOT NULL,
    "shopFrontId" TEXT NOT NULL,
    "type" "ShopPageType" NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "shopFrontsPages_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "shopFrontsPages" ADD CONSTRAINT "shopFrontsPages_shopFrontId_fkey" FOREIGN KEY ("shopFrontId") REFERENCES "shopFronts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shopEntities" ADD CONSTRAINT "shopEntities_shopFrontPageId_fkey" FOREIGN KEY ("shopFrontPageId") REFERENCES "shopFrontsPages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
