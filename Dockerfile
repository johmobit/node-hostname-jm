# Use a slim LTS version of Node
FROM node:20-slim

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy source code
COPY . .

# App runs on 8080 by default in many cloud setups
ENV PORT=8080
EXPOSE 8080

USER node

CMD [ "npm", "start" ]
