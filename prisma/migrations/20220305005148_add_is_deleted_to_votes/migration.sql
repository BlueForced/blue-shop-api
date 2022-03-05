-- AlterTable
ALTER TABLE "answersVotes" ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "questionsVotes" ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false;
