# Use the official Node.js image as the base image
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build the Angular application
RUN npm run build --prod

# Use Nginx to serve the application
FROM nginx:alpine

# Copy the build artifacts from the previous stage to Nginx
COPY --from=build /app/dist/mealrecommendation-ui /usr/share/nginx/html

# Expose the port the app runs on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
