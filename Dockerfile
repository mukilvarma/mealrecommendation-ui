# Base image
FROM node:16 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN npm run build --prod

# Serve the application
FROM nginx:alpine
COPY --from=build /app/dist/meal-recommendation /usr/share/nginx/html

# Expose port
EXPOSE 4200

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]
