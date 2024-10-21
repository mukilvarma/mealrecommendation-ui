# Use the official Node.js image as the base image
FROM node:18 AS build

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies with legacy-peer-deps
RUN npm install --legacy-peer-deps

# Copy the rest of your application code
COPY . .

# Build the application
RUN npm run build --prod

# Use NGINX for serving the app
FROM nginx:alpine

# Copy build files to NGINX
COPY --from=build /app/dist/your-app-name /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
