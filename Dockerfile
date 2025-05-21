# Use official Nginx image as base
FROM nginx:alpine

# Remove default Nginx website content
RUN rm -rf /usr/share/nginx/html/*

# Copy your build folder contents into Nginx html directory
COPY build/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]