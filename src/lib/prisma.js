import Prisma from '@prisma/client';
const { PrismaClient } = Prisma;
const prisma = new PrismaClient();

prisma.$use(async (params, next) => {
  if (params.action === 'delete') {
    params.action = 'update';
    params.args.data = { isDeleted: true };
  } else if (params.action === 'deleteMany') {
    params.action = 'updateMany';
    if (params.args.data) {
      params.args.data.isDeleted = true;
    } else {
      params.args.data = { isDeleted: true };
    }
  } else if (params.action === 'findFirst') {
    params.args.where.isDeleted = false;
  } else if (params.action === 'findUnique') {
    params.action = 'findFirst';
    params.args.where.isDeleted = false;
  } else if (params.action === 'findMany') {
    if (!params.args) {
      params.args = { where: { isDeleted: false } };
    } else if (!params.args.where) {
      params.args.where = { isDeleted: false };
    } else {
      params.args.where.isDeleted = false;
    }
  }

  return next(params);
});

export default prisma;
