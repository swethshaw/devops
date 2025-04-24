
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY src/ /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]