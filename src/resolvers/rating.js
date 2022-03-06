import prisma from '../lib/prisma.js';

const Rating = {
  review: parent => prisma.review.findFirst({ where: { ratingId: parent.id } }),
};

export default Rating;
