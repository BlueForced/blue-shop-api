import prisma from '../lib/prisma.js';

const Answer = {
  author: parent => prisma.user.findFirst({ where: { id: parent.authorId } }),
  userVote: () => {}, //implement this when authorization is added
  votesNumber: async parent => {
    const votes = await prisma.answerVotes.findMany({
      where: { answerId: parent.id },
    });
    let totalVote = 0;
    votes.forEach(vote => (vote.isUpvote ? totalVote++ : totalVote--));
    return totalVote;
  },
};

export default Answer;
