-- CreateTable
CREATE TABLE "promotionsUses" (
    "id" TEXT NOT NULL,
    "promotionId" TEXT NOT NULL,
    "orderFeesId" TEXT NOT NULL,

    CONSTRAINT "promotionsUses_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "promotionsUses" ADD CONSTRAINT "promotionsUses_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES "promotions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotionsUses" ADD CONSTRAINT "promotionsUses_orderFeesId_fkey" FOREIGN KEY ("orderFeesId") REFERENCES "ordersFees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
