# Use Node.js version 16 as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of your application code
COPY . .

# Build the application
RUN npm run build --prod

# Expose the port the app runs on (update to your application's port)
EXPOSE 4200

# Start the application (update this command according to how you serve your Angular app)
CMD ["npm", "start"]
