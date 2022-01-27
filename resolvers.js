const greetings = [
  {
    name: 'john',
    greeting: 'Hi',
  },
  {
    name: 'alexander',
    greeting: 'Hey',
  },
  {
    name: 'jason',
    greeting: 'Hello',
  },
];

const resolvers = {
  Query: {
    greetings: () => greetings,
  },
};

export default resolvers;
