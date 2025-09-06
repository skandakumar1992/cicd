# Use official Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first (for better layer caching)
COPY package*.json ./

# Install dependencies (use --only=production for lighter image if no dev deps needed)
RUN npm install --legacy-peer-deps

# Copy the rest of the source code
COPY . .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
