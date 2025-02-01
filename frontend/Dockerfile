# Dockerfile for frontend (Next.js)
FROM node:18

# Create app directory
WORKDIR /app

# Copy project dependencies
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy remaining project files
COPY . .

# Expose port
EXPOSE 3000

# Default command
CMD ["yarn", "dev"]
