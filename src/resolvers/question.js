import prisma from '../lib/prisma.js';

const Question = {
  author: parent => prisma.user.findFirst({ where: { id: parent.authorId } }),
  userVote: () => {}, //implement this when authorization is added
  votesNumber: async parent => {
    const votes = await prisma.questionVotes.findMany({
      where: { questionId: parent.id },
    });
    let totalVote = 0;
    votes.forEach(vote => (vote.isUpvote ? totalVote++ : totalVote--));
    return totalVote;
  },
  answers: parent =>
    prisma.answer.findMany({ where: { questionId: parent.id } }),
};

export default Question;
