# Use a Node.js 16 base image with a Linux-based environment
FROM node:16

# Set the working directory inside the container to /app
# All subsequent instructions will use this directory
WORKDIR /app

# Copy package.json from the local project into /app
# Copying dependencies first before installing can improve build caching
COPY package.json .

# Install the dependencies listed in package.json during the image build
RUN npm install package.json

# Copy all application files from local directory into container
COPY . .

# Expose port 3000. Document that the application uses port 3000
EXPOSE 3000

# Run the application when the container starts
CMD ["npm", "start"]