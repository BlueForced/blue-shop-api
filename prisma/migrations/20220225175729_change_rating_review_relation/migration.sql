/*
  Warnings:

  - You are about to drop the column `reviewId` on the `ratings` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[ratingId]` on the table `reviews` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `ratingId` to the `reviews` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ratings" DROP CONSTRAINT "ratings_reviewId_fkey";

-- DropIndex
DROP INDEX "ratings_reviewId_key";

-- AlterTable
ALTER TABLE "ratings" DROP COLUMN "reviewId";

-- AlterTable
ALTER TABLE "reviews" ADD COLUMN     "ratingId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "reviews_ratingId_key" ON "reviews"("ratingId");

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_ratingId_fkey" FOREIGN KEY ("ratingId") REFERENCES "ratings"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
