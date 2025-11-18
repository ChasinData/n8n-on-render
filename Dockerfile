FROM node:18

WORKDIR /app
COPY . .

# Install lerna globally
RUN npm install -g lerna

# Install deps and bootstrap monorepo
RUN npm install
RUN lerna bootstrap

# Build packages
RUN npm run build

# Expose and run
EXPOSE 5678
CMD ["npm", "run", "start"]
