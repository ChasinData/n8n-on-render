FROM node:18

# Set working directory
WORKDIR /app

# Copy full monorepo into the image
COPY . .

# Install global tools
RUN npm install -g pnpm lerna

# Install and link packages
RUN pnpm install
RUN pnpm run build

# Expose default port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
