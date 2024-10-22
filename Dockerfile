# Step 1: Build the Angular application
FROM node:16 AS build

WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build --prod

# Step 2: Use NGINX to serve the Angular application
FROM nginx:alpine

# Copy the built Angular application from the previous step
COPY --from=build /app/dist/meal-recommendation /usr/share/nginx/html

# Expose port 80 to make the app accessible
EXPOSE 80

# Run NGINX
CMD ["nginx", "-g", "daemon off;"]

