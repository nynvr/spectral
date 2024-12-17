# Use an official Node runtime as the parent image
FROM node:20.18-slim

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY ./apps/web/app/package*.json ./

# Install dependencies
RUN npm install

# Copy the current directory contents into the container at /app
COPY ./apps/web/app ./
COPY ./deploy/web/web.development.run.sh /scripts/web.run.sh

RUN chmod +x /scripts/web.run.sh
CMD ["/scripts/web.run.sh"]