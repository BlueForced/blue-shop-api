import prisma from '../lib/prisma.js';

const Review = {
  user: parent =>
    prisma.rating.findFirst({ where: { id: parent.ratingId } }).user(),
  foundHelpfulBy: parent =>
    prisma.review.findFirst({ where: { id: parent.id } }).foundHelpfulBy()
      .length || 0,
  media: parent =>
    prisma.reviewMedia.findMany({ where: { reviewId: parent.id } }),
};

export default Review;
