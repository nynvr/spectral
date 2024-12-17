FROM nginx:1.27-alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx configuration
COPY ./deploy/nginx/nginx.development.default.conf /etc/nginx/conf.d/default.conf