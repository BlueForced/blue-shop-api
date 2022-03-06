import prisma from '../lib/prisma.js';

const ProductCategory = {
  products: parent =>
    prisma.product.findMany({ where: { categoryId: parent.id } }),
};

export default ProductCategory;
